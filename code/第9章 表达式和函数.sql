USE xiaohaizi;
SHOW TABLES FROM xiaohaizi;
SELECT number, subject, score*100 score  # 修改列名
FROM student_score;

SELECT 5*6-8+25;

SELECT number, name, id_number, major
FROM student_info
WHERE 2>1;


SELECT 1+NULL, NULL*2;

SELECT 1= NULL, 2=NULL;

SELECT 1 IS NULL, NULL IS NULL, 1 IS NOT NULL, NULL IS NOT NULL;


SELECT 1<=>2, 1<=>1, 1<=>NULL, NULL <=> NULL;


SELECT LENGTH("我好爽");
SELECT CHAR_LENGTH("我好帅");

SELECT SUBSTRING('abc123', 2, 3);


SELECT NOW();

SELECT DATE_ADD("2021-05-11 17:10:43", INTERVAL 2 MINUTE);


SELECT DATE_FORMAT(NOW(), "%b %D %m %f %H %W");

DESC student_score;

SELECT number, subject, score, 
CASE WHEN score<60 THEN "不及格"
     WHEN score <90 THEN "及格"
     WHEN score >=90 THEN "优秀"
     END
FROM student_score;


SELECT name, department,
CASE department 
WHEN "计算机学院" THEN "1级学科"
WHEN "航天学院" THEN "2级学科"
ELSE "位置" END
"类别"
FROM student_info;

SELECT IF(1, 1, 0);
SELECT IF(0, 1, 0);

SELECT IFNULL(NULL, 1); 
SELECT IFNULL(1, 2);

SELECT NULLIF(2, 2);
SELECT NULLIF(2, 3);

SELECT MAX(score)
FROM student_score;

SELECT MIN(score)
FROM student_score;

SELECT SUM(score)
FROM student_score;

SELECT AVG(score)
FROM student_score;


CREATE TABLE count_demo(
    c INT
);

INSERT INTO count_demo VALUES
(1),
(NULL),
(1),
(NULL);

SELECT * FROM count_demo;

SELECT COUNT(*), count(c) FROM count_demo;


SELECT COUNT()

SELECT SUM(score), AVG(score)
FROM student_score;

SELECT COUNT(DISTINCT department)
FROM student_info;


SELECT "1"+1;

SELECT "23abc13" + 1;

SELECT "2014-2" + 1;

SELECT 'a+1'+1;

SELECT 'a' < 1, 1 AND 'a', 1 AND '2a'; 

SELECT CONCAT(1, 2);

SELECT 5 WHERE 'a';

SELECT 5 WHERE '2a';


CREATE TABLE test(
    col1 INT,
    col2 VARCHAR(10)
);

INSERT INTO test VALUES("22", 1);

SELECT * FROM test;