--删除数学系学生的选课记录 delete update insert 后面只能跟一个表
delete 学生 where 所在系 = '数学'

delete 选课 where 学号 in (select 学号 from 学生 where 所在系 = '数学')
select * from 学生
select * from 选课
select * from 课程
update 选课 set 成绩*=1.2 where 课程号 in(select 课程号 from 课程 where 课程名='数据结构' )

update 选课 set 成绩=(select avg(成绩) from 选课  where 课程号 = 'C001' ) where 学号 = 's001'and 课程号 = 'C001' 

create table 系年龄(
	系名 char(20),
	年龄 int 
)
insert into 系年龄
select 所在系,avg(年龄) from 学生 group by 所在系

select * from 系年龄

---视图
create view 数学系学生
as select * from 学生 where 所在系 = '数学'


select * from 数学系学生

create view 成绩视图 as
select 学生.学号,姓名,课程名,成绩 from 学生,课程,选课
where 学生.学号 = 选课.学号 and 选课.课程号 = 课程.课程号 and 学生.所在系 = '计算机'

select * from 成绩视图

create view 成绩视图 as
	select 学号, avg(成绩)  平均成绩,sum(成绩)  总成绩 from 选课 group by 学号


