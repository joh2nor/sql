create database ͼ��������ݿ�
drop table ͼ��
create table ͼ��(
	��� char(10) primary key,
	ͼ���� char(8),
	���� char(8) ,
	������ int,
	���� char(10),
	���� float
)

drop table ������

create table ������(
	��� char(10) primary key,
	���� char(8) ,
	רҵ char(10) ,
	�������� char(10) check(�������� in ('��ʦ','ѧ��')),
	��ϵ���� char(11),

)
drop table ����
create table ����(
	���߱�� char(10),
	ͼ���� char(10),
	�������� date

	constraint PK_���� primary key (���߱��, ͼ����)--��¼Լ��
	foreign key(���߱��) references ������,
	foreign key(ͼ����) references ͼ��
)

