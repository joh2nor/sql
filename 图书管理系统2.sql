select * from 借阅
select * from 图书
select * from 借阅者
alter table 图书 alter column 图书名 char(20)
insert into 图书 values ('B001','数据结构','严蔚敏','清华大学','计算机',35.0)
insert into 图书 values ('B002','计算机组成原理','唐朔飞','清华大学','计算机',35.9)
insert into 图书 values ('B003','C#程序设计','任浩','高等教育出版社','计算机',45.9)
insert into 图书 values ('B004','计算机网络','蒲贺良','浙江大学','计算机',35.0)
insert into 图书 values ('B005','人性的弱点','王五','人民教育出版社','哲学',25.0)
insert into 图书 values ('B006','数字货币','张三','商业出版社','金融',35.0)
insert into 图书 values ('B007','财务管理','关羽','商业出版社','金融',65.0)
insert into 图书 values ('B008','如何成功','马云','杭州师范大学','哲学',55.0)
insert into 图书 values ('B009','墨菲定律','墨菲','美国出版社','物理学',35.8)
insert into 图书 values ('B010','相对论','爱因斯坦','剑桥大学','物理学',35.0)
insert into 图书 values ('B011','乔布斯传','库克','清华大学','哲学',98.0)

insert into 借阅者 values ('P001','刘备','金融','学生','18037995501')
insert into 借阅者 values ('P002','张飞','金融','教师','18037995502')
insert into 借阅者 values ('P003','关羽','金融','教师','18037995503')
insert into 借阅者 values ('P004','诸葛亮','计算机','学生','18037995504')
insert into 借阅者 values ('P005','曹操','计算机','学生','18037995505')
insert into 借阅者 values ('P006','司马懿','计算机','学生','18037995506')
insert into 借阅者 values ('P007','赵云','计算机','学生','18037995507')
insert into 借阅者 values ('P008','孙悟空','计算机','教师','18037995508')
insert into 借阅者 values ('P009','唐僧','土木','学生','18037995509')
insert into 借阅者 values ('P010','沙悟净','养猪','学生','18037995510')
insert into 借阅者 values ('P011','猪八戒','软件工程','学生','18037995511')
insert into 借阅者 values ('P001','韦金芳','计算机','学生','18037995507')

insert into 借阅 values('P001','B001','2010-01-13')
insert into 借阅 values('P002','B001','2010-02-12')
insert into 借阅 values('P003','B001','2010-03-11')
insert into 借阅 values('P001','B002','2010-04-20')
insert into 借阅 values('P001','B005','2010-05-22')
insert into 借阅 values('P001','B006','2010-06-10')
insert into 借阅 values('P005','B004','2010-07-13')
insert into 借阅 values('P006','B003','2010-08-22')
insert into 借阅 values('P008','B008','2010-01-11')
insert into 借阅 values('P009','B001','2010-02-17')
insert into 借阅 values('P010','B001','2010-03-19')
insert into 借阅 values('P011','B006','2010-03-27')

--将金融类书籍价格上浮10%
update 图书 set 单价*=1.1 where 类型='金融'

delete from 图书 where 单价 <10