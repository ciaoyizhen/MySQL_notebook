SHOW TABLES FROM xiaohaizi;


USE xiaohaizi;
SHOW TABLES;

CREATE TABLE first_table(
    first_column INT,
    second_column VARCHAR(10)
);


CREATE TABLE second_table(
    first_column INT,
    second_column VARCHAR(10)
) COMMENT '第二个表';

# 主要是用到了默认的数据库，下面的命令是查询xiaohaizi数据库下的所有
SELECT table_name 表名, table_comment 表注释
FROM information_schema.TABLES
WHERE table_schema = 'xiaohaizi';


ALTER Table first_table COMMENT = '第一个表';


CREATE TABLE student_info(
    number INT,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(20),
    major VARCHAR(20),
    enrollment_time DATE
) COMMENT '学生信息表';


CREATE TABLE student_score(
    number INT,
    subject VARCHAR(20),
    score TINYINT # 这里使用DECIMAL(5,2)可能会更好?
) COMMENT '学生分数表';


CREATE TABLE IF NOT EXISTS first_table(
    first_column INT,
    second_columns VARCHAR(10)
) COMMENT '第一个表';


DROP TABLE first_table;

DROP TABLE IF EXISTS first_table;

# 多种方式查看表结构
DESC student_info;
DESC student_info;
EXPLAIN student_info;
SHOW COLUMNS FROM student_info;
SHOW FIELDS FROM student_info;

SHOW CREATE TABLE student_info;
CREATE TABLE `student_info` (   
    `number` int DEFAULT NULL,   
    `name` varchar(5) DEFAULT NULL,   
    `sex` enum('男','女') DEFAULT NULL,   
    `id_number` char(18) DEFAULT NULL,   
    `department` varchar(20) DEFAULT NULL,   
    `major` varchar(20) DEFAULT NULL,   
    `enrollment_time` date DEFAULT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生信息表';


SHOW CREATE TABLE xiaohaizi.student_info;


ALTER TABLE first_table RENAME TO first_table1;

RENAME TABLE first_table1 TO first_table, second_table TO second_table1;

CREATE DATABASE dahaizi;
ALTER TABLE first_table RENAME TO dahaizi.first_table1;
SHOW TABLES FROM xiaohaizi;
SHOW TABLES FROM dahaizi;

USE xiaohaizi;
ALTER TABLE second_table1 ADD COLUMN third_column CHAR(4);
DESC second_table1;
SHOW CREATE TABLE second_table1;


ALTER TABLE second_table1 ADD COLUMN forth_column CHAR(4) FIRST;
DESC second_table1;
SHOW CREATE TABLE second_table1;


ALTER TABLE second_table1 ADD COLUMN fifth_column CHAR(5) AFTER first_column;
DESC second_table1;
SHOW CREATE TABLE second_table1;


ALTER TABLE second_table1 DROP COLUMN fifth_column;
ALTER TABLE second_table1 DROP COLUMN forth_column;
ALTER TABLE second_table1 DROP COLUMN third_column;
DESC second_table1;
SHOW CREATE TABLE second_table1;


ALTER TABLE second_table1 MODIFY second_column CHAR(2);
DESC second_table1;
SHOW CREATE TABLE second_table1;

ALTER TABLE second_table1 CHANGE second_column second_column1 CHAR(4);

ALTER TABLE second_table1 MODIFY second_column1 CHAR(4) FIRST;
DESC second_table1;


ALTER TABLE second_table1 MODIFY second_column1 CHAR(4) AFTER first_column;

USE xiaohaizi;


# 添加三列  最后一起删除这三列
ALTER TABLE second_table1 ADD COLUMN third_column CHAR(4);
ALTER TABLE second_table1 ADD COLUMN forth_column CHAR(4) FIRST;
ALTER TABLE second_table1 ADD COLUMN fifth_column CHAR(5) AFTER first_column;

# 删除
ALTER TABLE second_table1 DROP third_column, DROP forth_column, DROP fifth_column;



SHOW tables from xiaohaizi;

CREATE table first_table (
    first_column INT,
    second_column varchar(10)
);