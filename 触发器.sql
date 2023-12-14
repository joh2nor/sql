--触发器
create trigger 选课外码 on 选课
for update,insert
as 
begin
if(select count(*)
from 学生,inserted,课程
where 学生.学号 = inserted.学号 and inserted.课程号 = 课程.课程号) = 0
	begin
		rollback --事务的回滚
		print'失败'
	end
else	print'成功'

end

select * from 学生
select * from 课程
select * from 选课

insert into 选课 values('C0000555','S000665',90)
--定义选课的插入触发器，要求当学生已经选修3门课后,不能继续选修课程，sql语句全小写

create trigger 选课不能超过三门
on 选课
after insert
as 
begin
    -- 检查每一个插入的学生是否选修超过3门课程
    if exists (
        select 1
        from inserted i
        inner join 选课 xc on i.学号 = xc.学号
        group by i.学号
        having count(xc.课程号) > 3
    )
    begin
        rollback;
        print '选课失败：一个学生不能选修超过3门课程';
    end
    else 
    begin
        print '选课成功';
    end
end;


select * from 选课
insert into 选课 values('C010','S008',90)


create trigger 修改
on 学生
for update
as 
begin
	select 姓名,学号 from inserted 
	select 姓名,学号 from deleted
end


