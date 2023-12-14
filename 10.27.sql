--1.将汪峰的所在系改为与黄晓明同一个专业
UPDATE 学生
SET 所在系 = (
    SELECT 所在系
    FROM 学生
    WHERE 姓名 = '黄晓明'
)
WHERE 姓名 = '汪峰';

--2.建立视图显示：计算机系选修了1号课程的学生的学号、姓名、成绩。
CREATE VIEW 计算机系1号课程 AS
SELECT s.学号, s.姓名, c.成绩
FROM 学生 s
JOIN 选课 c ON s.学号 = c.学号
WHERE s.所在系 = '计算机系' AND c.课程号 = 'C001';


--3.建立信息系选修了1号课程且成绩在90分以上的学生的视图。

CREATE VIEW 信息系1号课程90分以上 AS
SELECT s.学号, s.姓名, c.成绩
FROM 学生 s
JOIN 选课 c ON s.学号 = c.学号
WHERE s.所在系 = '计算机' AND c.课程号 = 'C001' AND c.成绩 > 90;
