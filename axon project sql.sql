# 1 Total sales 
select sum(quantityordered * priceEach) as total_sales from orderdetails;

# 2 Actual Sales
select sum(quantityordered * buyprice) as Actual_Sales
from products p
join orderdetails od on p.productcode = od.productCode;

# 3 Profit
SELECT
    (SELECT SUM(quantityordered * priceEach) FROM orderdetails) -
    (SELECT SUM(quantityordered * buyprice) FROM products p JOIN orderdetails od ON p.productcode = od.productCode) AS profit;

# 4 Total Customer
select count(customernumber) as Total_customer from customers;

# 5 Total Employees
select count(employeenumber) as total_employee from employees;

# 6 Total Product
select count(productcode) from products;

# 7 Total Quantity Sold
Select sum(quantityordered) from orderdetails;

# 8 Total Order
select count(distinct(ordernumber)) as Total_order from orderdetails;


# 9 Total quantity of stocks available

Select sum(quantityInStock) from products;



# 10 How many Orders have been shipped, cancelled, resolved in 2003, 2004, 2005

SELECT
    o.status,
    YEAR(o.shippeddate) AS year,
    COUNT(*) AS total_orders,
    SUM(quantityordered) AS sum_of_quantity_ordered
FROM
    orders o
JOIN
    orderdetails od ON o.ordernumber = od.ordernumber
WHERE
    YEAR(o.shippeddate) in(2003, 2004, 2005)
GROUP BY
    o.status, YEAR(o.shippeddate);
       















