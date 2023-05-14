USE xiaohaizi;

SELECT  *
FROM first_table;
INSERT INTO first_table (first_column , second_column) VALUES (1 , 'aaa');
INSERT INTO first_table (first_column) VALUES(2);
INSERT INTO first_table (second_column) VALUES ('ccc');


INSERT INTO first_table VALUES 
(4, 'ddd'), 
(5, 'eee'), 
(6, 'fff');

DROP TABLE new_table;
CREATE TABLE new_table (
    first_column INT,
    second_column VARCHAR(10) DEFAULT 'abc'
) COMMENT  '列的属性';


INSERT INTO new_table(first_column) VALUES(1);
SELECT * FROM new_table;

ALTER TABLE new_table MODIFY first_column INT NOT NULL;
INSERT INTO new_table VALUES (NULL, 'aaa');


SHOW TABLES FROM xiaohaizi;
DROP TABLE IF EXISTS student_info, student_score;
CREATE TABLE student_info(
    number INT PRIMARY KEY,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(20),
    major VARCHAR(20),
    enrollment_time DATE
) COMMENT '学生信息表';

DROP TABLE IF EXISTS student_info;
CREATE TABLE student_info(
    number INT,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(20),
    major VARCHAR(20),
    enrollment_time DATE,
    PRIMARY KEY(number)
) COMMENT '学生信息表';



CREATE TABLE student_score(
    number INT,
    subject VARCHAR(20),
    score TINYINT,
    PRIMARY KEY(number, subject)
) COMMENT '学生分数表';

INSERT INTO student_info(numbers) VALUES (NULL);


DROP TABLE IF EXISTS student_info;
CREATE TABLE student_info(
    number INT,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18) UNIQUE KEY,
    department VARCHAR(20),
    major VARCHAR(20),
    enrollment_time DATE,
    PRIMARY KEY(number)
) COMMENT '学生信息表';

DROP TABLE IF EXISTS student_info;
CREATE TABLE student_info(
    number INT,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(20),
    major VARCHAR(20),
    enrollment_time DATE,
    PRIMARY KEY(number),
    UNIQUE KEY uk_id_number (id_number)
) COMMENT '学生信息表';

SHOW CREATE TABLE student_info;


SHOW TABLES;
DROP TABLE IF EXISTS first_table;
CREATE TABLE first_table(
    first_column INT UNIQUE,
    second_column VARCHAR(20) UNIQUE NOT NULL
);

SHOW CREATE TABLE first_table;


ALTER TABLE first_table MODIFY second_column INT PRIMARY KEY;


DROP TABLE IF EXISTS student_score, student_info;
SHOW TABLES;
CREATE TABLE student_info(
    number INT,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(20),
    major VARCHAR(20),
    enrollment_time DATE,
    PRIMARY KEY(number),
    UNIQUE KEY uk_id_number (id_number)
) COMMENT '学生信息表';

CREATE TABLE student_score(
    number INT,
    subject VARCHAR(20),
    score TINYINT,
    PRIMARY KEY(number, subject),
    CONSTRAINT FOREIGN KEY(number) REFERENCES student_info(number)
) COMMENT '学生分数表';

USE xiaohaizi;

DROP TABLE IF EXISTS first_table;

CREATE TABLE IF NOT EXISTS first_table(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_column INT,
    second_column VARCHAR(10) DEFAULT 'abc'
);

INSERT INTO first_table(first_column) VALUES (1);
INSERT INTO first_table(first_column) VALUES (2);
SELECT * FROM first_table;

INSERT INTO first_table VALUES (8, 1, 'aaa');
INSERT INTO first_table(first_column) VALUES (2);
SELECT * FROM first_table;

INSERT INTO first_table VALUES(4, 2, 'a');
INSERT INTO first_table(first_column) VALUES (2);


DROP TABLE IF EXISTS first_table;
CREATE TABLE IF NOT EXISTS first_table(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '自增主键',
    first_column INT,
    second_column VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS zerofill_table(
    i1 INT UNSIGNED ZEROFILL,
    i2 INT UNSIGNED
);

INSERT INTO zerofill_table VALUES (1, 1);

SELECT * FROM zerofill_table;

DROP TABLE IF EXISTS zerofill_table;
CREATE TABLE IF NOT EXISTS zerofill_table(
    i1 INT ZEROFILL,
    i2 INT UNSIGNED
);

SHOW CREATE TABLE zerofill_table;

DESC student_info;