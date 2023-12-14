create database 图书管理数据库
drop table 图书
create table 图书(
	编号 char(10) primary key,
	图书名 char(8),
	作者 char(8) ,
	出版社 int,
	类型 char(10),
	单价 float
)

drop table 借阅者

create table 借阅者(
	编号 char(10) primary key,
	姓名 char(8) ,
	专业 char(10) ,
	读者类型 char(10) check(读者类型 in ('教师','学生')),
	联系方法 char(11),

)
drop table 借阅
create table 借阅(
	读者编号 char(10),
	图书编号 char(10),
	借阅日期 date

	constraint PK_借阅 primary key (读者编号, 图书编号)--记录约束
	foreign key(读者编号) references 借阅者,
	foreign key(图书编号) references 图书
)

