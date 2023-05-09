USE xiaohaizi;

DROP VIEW male_student_view;
CREATE VIEW male_student_view
AS SELECT s1.number, name, major, subject, score
FROM student_info AS s1 
JOIN student_score AS s2
ON s1.number = s2.number
WHERE sex = "男";

SELECT * FROM male_student_view;

CREATE VIEW male_student_view3 (no, n, m)
AS
SELECT number, name, score
FROM male_student_view;

SHOW TABLES;

SHOW CREATE VIEW male_student_view;

SELECT * FROM male_student_view3;

UPDATE male_student_view3 SET
n = '狗哥哥'
WHERE n = "狗哥";

SELECT * FROM student_info;

DROP VIEW male_student_view3;