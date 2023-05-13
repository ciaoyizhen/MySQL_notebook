USE xiaohaizi;

SET @a = 1;
SELECT @a;

SET @b = @a;


SET @result = (SELECT name FROM student_info LIMIT 1);
SELECT @result;


SELECT m1, n1 FROM t1
LIMIT 1
INTO @a, @b;
SELECT @a, @b;



SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER ;
CREATE FUNCTION avg_score(s VARCHAR(100))
RETURNS DOUBLE
BEGIN
    RETURN (SELECT AVG(score)
            FROM student_score 
            WHERE subject = s);
END ;

SELECT avg_score("MySQL是怎样运行的");

DROP Function avg_score;


SHOW FUNCTION STATUS LIKE 'avg%';

SHOW CREATE FUNCTION avg_score;


DROP FUNCTION avg_score;

SET GLOBAL log_bin_trust_function_creators = 1;
CREATE FUNCTION var_demo()
RETURNS INT
BEGIN
    DECLARE c INT;
    -- SET c = 5;
    RETURN c;
END;

SELECT var_demo();

DROP FUNCTION var_demo;


CREATE FUNCTION user_defined_var_demo()
RETURNS INT
BEGIN
    SET @abc = 10;
    RETURN @abc;
END;

SELECT user_defined_var_demo();

DELIMITER ;
CREATE FUNCTION condition_demo(i INT)
RETURNS VARCHAR(10)
BEGIN
    DECLARE result VARCHAR(10);
    IF i = 1 THEN
        SET result = "结果是1";
    ELSEIF i = 2 THEN
        SET result = "结果是2";
    ELSE
        SET result = "非法参数";
    END IF;
    RETURN result;
END ;

SELECT condition_demo(1);


CREATE FUNCTION sum_all(n INT UNSIGNED)
RETURNS INT
BEGIN
    DECLARE result INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    WHILE i <= n DO
        SET result = result + i;
        SET i = i+1;
    END WHILE;
    RETURN result;
END;

SELECT sum_all(10);

DROP FUNCTION IF EXISTS sum_all;
CREATE FUNCTION sum_all(n INT)
RETURNS INT
BEGIN
    DECLARE result INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    REPEAT
        SET result = result + i;
        SET i = i+1;
    UNTIL i > n END REPEAT;
    RETURN result;
END ;

SELECT sum_all(10);


DROP FUNCTION IF EXISTS sum_all;
CREATE FUNCTION sum_all(n INT)
RETURNS INT
BEGIN
    DECLARE result INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    LOOP
        IF i>n THEN
            RETURN result;
        END IF;
        SET result = result + i;
        SET i = i + 1;
    END LOOP;
END ;

SELECT sum_all(10);

SHOW FUNCTION STATUS LIKE "sum_%";


DROP FUNCTION IF EXISTS sum_all;
CREATE FUNCTION IF NOT EXISTS sum_all(n INT)
RETURNS INT
BEGIN
    DECLARE result INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    flag:LOOP  # 给循环取别名 方便控制
        IF i>n THEN
            LEAVE flag;
        END IF;
        SET result = result + i;
        SET i = i + 1;
        END LOOP flag;
    RETURN result;
END ;

SELECT sum_all(10);
DROP PROCEDURE t1_operation;
CREATE PROCEDURE t1_operation(
    m1_value INT,
    n1_value CHAR(1)
)
BEGIN
    SELECT * from t1;
    INSERT INTO t1 VALUES (m1_value, n1_value);
    SELECT * from t1;
END ;

CALL t1_operation(1, "酷");

DROP PROCEDURE p_inout;
CREATE PROCEDURE p_in(IN arg INT)
BEGIN
    SELECT arg;
    SET arg = 2;
END;

CALL p_in(50);

CREATE PROCEDURE p_out(out arg INT)
BEGIN
    SET arg = 2;
END;

SET @a = 1;
CALL p_out(@a);
SELECT @a;

CREATE PROCEDURE p_inout(INOUT arg INT)
BEGIN
    SELECT arg;
    SET arg = 2;
END;

SET @a = 1;
CALL p_inout(@a);
SELECT @a;


DROP PROCEDURE get_score_data;
CREATE PROCEDURE get_score_data(
    OUT max_score DOUBLE,
    OUT min_score DOUBLE,
    OUT avg_score DOUBLE,
    IN s VARCHAR(30)
)
BEGIN
    SELECT MAX(score), MIN(score), AVG(score)
    FROM student_score WHERE subject = s
    INTO max_score, min_score, avg_score;
END;
DROP PROCEDURE IF EXISTS get_score_Data;
SET @a=1, @b=1, @c=1;
CALL get_score_data(@a, @b, @c, "MySQL是怎样运行的");

SELECT @a, @b, @c;

DROP PROCEDURE IF EXISTS cursor_demo;
CREATE PROCEDURE IF NOT EXISTS cursor_demo()
BEGIN
    DECLARE m_value INT;
    DECLARE n_value CHAR(1);
    DECLARE result_len INT;
    DECLARE i INT DEFAULT 1;

    DECLARE t1_record_cursor CURSOR FOR
    SELECT m1, n1 FROM t1;
    SELECT COUNT(1) FROM t1 INTO result_len;

    OPEN t1_record_cursor;

    WHILE i<result_len  DO
        FETCH t1_record_cursor INTO m_value, n_value;
        SELECT m_value, n_value;
        SET i = i+1;
    END WHILE;
    CLOSE t1_record_cursor;
END;

CALL cursor_demo();

DROP TRIGGER bi_t1;
CREATE TRIGGER bi_t1
BEFORE INSERT ON t1
FOR EACH ROW
BEGIN
    IF NEW.m1 < 1 THEN
        SET NEW.m1 = 1;
    ELSEIF NEW.m1 > 10 THEN
        SET NEW.m1 = 10;
    END IF;
END ;

INSERT INTO t1 VALUES
(0, "小"),
(15, "大"),
(9, "正");

SELECT * FROM t1;


CREATE EVENT insert_t1_event
ON SCHEDULE
AT "2023-05-14 14:36:00"
DO
BEGIN
    INSERT INTO t1 VALUES (9, "事");
END;

SELECT * FROM t1;
DROP EVENT IF EXISTS insert_t1_event;
CREATE EVENT IF NOT EXISTS insert_t1_event
ON SCHEDULE
EVERY 1 MINUTE 
STARTS "2023-05-14 14:41:00"
ENDS "2023-05-14 14:42:00"
DO
BEGIN
    INSERT INTO t1 VALUES(5, "段");
END;

SHOW EVENTS;

SHOW TRIGGERS;

