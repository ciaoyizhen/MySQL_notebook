USE xiaohaizi;

SELECT number 
FROM student_info
WHERE name = "狗哥";

SELECT *
FROM student_score
WHERE number = 20210101;

SELECT *
FROM student_score
WHERE number = (SELECT number 
                FROM student_info
                WHERE name = "狗哥");


SELECT * FROM student_info
WHERE number > (SELECT number
                FROM student_info
                WHERE name = "狗哥");


SELECT subject, score FROM student_score
where number IN (SELECT number
                FROM student_info
                WHERE major = "计算机科学与工程");

SELECT subject, score
FROM student_score
WHERE (number, subject) IN (SELECT number, subject
                            FROM student_info
                            );


SELECT * FROM student_score
WHERE EXISTS (SELECT * FROM student_info
              WHERE number = 20210108);

SELECT * FROM student_score
WHERE TRUE:

SELECT * FROM student_score
WHERE EXISTS (SELECT * FROM student_info
              WHERE number = 20210103);

SELECT number, name, id_number, major
FROM student_info
WHERE EXISTS(SELECT * FROM student_score
            WHERE student_score.number = student_info.number);


SELECT * FROM student_score
WHERE subject = "MySQL是怎样运行的"
AND score > (SELECT AVG(score) FROM student_score);