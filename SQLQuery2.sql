/*create table 学生(
	学号 char(8) primary key,
	姓名 char(8) not null,
	性别 char(2) check(性别 in ('男','女')),
	年龄 int,
	所在系 char(20)
)*/

/*create table 课程(
	课程号 char(8) primary key,
	课程名 char(8) unique,
	先行课 char(8) references 课程
)*/

/*create table 选课(
	课程号 char(8), --references 课程,
	学号 char(8) references 学生,
	成绩 int 
	--记录约束可以起名字
	constraint PK_选课 primary key (学号, 课程号)--记录约束
	constraint FK_课程 foreign key(课程号) references 课程,
	--foreign key(学号) references 学生,
	constraint CK_成绩 check(成绩 between 0 and 100)
)*/

--	select 学号 from 学生
--drop table 学生 --删除学生表
--drop table 选课 --删除选课表


--插入数据
/*insert into 学生 
	values ('s001', '张三', '男', 21, '计算机')
insert into 学生 
	values ('s002', '张笑', '女', 22, '计算机')

insert into 学生 (姓名,年龄,学号,性别,所在系) 
		values('王菲',21,'s003','女','计算机')
insert into 学生(姓名,学号)
	values('张飞','s004')*/
select * from 学生

insert into 学生 (姓名,年龄,学号,性别,所在系) 
		values('任浩',21,'s005','男','计算机')


/*DELETE FROM 学生
WHERE 性别 = '男';*/
DELETE FROM 课程
	WHERE 课程号 = 'C0010'
select * from 课程
insert into 课程 values('C001','离散数学',null)
insert into 课程 values('C002','数据结构','C001')
insert into 课程 values('C003','数据库','C001')
insert into 课程 values('C004','操作系统','C001')
insert into 课程 values('C005','算法','C002')
insert into 课程 values('C006','Java','C002')
insert into 课程 values('C007','C++','C002')
insert into 课程 values('C008','Ptthon','C002')
insert into 课程 values('C009','C#','C002')
insert into 课程 values('C010','网络','C002')

select * from 选课
insert into 选课 values('C001','s007',99)
insert into 选课 values('C002','s007',70)
insert into 选课 values('C003','s007',50)
insert into 选课 values('C004','s007',60)
insert into 选课 values('C005','s007',88)
insert into 选课 values('C006','s007',66)
insert into 选课 values('C007','s007',77)
insert into 选课 values('C008','s007',99)
insert into 选课 values('C009','s007',55)
insert into 选课 values('C010','s007',89)
insert into 选课 values('C002','s007',66)
/*create table 职工
(
	编号 int primary key identity(1,2),--默认自增
	姓名 char(8),
	基本工资 smallmoney,
	附加工资 smallmoney,
	总工资 as 基本工资 + 附加工资
)*/
select * from 职工
insert into 职工 values('张三',1000,2000)

--修改
select * from 学生
update 学生 set 年龄+=1 where 性别='男'

--修改表的结构
/*
	1.修改字段的定义 alter table alter column 
	2.增加字段和表约束规则
	3.删除字段或约束规则
	4.使约束有效或无效
*/
--学号是主码，无法再修改
alter table 学生 alter column 学号 char(10)
alter table 学生 alter column 所在系 char(20)
alter table 学生 alter column 年龄 int
alter table 学生 alter column 性别 int
--alter table 
-- 增加字段、列、约束
alter table 学生 add 籍贯 char(8) default '江苏'
--加约束起名字
alter table  学生 add constraint CK_1 check(籍贯 in ('江苏','上海','浙江'))
select * from 学生

--删除列、约束
--有约束不能删除列
alter table 学生 drop column 籍贯 
--删除约束
alter table 学生 drop DF__学生__籍贯__4BAC3F29 
alter table 学生 drop CK_1
insert into 学生 (姓名,年龄,学号,性别,所在系) values('蒲贺良',21,'s006','男','计算机')
insert into 学生 (姓名,年龄,学号,性别,所在系) values('周迅杰',23,'s007','男','计算机')
insert into 学生 (姓名,年龄,学号,性别,所在系) values('蒲贺良',21,'s006','男','计算机')
update 学生 set 所在系='物理' where 姓名='任浩'
insert into 学生 (姓名,年龄,学号,性别,所在系,籍贯) values('关羽',21,'s008','男','计算机','上海')

--暂时让约束不起作用
alter table 学生 nocheck constraint CK_1
--重新让约束起作用
alter table 学生 check constraint CK_1
--加约束时数据满足约束才能加
--select操作
/*
	1.设置查询结果的表头
	2.
*/
select * from 选课

select 学号,成绩*0.8 as 成绩 from 选课 where 成绩>=60 and 成绩 <=90and 课程号='C004'

--获得当前日期函数
select year(getdate())



