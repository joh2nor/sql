--������
create trigger ѡ������ on ѡ��
for update,insert
as 
begin
if(select count(*)
from ѧ��,inserted,�γ�
where ѧ��.ѧ�� = inserted.ѧ�� and inserted.�γ̺� = �γ�.�γ̺�) = 0
	begin
		rollback --����Ļع�
		print'ʧ��'
	end
else	print'�ɹ�'

end

select * from ѧ��
select * from �γ�
select * from ѡ��

insert into ѡ�� values('C0000555','S000665',90)
--����ѡ�εĲ��봥������Ҫ��ѧ���Ѿ�ѡ��3�ſκ�,���ܼ���ѡ�޿γ̣�sql���ȫСд

create trigger ѡ�β��ܳ�������
on ѡ��
after insert
as 
begin
    -- ���ÿһ�������ѧ���Ƿ�ѡ�޳���3�ſγ�
    if exists (
        select 1
        from inserted i
        inner join ѡ�� xc on i.ѧ�� = xc.ѧ��
        group by i.ѧ��
        having count(xc.�γ̺�) > 3
    )
    begin
        rollback;
        print 'ѡ��ʧ�ܣ�һ��ѧ������ѡ�޳���3�ſγ�';
    end
    else 
    begin
        print 'ѡ�γɹ�';
    end
end;


select * from ѡ��
insert into ѡ�� values('C010','S008',90)


create trigger �޸�
on ѧ��
for update
as 
begin
	select ����,ѧ�� from inserted 
	select ����,ѧ�� from deleted
end


