--起名字
select 学号,成绩*0.8  最终成绩 from 选课 where 成绩>=60 and 成绩 <=90and 课程号='C004'
select 学号,成绩*0.8 as 成绩 from 选课 where 成绩>=60 and 成绩 <=90and 课程号='C004'
--复杂运算
select 学号,成绩=成绩*0.8  from 选课 where 成绩>=60 and 成绩 <=90and 课程号='C004'

select 姓名,出身年份 = year(getdate())-年龄 from 学生


--显示前**行
--显示前5行
select top 5 * from 学生

--前百分之多少
--前百分之5
select top 5 percent * from 学生
select * from 学生
select * from 课程
-------------------------------------------模糊查询-----------------------------------------------------
--查询所有姓张的同学
--%任意长度
select * from 学生 where 姓名 like '王%'
--_是后面只跟一个字
select * from 学生 where 姓名 like '张_'


--------------------------
select * from 选课
insert into 课程  values('C018','Python',NULL)
insert into 课程  values('C012','DB0','C002')
insert into 课程  values('C013','DB011',NUll)
insert into 课程  values('C014','DB01',NUll)
insert into 课程  values('C015','DB_a54',NUll)
insert into 课程  values('C016','DB_444',NUll)

select * from 课程 where 课程名 like 'DB%'
select * from 课程 where 课程名 like 'DB%'and len(课程名) <= 3
select * from 课程 where 课程名 like 'DB_'
--以DB_开头
select * from 课程 where 课程名 like 'DB\_%'ESCAPE '\'

select * from 学生 where 姓名 like '张%'and 所在系='计算机'or 所在系='数学'
select * from 学生 where (所在系='计算机'or 所在系='数学')and 姓名 like '张%'

--不等于
--<> !=5


--is运算符
--只判断空
--从老表查询数据插入新表
-- 临时数据库
select * into #计算机学生表 from 学生

select max(年龄),min(年龄),avg(年龄) from 学生 where 所在系='计算机'

--统计时不能加列



select min(成绩) from 选课 where 课程号 = 'C001'

select sum(成绩) from 选课 where 学号 = 'S001'

--空值不数、distinct去掉重复
select count(学号) from 学生 where 所在系 = '计算机'

select count(distinct 学号) from 选课


------分组统计分组统计允许有属性,不可以有其他的属性
select 所在系,count(学号) from 学生 group by 所在系


--不是表中原有的数据 having
select 课程号,count(学号) from 选课 group by 课程号 having count(学号)>4


select 所在系,count(学号) from 学生 group by 所在系 having count(学号)>100


----集合查找
---并运算
---union all 是简单的罗列不去重复
select 学号 from 选课 where 课程号='C001' union
select 学号 from 选课 where 课程号='C003'

---交运算
select 学号 from 选课 where 课程号='C001' intersect
select 学号 from 选课 where 课程号='C003'

---差运算
select 学号 from 选课 where 课程号='C001' except
select 学号 from 选课 where 课程号='C003'

---------------------------------------------------------
select 学号 from 学生 except
select 学号 from 选课 where 课程号 ='C003'
----------------------------------------
select 学号 from 学生 except
select 学号 from 选课 

------笛卡尔积
select * from 课程,选课

----连接
select 学号,成绩 from 课程,选课
where 选课.课程号 = 课程.课程号 and 课程名='C++'

--内连接：能连接成功的留下来，连接不成功的不要了

--1、确定数据源
--2、确定连接条件
--3、确定筛选条件
--1、第一种写法
select 学生.学号,成绩 from 学生,选课,课程 where 学生.学号 = 选课.学号 
	and 选课.课程号 = 课程.课程号 and 课程名 = '数据结构' and 成绩>90 
--2、第二种写法、inner可以不加
select * from 学生 inner join 选课 on 学生.学号 = 选课.学号 where 姓名 = '张飞'

--外连接：连接不成功的也留下来
--left\right\full
select * from 选课 right join 学生 on 学生.学号 = 选课.学号


select 选课.学号, 成绩 from 选课,课程 where 课程.课程号 = 选课.课程号
	 and 课程名 = '数据结构';


select 选课.学号,成绩 from 选课 inner join 课程 on 课程.课程号 = 选课.课程号 where 课程名 = '数据结构'

--自身连接

select A.课程号,B.先行课 间接先行课 from 课程 A,课程 B where A.先行课=B.课程号 and B.先行课 is not null


select 课程.课程号 from 课程 left join  选课 on 课程.课程号 = 选课.课程号 where 学号 is null 

select 课程号 from 课程  except
select 课程号 from 选课 

select * from 课程 esc
select * from 选课 esc
select * from 学生 esc
----嵌套查询  
--子查询--内层查询
select 姓名 from 学生 where 学号 in( 
select  学号 from 选课  where 课程号='C002')

select 学号,姓名 from 学生 where 学号 in (select 学号 from 选课 where 课程号 = (
	select 课程号 from 课程 where 课程名 = '数据结构')
) 

insert into 学生 
	values ('s009', '李逵', '女', 24, '数学','江苏')

insert into 学生 
	values ('s010', '张奎', '男', 24, '电子','江苏')



--1.查询选修了’DB‘的先行课的学生姓名？

select 姓名,学生.学号 from 学生 where 学号 in (select 学号 from 选课 where 课程号=(select 先行课 from 课程 where 课程名='数据结构'))

--2.求有几门课程有先行课？

select count(课程号) 有先行课的课程数 from 课程 where 先行课 is not null

--3.用两种方法求哪些学生没有选课 (一种：外连接；另一种：集合操作）
--外连接
select 姓名 from 学生 left join 选课 on 学生.学号 = 选课.学号 where 课程号 is  null
--集合操作
select 姓名 from 学生 where 学号 in (
select 学号 from 学生 except 
select 学号 from 选课)


select B.* from 学生 A,学生 B where A.姓名 = '张飞' and A.所在系 = B.所在系

select 学生.学号,姓名,成绩 from 学生,选课,课程 where 学生.学号 = 选课.学号 and 选课.课程号 = 课程.课程号 and 课程名 = '数据结构'

select * from 学生 where 学号 in (select 学号 from 选课 where 课程号 = 'C001' or 课程号 = 'C002' ) 

select * from 选课 where 课程号 = 'C002' and 学号 In (select 学号 from 选课 where 课程号 = 'C001' )


select * from 选课 where 课程号 = 'C001' and 成绩>= 
(select 成绩 from 选课 where 学号 = 
(select 学号 from 学生 where 姓名 = '关羽'))   


select 姓名,年龄 from 学生 where 年龄  <= any(select 年龄 from 学生 where 所在系 = '计算机') and 所在系 != '计算机'

select 课程号 from 选课 group by 课程号 having count(*) >=all (select count(*) from 选课 group by 课程号)

--子查询用到了父查询用到的参数
select 姓名 from 学生 where exists(
	select * from 选课 where 学号 = 学生.学号 and 课程号 = 'C002'
)

select 姓名 from 学生 where exists(
	select * from 选课 where 学号 = 学生.学号 and 课程号 = 'C002'
)





