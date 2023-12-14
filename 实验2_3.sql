select * from employee
select * from product
select * from sales_item
select * from sales
select * from customer

--2.数据查询
--(1)查找所有经理的姓名、职称、薪水。
select emp_name,title,salary 
from employee 
where title like '%经理' 
--(2)找出姓“诸”并且姓名的最后一个字为“亮”的员工。
select * from employee
where emp_name like '诸%亮'
--(3)查找住在上海或北京的女员工，并显示其姓名、所属部门、职称、住址。
select emp_name,dept,title,addr 
from employee
where addr like '%北京%' or addr like '%上海%'
--(4)在表sales中挑出销售金额大于等于10000元订单。
select * from sales 
where tot_amt >= 10000

--(5)选取订单金额最高的前10%的订单数据
--先降序排列，在取前%10
select top 10 percent *
from sales
order by tot_amt desc;

--(6)查找出职称为经理或职称为专员的女员工的信息。
select * from employee 
where (title like '%经理%' or title like '%专员%') and sex = 'F' 

--(7)计算出一共销售了几种产品
select count(distinct prod_id) as product_count
from sales_item;

--(8)显示sale_item表中每种个别产品的订购金额总和，
--并且依据销售金额由大到小排列来显示出每一种产品的排行榜。
select 
	product.prod_name,
	sum(unit_price * qty) as total_sales_amount -- 单价*数量
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

---(9)计算每一产品每月的销售金额总和，并将结果按销售（月份，产品编号）排序。
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
--(10)由sales表中查找出销售金额最高的订单
select top 1 *
from sales
order by tot_amt desc;

select *
from sales
where tot_amt = (select max(tot_amt) from sales);

--(11)	由sales表中查找出订单金额大于“E0005业务员在2023/10/05这天所接任一张订单的金额”的所有订单
--，并显示承接这些订单的业务员和该条订单的金额。

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

--(12)找出公司女业务员所接的订单
select * from sales 
where sale_id 
in (
	select emp_no 
	from employee
	where sex = 'F'
)

--(13)找出公司中姓名相同的员工，并且依据员工编号排序相识这些员工信息	
select e1.* from employee e1
join employee e2
on e1.emp_name = e2.emp_name and e1.emp_no!=e2.emp_no
order by e1.emp_no


---(14)找出目前业绩未超过20000元的员工。
select * from employee
where emp_no in (
	select sale_id from sales
	where tot_amt <= 20000
)

--(15)计算公司内各个部门的工资支出总和。
select dept, sum(salary) as total_salary
from employee
group by dept;


--(16)计算每一产品销售数量总和与平均销售单价。
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

