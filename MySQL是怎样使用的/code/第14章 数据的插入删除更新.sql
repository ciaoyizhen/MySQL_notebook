USE xiaohaizi;

DROP TABLE IF EXISTS first_table;

CREATE TABLE IF NOT EXISTS first_table(
    first_column INT,
    second_column VARCHAR(30)
);


INSERT INTO first_table VALUES
(1, 'aaa');

INSERT INTO first_table(second_column) VALUES
('bbb');

INSERT INTO first_table(second_column, first_column) VALUES
('ccc', 3),
('ddd', NULL);


CREATE TABLE IF NOT EXISTS second_table(
    s VARCHAR(30),
    i INT
);

INSERT INTO second_table (i, s)
SELECT * FROM first_table;


ALTER TABLE first_table MODIFY COLUMN
first_column INT UNIQUE;
INSERT INTO first_table VALUES (1, 'aaa');

INSERT IGNORE INTO first_table VALUES(1, '哈哈哈');
SELECT * FROM first_table
WHERE first_column = 1;

INSERT INTO first_table VALUES
(1, '哈哈哈')
ON DUPLICATE KEY UPDATE
first_column = 10, second_column = '雪碧';

SELECT * FROM first_table;

SELECT * FROM second_table;
ALTER TABLE second_table MODIFY COLUMN
i INT UNIQUE;
INSERT INTO second_table(s, i)
VALUES ("哈哈哈", 1)
ON DUPLICATE KEY UPDATE
s = "雪碧", i = 10;



INSERT INTO first_table VALUES
(2, "帅哥"), (1, "可乐") AS new
ON DUPLICATE KEY UPDATE
first_column = new.first_column,
second_column = new.second_column;

SELECT * FROM first_table;

DROP TABLE IF EXISTS second_table;

CREATE TABLE IF NOT EXISTS second_table(
    i INT UNIQUE,
    s VARCHAR(10)
);

INSERT INTO second_table
SELECT * FROM first_table;

SELECT * FROM second_table;


INSERT INTO second_table VALUES
(1, "开心"), (2, "快乐") AS new
ON DUPLICATE KEY UPDATE
i = new.i,
s = new.s;


DELETE FROM first_table
WHERE first_column > 5;

SELECT * FROM first_table;

DELETE first_table
ORDER BY first_column DESC
LIMIT 1;


UPDATE first_Table
SET first_column = 5, second_column="美女"
SET first_column = 6, second_column="可可"
WHERE first_column IS NULL;

SELECT * FROM second_table;

DELETE FROM second_table
ORDER BY i DESC
LIMIT 1;