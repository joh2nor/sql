select * from ����
select * from ͼ��
select * from ������
alter table ͼ�� alter column ͼ���� char(20)
insert into ͼ�� values ('B001','���ݽṹ','��ε��','�廪��ѧ','�����',35.0)
insert into ͼ�� values ('B002','��������ԭ��','��˷��','�廪��ѧ','�����',35.9)
insert into ͼ�� values ('B003','C#�������','�κ�','�ߵȽ���������','�����',45.9)
insert into ͼ�� values ('B004','���������','�Ѻ���','�㽭��ѧ','�����',35.0)
insert into ͼ�� values ('B005','���Ե�����','����','�������������','��ѧ',25.0)
insert into ͼ�� values ('B006','���ֻ���','����','��ҵ������','����',35.0)
insert into ͼ�� values ('B007','�������','����','��ҵ������','����',65.0)
insert into ͼ�� values ('B008','��γɹ�','����','����ʦ����ѧ','��ѧ',55.0)
insert into ͼ�� values ('B009','ī�ƶ���','ī��','����������','����ѧ',35.8)
insert into ͼ�� values ('B010','�����','����˹̹','���Ŵ�ѧ','����ѧ',35.0)
insert into ͼ�� values ('B011','�ǲ�˹��','���','�廪��ѧ','��ѧ',98.0)

insert into ������ values ('P001','����','����','ѧ��','18037995501')
insert into ������ values ('P002','�ŷ�','����','��ʦ','18037995502')
insert into ������ values ('P003','����','����','��ʦ','18037995503')
insert into ������ values ('P004','�����','�����','ѧ��','18037995504')
insert into ������ values ('P005','�ܲ�','�����','ѧ��','18037995505')
insert into ������ values ('P006','˾��ܲ','�����','ѧ��','18037995506')
insert into ������ values ('P007','����','�����','ѧ��','18037995507')
insert into ������ values ('P008','�����','�����','��ʦ','18037995508')
insert into ������ values ('P009','��ɮ','��ľ','ѧ��','18037995509')
insert into ������ values ('P010','ɳ��','����','ѧ��','18037995510')
insert into ������ values ('P011','��˽�','�������','ѧ��','18037995511')
insert into ������ values ('P001','Τ��','�����','ѧ��','18037995507')

insert into ���� values('P001','B001','2010-01-13')
insert into ���� values('P002','B001','2010-02-12')
insert into ���� values('P003','B001','2010-03-11')
insert into ���� values('P001','B002','2010-04-20')
insert into ���� values('P001','B005','2010-05-22')
insert into ���� values('P001','B006','2010-06-10')
insert into ���� values('P005','B004','2010-07-13')
insert into ���� values('P006','B003','2010-08-22')
insert into ���� values('P008','B008','2010-01-11')
insert into ���� values('P009','B001','2010-02-17')
insert into ���� values('P010','B001','2010-03-19')
insert into ���� values('P011','B006','2010-03-27')

--���������鼮�۸��ϸ�10%
update ͼ�� set ����*=1.1 where ����='����'

delete from ͼ�� where ���� <10