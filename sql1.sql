--创建企业销售管理数据库
create database 企业销售管理;
drop database 企业销售管理;
--1、建立一个数据库和五张表的表结构
/*员工人事表employee */
create table employee (
    emp_no char(5) not null primary key,--员工编号
    emp_name char(10) not null,         --员工姓名
    sex char(1) not null,               --性别
    dept char(20) null,                 --所属部门
    title char(20) null,                --职称
    date_hired datetime null,           --到职日
    birthday datetime null,             --生日
    salary int null,                    --薪水
    addr char(50) null,                 --住址
    mod_date datetime default getdate() --操作日期
);
/*客户表customer */
create table customer (
    cust_id char(5) not null primary key, -- 客户号
    cust_name char(20) not null,		  -- 客户名称
    sex char(1) not null,				  -- 性别
    addr char(40) not null,				  -- 客户住址
    tel_no char(10) not null,             -- 客户电话
    zip char(6) null                      -- 邮政编码
);
/*销售主表sales */
create table sales (
    order_no char(5) not null primary key,  -- 订单编号
    cust_id char(5) not null,			    -- 客户号
    sale_id char(5) not null,			    -- 业务员编号
    tot_amt numeric(9,2) not null default 0,-- 订单金额，默认为0
    order_date datetime null,				-- 订货日期
    ship_date datetime null,				-- 出货日期
    invoice_no char(10) null				-- 发票号码
	constraint fk_sales_cust_id foreign key (cust_id) references customer(cust_id),
    constraint fk_sales_sale_id foreign key (sale_id) references employee(emp_no)
);
/*产品名称表product */
create table product (
    prod_id char(5) not null primary key, -- 产品编号
    prod_name char(20) not null -- 产品名称
);
/*销货明细表 sales_item*/
create table sales_item (
    order_no char(5) not null,					-- 订单编号
    prod_id char(5) not null,					-- 产品编号
    qty int not null default 0,					-- 销售数量，默认为0
    unit_price numeric(9,2) not null default 0, -- 单价，默认为0
	order_date datetime null,                    -- 订单日期

    primary key (order_no, prod_id),			-- 联合主键
    constraint fk_sales_item_prod_id foreign key (prod_id) references product(prod_id),
    constraint fk_sales_item_order_no foreign key (order_no) references sales(order_no)
);

--2、建立5张表的关系图
--3、修改表结构，通过SQL语句修改表约束。
--(1)在表employee加入CHECK约束：输入的员工编号必须以E开头的5位数编号，性别只能为M/F。
alter table employee
add constraint chk_emp_no check (emp_no like 'E____')
alter table employee
add constraint chk_sex check (sex in ('M', 'F'));
--(2)为销售主表sales中的发票编号字段建立unique约束
alter table sales
add constraint uq_invoice_no unique (invoice_no);
--(3)所有性别属性，限制取值为f或m
alter table employee
add constraint chk_employee_sex check (sex in ('f', 'm'));

alter table customer
add constraint chk_customer_sex check (sex in ('f', 'm'));
--4、员工表建立唯一索引：emp_no属性、升序；员工表建立聚集索引：emp_name属性、升序
--创建员工编号的唯一索引
create unique index idx_emp_no on employee (emp_no asc);
--创建员工姓名的聚集索引
--主键约束会自动创建一个聚集索引
create clustered index idx_emp_name on employee (emp_name asc);

--5、创建视图
--(1) 视图只含上海客户信息，即客户号、客户姓名、住址。
create view shanghai_customers 
as
select cust_id, cust_name, addr
from customer
where addr like '%上海%'
--(2)有两个基本表employee和sales，创建一个视图，该视图包含相同业务员的编号、姓名、订单号、销售总金额。
create view sales_employee_details as
select e.emp_no, e.emp_name, s.order_no, s.tot_amt
from employee e
join sales s on e.emp_no = s.sale_id;

