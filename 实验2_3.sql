select * from employee
select * from product
select * from sales_item
select * from sales
select * from customer

--2.���ݲ�ѯ
--(1)�������о����������ְ�ơ�нˮ��
select emp_name,title,salary 
from employee 
where title like '%����' 
--(2)�ҳ��ա���������������һ����Ϊ��������Ա����
select * from employee
where emp_name like '��%��'
--(3)����ס���Ϻ��򱱾���ŮԱ��������ʾ���������������š�ְ�ơ�סַ��
select emp_name,dept,title,addr 
from employee
where addr like '%����%' or addr like '%�Ϻ�%'
--(4)�ڱ�sales���������۽����ڵ���10000Ԫ������
select * from sales 
where tot_amt >= 10000

--(5)ѡȡ���������ߵ�ǰ10%�Ķ�������
--�Ƚ������У���ȡǰ%10
select top 10 percent *
from sales
order by tot_amt desc;

--(6)���ҳ�ְ��Ϊ�����ְ��ΪרԱ��ŮԱ������Ϣ��
select * from employee 
where (title like '%����%' or title like '%רԱ%') and sex = 'F' 

--(7)�����һ�������˼��ֲ�Ʒ
select count(distinct prod_id) as product_count
from sales_item;

--(8)��ʾsale_item����ÿ�ָ����Ʒ�Ķ�������ܺͣ�
--�����������۽���ɴ�С��������ʾ��ÿһ�ֲ�Ʒ�����а�
select 
	product.prod_name,
	sum(unit_price * qty) as total_sales_amount -- ����*����
from 
	sales_item 
join 
	product
on	
	sales_item.prod_id = product.prod_id
group by 
	product.prod_name
order by 
	total_sales_amount desc;

---(9)����ÿһ��Ʒÿ�µ����۽���ܺͣ�������������ۣ��·ݣ���Ʒ��ţ�����
select 
    format(order_date, 'MM') as month,
    prod_id,
    sum(unit_price * qty) as total_sales_amount
from 
    sales_item
group by 
    format(order_date, 'MM'),
    prod_id
order by 
    month asc,
    prod_id asc;
--(10)��sales���в��ҳ����۽����ߵĶ���
select top 1 *
from sales
order by tot_amt desc;

select *
from sales
where tot_amt = (select max(tot_amt) from sales);

--(11)	��sales���в��ҳ����������ڡ�E0005ҵ��Ա��2023/10/05����������һ�Ŷ����Ľ������ж���
--������ʾ�н���Щ������ҵ��Ա�͸��������Ľ�

select emp_name,tot_amt 
from
	employee
join 
	sales 
on 
	employee.emp_no = sales.sale_id
where tot_amt > (
	select 
		 max(tot_amt) 
	from 
		sales 
	where 
		sale_id = 'E0005' 
		and 
		convert(date, order_date) = '2023-10-05')

--(12)�ҳ���˾Ůҵ��Ա���ӵĶ���
select * from sales 
where sale_id 
in (
	select emp_no 
	from employee
	where sex = 'F'
)

--(13)�ҳ���˾��������ͬ��Ա������������Ա�����������ʶ��ЩԱ����Ϣ	
select e1.* from employee e1
join employee e2
on e1.emp_name = e2.emp_name and e1.emp_no!=e2.emp_no
order by e1.emp_no


---(14)�ҳ�Ŀǰҵ��δ����20000Ԫ��Ա����
select * from employee
where emp_no in (
	select sale_id from sales
	where tot_amt <= 20000
)

--(15)���㹫˾�ڸ������ŵĹ���֧���ܺ͡�
select dept, sum(salary) as total_salary
from employee
group by dept;


--(16)����ÿһ��Ʒ���������ܺ���ƽ�����۵��ۡ�
select 
    product.prod_name, 
    sum(qty) as total_quantity, 
    avg(unit_price) as average_unit_price
from 
    sales_item
join product
on product.prod_id = sales_item.prod_id
group by 
    product.prod_name

