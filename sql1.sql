--������ҵ���۹������ݿ�
create database ��ҵ���۹���;
drop database ��ҵ���۹���;
--1������һ�����ݿ�����ű�ı�ṹ
/*Ա�����±�employee */
create table employee (
    emp_no char(5) not null primary key,--Ա�����
    emp_name char(10) not null,         --Ա������
    sex char(1) not null,               --�Ա�
    dept char(20) null,                 --��������
    title char(20) null,                --ְ��
    date_hired datetime null,           --��ְ��
    birthday datetime null,             --����
    salary int null,                    --нˮ
    addr char(50) null,                 --סַ
    mod_date datetime default getdate() --��������
);
/*�ͻ���customer */
create table customer (
    cust_id char(5) not null primary key, -- �ͻ���
    cust_name char(20) not null,		  -- �ͻ�����
    sex char(1) not null,				  -- �Ա�
    addr char(40) not null,				  -- �ͻ�סַ
    tel_no char(10) not null,             -- �ͻ��绰
    zip char(6) null                      -- ��������
);
/*��������sales */
create table sales (
    order_no char(5) not null primary key,  -- �������
    cust_id char(5) not null,			    -- �ͻ���
    sale_id char(5) not null,			    -- ҵ��Ա���
    tot_amt numeric(9,2) not null default 0,-- ������Ĭ��Ϊ0
    order_date datetime null,				-- ��������
    ship_date datetime null,				-- ��������
    invoice_no char(10) null				-- ��Ʊ����
	constraint fk_sales_cust_id foreign key (cust_id) references customer(cust_id),
    constraint fk_sales_sale_id foreign key (sale_id) references employee(emp_no)
);
/*��Ʒ���Ʊ�product */
create table product (
    prod_id char(5) not null primary key, -- ��Ʒ���
    prod_name char(20) not null -- ��Ʒ����
);
/*������ϸ�� sales_item*/
create table sales_item (
    order_no char(5) not null,					-- �������
    prod_id char(5) not null,					-- ��Ʒ���
    qty int not null default 0,					-- ����������Ĭ��Ϊ0
    unit_price numeric(9,2) not null default 0, -- ���ۣ�Ĭ��Ϊ0
	order_date datetime null,                    -- ��������

    primary key (order_no, prod_id),			-- ��������
    constraint fk_sales_item_prod_id foreign key (prod_id) references product(prod_id),
    constraint fk_sales_item_order_no foreign key (order_no) references sales(order_no)
);

--2������5�ű�Ĺ�ϵͼ
--3���޸ı�ṹ��ͨ��SQL����޸ı�Լ����
--(1)�ڱ�employee����CHECKԼ���������Ա����ű�����E��ͷ��5λ����ţ��Ա�ֻ��ΪM/F��
alter table employee
add constraint chk_emp_no check (emp_no like 'E____')
alter table employee
add constraint chk_sex check (sex in ('M', 'F'));
--(2)Ϊ��������sales�еķ�Ʊ����ֶν���uniqueԼ��
alter table sales
add constraint uq_invoice_no unique (invoice_no);
--(3)�����Ա����ԣ�����ȡֵΪf��m
alter table employee
add constraint chk_employee_sex check (sex in ('f', 'm'));

alter table customer
add constraint chk_customer_sex check (sex in ('f', 'm'));
--4��Ա������Ψһ������emp_no���ԡ�����Ա�������ۼ�������emp_name���ԡ�����
--����Ա����ŵ�Ψһ����
create unique index idx_emp_no on employee (emp_no asc);
--����Ա�������ľۼ�����
--����Լ�����Զ�����һ���ۼ�����
create clustered index idx_emp_name on employee (emp_name asc);

--5��������ͼ
--(1) ��ͼֻ���Ϻ��ͻ���Ϣ�����ͻ��š��ͻ�������סַ��
create view shanghai_customers 
as
select cust_id, cust_name, addr
from customer
where addr like '%�Ϻ�%'
--(2)������������employee��sales������һ����ͼ������ͼ������ͬҵ��Ա�ı�š������������š������ܽ�
create view sales_employee_details as
select e.emp_no, e.emp_name, s.order_no, s.tot_amt
from employee e
join sales s on e.emp_no = s.sale_id;

