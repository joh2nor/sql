--ɾ����ѧϵѧ����ѡ�μ�¼ delete update insert ����ֻ�ܸ�һ����
delete ѧ�� where ����ϵ = '��ѧ'

delete ѡ�� where ѧ�� in (select ѧ�� from ѧ�� where ����ϵ = '��ѧ')
select * from ѧ��
select * from ѡ��
select * from �γ�
update ѡ�� set �ɼ�*=1.2 where �γ̺� in(select �γ̺� from �γ� where �γ���='���ݽṹ' )

update ѡ�� set �ɼ�=(select avg(�ɼ�) from ѡ��  where �γ̺� = 'C001' ) where ѧ�� = 's001'and �γ̺� = 'C001' 

create table ϵ����(
	ϵ�� char(20),
	���� int 
)
insert into ϵ����
select ����ϵ,avg(����) from ѧ�� group by ����ϵ

select * from ϵ����

---��ͼ
create view ��ѧϵѧ��
as select * from ѧ�� where ����ϵ = '��ѧ'


select * from ��ѧϵѧ��

create view �ɼ���ͼ as
select ѧ��.ѧ��,����,�γ���,�ɼ� from ѧ��,�γ�,ѡ��
where ѧ��.ѧ�� = ѡ��.ѧ�� and ѡ��.�γ̺� = �γ�.�γ̺� and ѧ��.����ϵ = '�����'

select * from �ɼ���ͼ

create view �ɼ���ͼ as
	select ѧ��, avg(�ɼ�)  ƽ���ɼ�,sum(�ɼ�)  �ܳɼ� from ѡ�� group by ѧ��


