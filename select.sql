--select操作
/*
	1.设置查询结果的表头
	2.
*/
--投影
select * from 学生
select 学号,姓名 from 学生
select * from 选课
--数学系学生的学号和姓名
select 学号,姓名 from 学生 where 所在系 = '计算机'
--去掉重复行
select distinct 学号 from 选课
select 学号,成绩 from 选课 where 课程号='C002'
--排序升序
select 学号,成绩 from 选课 where 课程号='C003' order by 成绩 asc 
--排序降序
select 学号,成绩 from 选课 where 课程号='C003' order by 成绩 desc,学号 asc--成绩相同升序