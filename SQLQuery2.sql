/*create table ѧ��(
	ѧ�� char(8) primary key,
	���� char(8) not null,
	�Ա� char(2) check(�Ա� in ('��','Ů')),
	���� int,
	����ϵ char(20)
)*/

/*create table �γ�(
	�γ̺� char(8) primary key,
	�γ��� char(8) unique,
	���п� char(8) references �γ�
)*/

/*create table ѡ��(
	�γ̺� char(8), --references �γ�,
	ѧ�� char(8) references ѧ��,
	�ɼ� int 
	--��¼Լ������������
	constraint PK_ѡ�� primary key (ѧ��, �γ̺�)--��¼Լ��
	constraint FK_�γ� foreign key(�γ̺�) references �γ�,
	--foreign key(ѧ��) references ѧ��,
	constraint CK_�ɼ� check(�ɼ� between 0 and 100)
)*/

--	select ѧ�� from ѧ��
--drop table ѧ�� --ɾ��ѧ����
--drop table ѡ�� --ɾ��ѡ�α�


--��������
/*insert into ѧ�� 
	values ('s001', '����', '��', 21, '�����')
insert into ѧ�� 
	values ('s002', '��Ц', 'Ů', 22, '�����')

insert into ѧ�� (����,����,ѧ��,�Ա�,����ϵ) 
		values('����',21,'s003','Ů','�����')
insert into ѧ��(����,ѧ��)
	values('�ŷ�','s004')*/
select * from ѧ��

insert into ѧ�� (����,����,ѧ��,�Ա�,����ϵ) 
		values('�κ�',21,'s005','��','�����')


/*DELETE FROM ѧ��
WHERE �Ա� = '��';*/
DELETE FROM �γ�
	WHERE �γ̺� = 'C0010'
select * from �γ�
insert into �γ� values('C001','��ɢ��ѧ',null)
insert into �γ� values('C002','���ݽṹ','C001')
insert into �γ� values('C003','���ݿ�','C001')
insert into �γ� values('C004','����ϵͳ','C001')
insert into �γ� values('C005','�㷨','C002')
insert into �γ� values('C006','Java','C002')
insert into �γ� values('C007','C++','C002')
insert into �γ� values('C008','Ptthon','C002')
insert into �γ� values('C009','C#','C002')
insert into �γ� values('C010','����','C002')

select * from ѡ��
insert into ѡ�� values('C001','s007',99)
insert into ѡ�� values('C002','s007',70)
insert into ѡ�� values('C003','s007',50)
insert into ѡ�� values('C004','s007',60)
insert into ѡ�� values('C005','s007',88)
insert into ѡ�� values('C006','s007',66)
insert into ѡ�� values('C007','s007',77)
insert into ѡ�� values('C008','s007',99)
insert into ѡ�� values('C009','s007',55)
insert into ѡ�� values('C010','s007',89)
insert into ѡ�� values('C002','s007',66)
/*create table ְ��
(
	��� int primary key identity(1,2),--Ĭ������
	���� char(8),
	�������� smallmoney,
	���ӹ��� smallmoney,
	�ܹ��� as �������� + ���ӹ���
)*/
select * from ְ��
insert into ְ�� values('����',1000,2000)

--�޸�
select * from ѧ��
update ѧ�� set ����+=1 where �Ա�='��'

--�޸ı�Ľṹ
/*
	1.�޸��ֶεĶ��� alter table alter column 
	2.�����ֶκͱ�Լ������
	3.ɾ���ֶλ�Լ������
	4.ʹԼ����Ч����Ч
*/
--ѧ�������룬�޷����޸�
alter table ѧ�� alter column ѧ�� char(10)
alter table ѧ�� alter column ����ϵ char(20)
alter table ѧ�� alter column ���� int
alter table ѧ�� alter column �Ա� int
--alter table 
-- �����ֶΡ��С�Լ��
alter table ѧ�� add ���� char(8) default '����'
--��Լ��������
alter table  ѧ�� add constraint CK_1 check(���� in ('����','�Ϻ�','�㽭'))
select * from ѧ��

--ɾ���С�Լ��
--��Լ������ɾ����
alter table ѧ�� drop column ���� 
--ɾ��Լ��
alter table ѧ�� drop DF__ѧ��__����__4BAC3F29 
alter table ѧ�� drop CK_1
insert into ѧ�� (����,����,ѧ��,�Ա�,����ϵ) values('�Ѻ���',21,'s006','��','�����')
insert into ѧ�� (����,����,ѧ��,�Ա�,����ϵ) values('��Ѹ��',23,'s007','��','�����')
insert into ѧ�� (����,����,ѧ��,�Ա�,����ϵ) values('�Ѻ���',21,'s006','��','�����')
update ѧ�� set ����ϵ='����' where ����='�κ�'
insert into ѧ�� (����,����,ѧ��,�Ա�,����ϵ,����) values('����',21,'s008','��','�����','�Ϻ�')

--��ʱ��Լ����������
alter table ѧ�� nocheck constraint CK_1
--������Լ��������
alter table ѧ�� check constraint CK_1
--��Լ��ʱ��������Լ�����ܼ�
--select����
/*
	1.���ò�ѯ����ı�ͷ
	2.
*/
select * from ѡ��

select ѧ��,�ɼ�*0.8 as �ɼ� from ѡ�� where �ɼ�>=60 and �ɼ� <=90and �γ̺�='C004'

--��õ�ǰ���ں���
select year(getdate())



