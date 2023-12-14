select * from employee
select * from product
select * from sales_item
select * from sales
select * from customer
--3、触发器创建与调用 按要求完成以下功能，在查询分析器中执行程序，并记录结果。
--(1)建立一个触发器sales_item_trigger：
--确保sales中订单金额，等于sale_item中该订单的（销售数量*单价）的总和

create trigger sales_item_trigger
on sales_item
for insert, update, delete
as
begin
    declare @order_no char(5);

    -- insert or update
    if exists (select * from inserted) --如果删除
    begin
        select @order_no = order_no from inserted; 
    end
    else -- delete
    begin
        select @order_no = order_no from deleted;
    end

    update sales
    set tot_amt = (
        select sum(unit_price * qty) from sales_item where order_no = @order_no
    )
    where order_no = @order_no;
end;


--(2)修改某个某个订单的“销售数量”或“单价”。查看sales表中，该订单的“订单金额”的变化
-- 创建触发器
-- 更新销售明细记录
update sales_item
set qty = 20
where order_no = 'D0001' and prod_id = 'P0001';
update sales_item set unit_price = 521 where prod_id = 'P0001'
update sales_item set unit_price = 68 where prod_id = 'P0002'
update sales_item set unit_price = 670 where prod_id = 'P0003'
update sales_item set unit_price = 3000 where prod_id = 'P0004'
update sales_item set unit_price = 352 where prod_id = 'P0005'
update sales_item set unit_price = 258 where prod_id = 'P0006'
update sales_item set unit_price = 336 where prod_id = 'P0007'
update sales_item set unit_price = 230 where prod_id = 'P0008'
update sales_item set unit_price = 8 where prod_id = 'P0009'
update sales_item set unit_price = 35 where prod_id = 'P0010'
alter table sales
alter column tot_amt numeric(9,2) null;

--(3) 删除某个某个订单的一个明细（即一个产品）。查看sales表中，该订单的“订单金额”的变化。
-- 删除sales_item表中的某个订单的一个明细

delete from sales_item
where order_no = 'D0001' and prod_id = 'P0001';

-- 查看sales表中该订单的订单金额
select * from sales where order_no = 'D0001';

--(4) 已经存在的订单，新建该订单的一个明细（即一个产品）。查看sales表中，该订单的“订单金额”的变化。
insert into sales_item (order_no, prod_id, qty, unit_price)
values ('D0001', 'P0001', 10, 5.00);


--(6) 新建一个触发器sales_trigger,当修改sales表中数据时，确保sales中tot_amt（订单金额）
--      不能随意修改，必须和sales_item中信息一致。
create trigger sales_trigger
on sales
after update
as
begin
    declare @order_no char(5);
    declare @new_tot_amt numeric(9,2); --新修改的
    declare @calculated_tot_amt numeric(9,2);--原来的

    select @order_no = order_no from inserted; --新修改的
    select @new_tot_amt = tot_amt from inserted; --新修改的
    
    select @calculated_tot_amt = unit_price * qty
    from sales_item
    where order_no = @order_no;
    
    if @new_tot_amt != @calculated_tot_amt
    begin
        raiserror('Cannot update tot_amt manually, it should match with sales_item data.', 16, 1);--误级别设置为 16，错误状态设置为 1。
        rollback transaction;
    end
end;


update sales
set tot_amt = 5000
where order_no = 'D0001';

--(7)	删除触发器sales_trigger
drop trigger sales_trigger;
