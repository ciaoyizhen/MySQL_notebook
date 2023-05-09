USE xiaohaizi;
DESC student_score;

SELECT AVG(score)
FROM student_score
WHERE subject="MySQL是怎样运行的";


SELECT subject, AVG(score)
FROM student_score
GROUP BY subject;

# 先将低于60分的去掉 再进行汇总
SELECT subject, AVG(score)
FROM student_score
WHERE score > 60
GROUP BY subject;

SELECT subject, AVG(score)
FROM student_score
GROUP BY subject
HAVING AVG(score) > 73;


# HAVING子句也可以使用的聚合函数不同
SELECT subject, AVG(score)
FROM student_score
GROUP BY subject
HAVING MAX(score) > 98;


SELECT subject, AVG(score)
FROM student_score
GROUP BY subject
ORDER BY AVG(score);

SELECT department, major, COUNT(1)
FROM student_info
GROUP BY department, major;

SELECT CONCAT("专业:", major), COUNT(1)
FROM student_info
GROUP BY CONCAT("专业:", major);

DROP TABLE IF EXISTS test;
CREATE Table IF NOT EXISTS test(
    number INT,
    subject VARCHAR(10),
    score TINYINT
);
INSERT INTO test VALUES
(1, "语文", 60),
(2, "数学", 70),
(3, NULL, 0),
(4, NULL, 100);

SELECT subject, AVG(score)
FROM test
GROUP BY subject;