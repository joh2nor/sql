--10.23��ҵ
--1����ѯѡ���ˡ�DB�������пε�ѧ��������
SELECT DISTINCT ѧ��.ѧ��,ѧ��.���� 
FROM ѧ�� 
JOIN ѡ�� ON ѧ��.ѧ�� = ѡ��.ѧ�� 
WHERE ѡ��.�γ̺� = (SELECT ���п� FROM �γ� WHERE �γ��� = '���ݽṹ');

--2�����м��ſγ������пΣ�
SELECT COUNT(*) 
FROM �γ� 
WHERE ���п� IS NOT NULL;

--3�������ַ�������Щѧ��û��ѡ�Σ�
--�����ӣ�
SELECT ѧ��.���� 
FROM ѧ�� 
LEFT JOIN ѡ�� ON ѧ��.ѧ�� = ѡ��.ѧ�� 
WHERE ѡ��.�γ̺� IS NULL;
--���ϲ���
select ���� from ѧ�� where ѧ�� in (
select ѧ�� from ѧ�� except 
select ѧ�� from ѡ��)


--1����ѯѡ����2�ſγ̵�ѧ�����������ַ�������
--ʹ�� INNER JOIN��
SELECT DISTINCT ѧ��.���� 
FROM ѧ�� 
JOIN ѡ�� ON ѧ��.ѧ�� = ѡ��.ѧ�� 
WHERE ѡ��.�γ̺� = 'C002';

--ʹ���Ӳ�ѯ IN��
SELECT ���� 
FROM ѧ�� 
WHERE ѧ�� IN (SELECT ѧ�� FROM ѡ�� WHERE �γ̺� = 'C002');

--ʹ�� EXISTS��
SELECT ���� 
FROM ѧ�� 
WHERE EXISTS (SELECT 1 FROM ѡ�� WHERE ѧ��.ѧ�� = ѡ��.ѧ�� AND �γ̺� = 'C002');

--2����ѯû��ѡ��2�ſγ̵�ѧ�������������ַ�������
--except
SELECT ���� 
FROM ѧ�� 
EXCEPT
SELECT ���� 
FROM ѧ�� 
WHERE ѧ�� IN (SELECT ѧ�� FROM ѡ�� WHERE �γ̺� = 'C002');

--Not Exisit
SELECT ���� 
FROM ѧ�� 
WHERE NOT EXISTS (SELECT 1 FROM ѡ�� WHERE ѧ��.ѧ�� = ѡ��.ѧ�� AND �γ̺� = 'C002');

select * from ѧ��
select * from ѡ�� where �γ̺� = 'C002'
select * from �γ�

--3���ҳ�ÿ��ѧ�������Լ�ѡ�޿γ�ƽ���ɼ��Ŀγ̺ţ�
SELECT �γ̺� 
FROM ѡ�� 
WHERE �ɼ� > (SELECT AVG(�ɼ�) FROM ѡ�� AS sub WHERE sub.ѧ�� = ѡ��.ѧ��);

--4����ѯ������ѧ��ѡ�޵Ŀγ̣�
SELECT �γ̺� 
FROM ѡ�� 
GROUP BY �γ̺� 
HAVING COUNT(DISTINCT ѧ��) = (SELECT COUNT(*) FROM ѧ��);
