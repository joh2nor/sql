--������
select ѧ��,�ɼ�*0.8  ���ճɼ� from ѡ�� where �ɼ�>=60 and �ɼ� <=90and �γ̺�='C004'
select ѧ��,�ɼ�*0.8 as �ɼ� from ѡ�� where �ɼ�>=60 and �ɼ� <=90and �γ̺�='C004'
--��������
select ѧ��,�ɼ�=�ɼ�*0.8  from ѡ�� where �ɼ�>=60 and �ɼ� <=90and �γ̺�='C004'

select ����,������� = year(getdate())-���� from ѧ��


--��ʾǰ**��
--��ʾǰ5��
select top 5 * from ѧ��

--ǰ�ٷ�֮����
--ǰ�ٷ�֮5
select top 5 percent * from ѧ��
select * from ѧ��
select * from �γ�
-------------------------------------------ģ����ѯ-----------------------------------------------------
--��ѯ�������ŵ�ͬѧ
--%���ⳤ��
select * from ѧ�� where ���� like '��%'
--_�Ǻ���ֻ��һ����
select * from ѧ�� where ���� like '��_'


--------------------------
select * from ѡ��
insert into �γ�  values('C018','Python',NULL)
insert into �γ�  values('C012','DB0','C002')
insert into �γ�  values('C013','DB011',NUll)
insert into �γ�  values('C014','DB01',NUll)
insert into �γ�  values('C015','DB_a54',NUll)
insert into �γ�  values('C016','DB_444',NUll)

select * from �γ� where �γ��� like 'DB%'
select * from �γ� where �γ��� like 'DB%'and len(�γ���) <= 3
select * from �γ� where �γ��� like 'DB_'
--��DB_��ͷ
select * from �γ� where �γ��� like 'DB\_%'ESCAPE '\'

select * from ѧ�� where ���� like '��%'and ����ϵ='�����'or ����ϵ='��ѧ'
select * from ѧ�� where (����ϵ='�����'or ����ϵ='��ѧ')and ���� like '��%'

--������
--<> !=5


--is�����
--ֻ�жϿ�
--���ϱ��ѯ���ݲ����±�
-- ��ʱ���ݿ�
select * into #�����ѧ���� from ѧ��

select max(����),min(����),avg(����) from ѧ�� where ����ϵ='�����'

--ͳ��ʱ���ܼ���



select min(�ɼ�) from ѡ�� where �γ̺� = 'C001'

select sum(�ɼ�) from ѡ�� where ѧ�� = 'S001'

--��ֵ������distinctȥ���ظ�
select count(ѧ��) from ѧ�� where ����ϵ = '�����'

select count(distinct ѧ��) from ѡ��


------����ͳ�Ʒ���ͳ������������,������������������
select ����ϵ,count(ѧ��) from ѧ�� group by ����ϵ


--���Ǳ���ԭ�е����� having
select �γ̺�,count(ѧ��) from ѡ�� group by �γ̺� having count(ѧ��)>4


select ����ϵ,count(ѧ��) from ѧ�� group by ����ϵ having count(ѧ��)>100


----���ϲ���
---������
---union all �Ǽ򵥵����в�ȥ�ظ�
select ѧ�� from ѡ�� where �γ̺�='C001' union
select ѧ�� from ѡ�� where �γ̺�='C003'

---������
select ѧ�� from ѡ�� where �γ̺�='C001' intersect
select ѧ�� from ѡ�� where �γ̺�='C003'

---������
select ѧ�� from ѡ�� where �γ̺�='C001' except
select ѧ�� from ѡ�� where �γ̺�='C003'

---------------------------------------------------------
select ѧ�� from ѧ�� except
select ѧ�� from ѡ�� where �γ̺� ='C003'
----------------------------------------
select ѧ�� from ѧ�� except
select ѧ�� from ѡ�� 

------�ѿ�����
select * from �γ�,ѡ��

----����
select ѧ��,�ɼ� from �γ�,ѡ��
where ѡ��.�γ̺� = �γ�.�γ̺� and �γ���='C++'

--�����ӣ������ӳɹ��������������Ӳ��ɹ��Ĳ�Ҫ��

--1��ȷ������Դ
--2��ȷ����������
--3��ȷ��ɸѡ����
--1����һ��д��
select ѧ��.ѧ��,�ɼ� from ѧ��,ѡ��,�γ� where ѧ��.ѧ�� = ѡ��.ѧ�� 
	and ѡ��.�γ̺� = �γ�.�γ̺� and �γ��� = '���ݽṹ' and �ɼ�>90 
--2���ڶ���д����inner���Բ���
select * from ѧ�� inner join ѡ�� on ѧ��.ѧ�� = ѡ��.ѧ�� where ���� = '�ŷ�'

--�����ӣ����Ӳ��ɹ���Ҳ������
--left\right\full
select * from ѡ�� right join ѧ�� on ѧ��.ѧ�� = ѡ��.ѧ��


select ѡ��.ѧ��, �ɼ� from ѡ��,�γ� where �γ�.�γ̺� = ѡ��.�γ̺�
	 and �γ��� = '���ݽṹ';


select ѡ��.ѧ��,�ɼ� from ѡ�� inner join �γ� on �γ�.�γ̺� = ѡ��.�γ̺� where �γ��� = '���ݽṹ'

--��������

select A.�γ̺�,B.���п� ������п� from �γ� A,�γ� B where A.���п�=B.�γ̺� and B.���п� is not null


select �γ�.�γ̺� from �γ� left join  ѡ�� on �γ�.�γ̺� = ѡ��.�γ̺� where ѧ�� is null 

select �γ̺� from �γ�  except
select �γ̺� from ѡ�� 

select * from �γ� esc
select * from ѡ�� esc
select * from ѧ�� esc
----Ƕ�ײ�ѯ  
--�Ӳ�ѯ--�ڲ��ѯ
select ���� from ѧ�� where ѧ�� in( 
select  ѧ�� from ѡ��  where �γ̺�='C002')

select ѧ��,���� from ѧ�� where ѧ�� in (select ѧ�� from ѡ�� where �γ̺� = (
	select �γ̺� from �γ� where �γ��� = '���ݽṹ')
) 

insert into ѧ�� 
	values ('s009', '����', 'Ů', 24, '��ѧ','����')

insert into ѧ�� 
	values ('s010', '�ſ�', '��', 24, '����','����')



--1.��ѯѡ���ˡ�DB�������пε�ѧ��������

select ����,ѧ��.ѧ�� from ѧ�� where ѧ�� in (select ѧ�� from ѡ�� where �γ̺�=(select ���п� from �γ� where �γ���='���ݽṹ'))

--2.���м��ſγ������пΣ�

select count(�γ̺�) �����пεĿγ��� from �γ� where ���п� is not null

--3.�����ַ�������Щѧ��û��ѡ�� (һ�֣������ӣ���һ�֣����ϲ�����
--������
select ���� from ѧ�� left join ѡ�� on ѧ��.ѧ�� = ѡ��.ѧ�� where �γ̺� is  null
--���ϲ���
select ���� from ѧ�� where ѧ�� in (
select ѧ�� from ѧ�� except 
select ѧ�� from ѡ��)


select B.* from ѧ�� A,ѧ�� B where A.���� = '�ŷ�' and A.����ϵ = B.����ϵ

select ѧ��.ѧ��,����,�ɼ� from ѧ��,ѡ��,�γ� where ѧ��.ѧ�� = ѡ��.ѧ�� and ѡ��.�γ̺� = �γ�.�γ̺� and �γ��� = '���ݽṹ'

select * from ѧ�� where ѧ�� in (select ѧ�� from ѡ�� where �γ̺� = 'C001' or �γ̺� = 'C002' ) 

select * from ѡ�� where �γ̺� = 'C002' and ѧ�� In (select ѧ�� from ѡ�� where �γ̺� = 'C001' )


select * from ѡ�� where �γ̺� = 'C001' and �ɼ�>= 
(select �ɼ� from ѡ�� where ѧ�� = 
(select ѧ�� from ѧ�� where ���� = '����'))   


select ����,���� from ѧ�� where ����  <= any(select ���� from ѧ�� where ����ϵ = '�����') and ����ϵ != '�����'

select �γ̺� from ѡ�� group by �γ̺� having count(*) >=all (select count(*) from ѡ�� group by �γ̺�)

--�Ӳ�ѯ�õ��˸���ѯ�õ��Ĳ���
select ���� from ѧ�� where exists(
	select * from ѡ�� where ѧ�� = ѧ��.ѧ�� and �γ̺� = 'C002'
)

select ���� from ѧ�� where exists(
	select * from ѡ�� where ѧ�� = ѧ��.ѧ�� and �γ̺� = 'C002'
)





