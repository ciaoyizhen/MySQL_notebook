CREATE USER 'xiaohaizi'@'localhost' IDENTIFIED BY '88888888';

SELECT user, host FROM mysql.user;

ALTER USER 'xiaohaizi'@'localhost' IDENTIFIED BY '12345678';
DROP USER 'xiaohaizi'@'localhost';


CREATE USER 'xiaohaizi'@'localhost' IDENTIFIED BY '88888888';
GRANT SELECT
ON *.*  -- * 表示全级级别
TO 'xiaohaizi'@'localhost'
WITH GRANT OPTION;

SHOW GRANTS FOR 'xiaohaizi'@'localhost';

REVOKE SELECT
ON *.*
FROM 'xiaohaizi'@'localhost';