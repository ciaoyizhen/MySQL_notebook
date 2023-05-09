USE xiaohaizi;
DROP TABLE IF EXISTS student_info, student_score;
CREATE TABLE IF NOT EXISTS student_info(
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

CREATE TABLE IF NOT EXISTS student_score(
    number INT,
    subject VARCHAR(20),
    score TINYINT,
    PRIMARY KEY(number, subject),
    CONSTRAINT FOREIGN KEY(number) REFERENCES student_info(number)
) COMMENT '学生分数表';


INSERT INTO student_info VALUES
(20210101, '狗哥', '男', '158177200301044792', '计算机学院', '计算机科学与工程', '2021-09-01'),
(20210102, '猫爷', '男', '151008200201178529', '计算机学院', '计算机科学与工程', '2021-09-01'),
(20210103, '艾希', '女', '17156320010116959X', '计算机学院', '软件工程', '2021-09-01'),
(20210104, '亚索', '男', '141992200201078600', '计算机学院', '软件工程', '2021-09-01'),
(20210105, '莫甘娜', '女', '181048200008156368', '航天学院', '飞行器设计', '2021-09-01'),
(20210106, '赵信', '男', '197995200201078445', '航天学院', '电子信息', '2021-09-01');

SELECT * FROM student_info;

INSERT INTO student_score VALUES
(20210101, '计算机是怎样运行的', 78),
(20210101, 'MySQL是怎样运行的', 88),
(20210102, '计算机是怎样运行的', 100),
(20210102, 'MySQL是怎样运行的', 98),
(20210103, '计算机是怎样运行的', 59),
(20210103, 'MySQL是怎样运行的', 61),
(20210104, '计算机是怎样运行的', 55),
(20210104, 'MySQL是怎样运行的', 46);

SELECT * FROM student_score;


# 正式开始
SELECT number FROM student_info;

SELECT number AS 学号 FROM student_info;
SELECT number 学号 FROM student_info;

SELECT number, name, id_number, major FROM student_info;

SELECT number 学号, name 姓名, id_number 身份证号, major 专业 FROM student_info;

SELECT DISTINCT department FROM student_info;

SELECT DISTINCT department, major FROM student_info;


SELECT * FROM student_info LIMIT 2;

SELECT * FROM student_info LIMIT 1, 2;

SELECT * FROM student_info LIMIT 7, 1;


SELECT * FROM student_score ORDER BY score;

SELECT * FROM student_score ORDER BY subject, score DESC;