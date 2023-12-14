--声明变量@ 局部变量 @@全局变量
declare @d int
--赋值语句
select @d = 3+5

--变成字符串输出
select cast(@d as varchar)

declare @s char(10)
set @s = 'hello'

print @s



select @d = avg(年龄)
from 学生

select cast(@d as varchar)


---分支语句
declare @d int
select @d = avg(年龄)
from 学生
if @d<8
	goto t1
else 
	goto t2
t1:
	select cast(@d as varchar)

t2:
	declare @s char(10)
	set @s = 'hello'
	print @s

--
select 课程号,学号,等级成绩 = (
	case 成绩 /10
	when 10 then '满分'
	when 9  then '优'
	when 8  then '良'
	when 7  then '中'
	when 6  then '及格'
	--else '及格'
	end
) 
from 选课
where 成绩 >=60
	
--定义存储过程
create procedure 全体学生
as
begin
select * from 学生
end

exec 全体学生

--删除存储过程
drop procedure 全体学生

--带参数的存储过程
create procedure 查询学生 @d char(10)
as 
begin
	select * from 学生
	where 所在系=@d
end

--调用带参数的存储过程
exec 查询学生 @d = '计算机'

drop procedure 查询学生

create procedure 查询学生 @d char(10),@s char(2)='男'
as 
begin
	select * from 学生
	where 所在系=@d and 性别=@s
end

exec 查询学生 @d = '计算机',@s = '男'

