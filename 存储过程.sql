--��������@ �ֲ����� @@ȫ�ֱ���
declare @d int
--��ֵ���
select @d = 3+5

--����ַ������
select cast(@d as varchar)

declare @s char(10)
set @s = 'hello'

print @s



select @d = avg(����)
from ѧ��

select cast(@d as varchar)


---��֧���
declare @d int
select @d = avg(����)
from ѧ��
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
select �γ̺�,ѧ��,�ȼ��ɼ� = (
	case �ɼ� /10
	when 10 then '����'
	when 9  then '��'
	when 8  then '��'
	when 7  then '��'
	when 6  then '����'
	--else '����'
	end
) 
from ѡ��
where �ɼ� >=60
	
--����洢����
create procedure ȫ��ѧ��
as
begin
select * from ѧ��
end

exec ȫ��ѧ��

--ɾ���洢����
drop procedure ȫ��ѧ��

--�������Ĵ洢����
create procedure ��ѯѧ�� @d char(10)
as 
begin
	select * from ѧ��
	where ����ϵ=@d
end

--���ô������Ĵ洢����
exec ��ѯѧ�� @d = '�����'

drop procedure ��ѯѧ��

create procedure ��ѯѧ�� @d char(10),@s char(2)='��'
as 
begin
	select * from ѧ��
	where ����ϵ=@d and �Ա�=@s
end

exec ��ѯѧ�� @d = '�����',@s = '��'

