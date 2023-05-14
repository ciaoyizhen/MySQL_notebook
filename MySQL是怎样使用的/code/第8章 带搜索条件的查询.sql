USE xiaohaizi;

SELECT number, name, id_number, major
FROM student_info
WHERE name = '狗哥';



SELECT * FROM student_info
WHERE major IN ("软件工程", "飞行器设计");

SELECT * FROM student_info
WHERE name IS NOT NULL;

SELECT * FROM student_score
WHERE subject = "MySQL是怎样运行的"
AND score >= 75;


SELECT * FROM student_score
WHERE score > 95 OR score < 50;


SELECT * FROM student_info
WHERE name LIKE '狗%';