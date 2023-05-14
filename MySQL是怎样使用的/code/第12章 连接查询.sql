USE xiaohaizi;
CREATE TABLE t1(
    m1 INT,
    n1 CHAR(1)
);

CREATE TABLE t2(
    m2 INT,
    n2 CHAR(1)
);

INSERT INTO t1 VALUES
(1, 'a'),
(2, 'b'),
(3, 'c');

INSERT INTO t2 VALUES
(2, 'b'),
(3, 'c'),
(4, 'd');

SELECT * FROM t1;
SELECT * FROM t2;

# 笛卡尔乘积
SELECT m1, n1, m2, n2
FROM t1, t2;



SELECT * FROM t1, t2
WHERE m1 > 1 AND m1 = m2
AND n2 < 'd';

SELECT si.number, name, major, subject, score
FROM student_info AS si, student_score AS ss
WHERE si.number = ss.number;


SELECT student_info.number, name, major, subject, score
FROM student_info LEFT OUTER JOIN student_score
ON student_score.number = student_info.number;

SELECT student_info.number, name, major, subject, score
FROM student_info JOIN student_score
ON student_score.number = student_info.number;


CREATE TABLE t3 (
    m3 INT,
    n3 CHAR(1)
);

INSERT INTO t3 VALUES
(3, 'c'),
(4, 'd'),
(5, 'e');

SELECT *FROM 
t1 JOIN t2 ON m1 = m2
JOIN t3 ON m1 = m3;

SELECT s1.number, s1.name
FROM student_info AS s1;

SELECT * FROM
t1 AS tabel1, t1 AS table2; 