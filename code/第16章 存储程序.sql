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