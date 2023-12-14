--10.23作业
--1、查询选修了’DB‘的先行课的学生姓名：
SELECT DISTINCT 学生.学号,学生.姓名 
FROM 学生 
JOIN 选课 ON 学生.学号 = 选课.学号 
WHERE 选课.课程号 = (SELECT 先行课 FROM 课程 WHERE 课程名 = '数据结构');

--2、求有几门课程有先行课：
SELECT COUNT(*) 
FROM 课程 
WHERE 先行课 IS NOT NULL;

--3、用两种方法求哪些学生没有选课：
--外连接：
SELECT 学生.姓名 
FROM 学生 
LEFT JOIN 选课 ON 学生.学号 = 选课.学号 
WHERE 选课.课程号 IS NULL;
--集合操作
select 姓名 from 学生 where 学号 in (
select 学号 from 学生 except 
select 学号 from 选课)


--1、查询选修了2号课程的学生姓名（三种方法）：
--使用 INNER JOIN：
SELECT DISTINCT 学生.姓名 
FROM 学生 
JOIN 选课 ON 学生.学号 = 选课.学号 
WHERE 选课.课程号 = 'C002';

--使用子查询 IN：
SELECT 姓名 
FROM 学生 
WHERE 学号 IN (SELECT 学号 FROM 选课 WHERE 课程号 = 'C002');

--使用 EXISTS：
SELECT 姓名 
FROM 学生 
WHERE EXISTS (SELECT 1 FROM 选课 WHERE 学生.学号 = 选课.学号 AND 课程号 = 'C002');

--2、查询没有选修2号课程的学生的姓名（两种方法）：
--except
SELECT 姓名 
FROM 学生 
EXCEPT
SELECT 姓名 
FROM 学生 
WHERE 学号 IN (SELECT 学号 FROM 选课 WHERE 课程号 = 'C002');

--Not Exisit
SELECT 姓名 
FROM 学生 
WHERE NOT EXISTS (SELECT 1 FROM 选课 WHERE 学生.学号 = 选课.学号 AND 课程号 = 'C002');

select * from 学生
select * from 选课 where 课程号 = 'C002'
select * from 课程

--3、找出每个学生超过自己选修课程平均成绩的课程号：
SELECT 课程号 
FROM 选课 
WHERE 成绩 > (SELECT AVG(成绩) FROM 选课 AS sub WHERE sub.学号 = 选课.学号);

--4、查询被所有学生选修的课程：
SELECT 课程号 
FROM 选课 
GROUP BY 课程号 
HAVING COUNT(DISTINCT 学号) = (SELECT COUNT(*) FROM 学生);
