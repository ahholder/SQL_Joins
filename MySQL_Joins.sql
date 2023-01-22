/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.name, c.name
from products as p
inner join categories as c
on c.categoryid = p.categoryid
where c.name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.name, p.price, r.rating
from products as p
inner join reviews as r
where r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.firstname, e.lastname, sum(s.quantity) as total
from sales as s
inner join employees as e on e.employeeid = s.employeeid
group by e.EmployeeID
order by total desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'Department Name', c.Name as 'Category Name'
from departments as d
inner join categories as c on c.departmentid = d.departmentid
where c.name = 'Appliances' or c.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.name, sum(s.quantity) as 'Total # Sold', Sum(s.Quantity * s.priceperunit) as 'Total Price Sold'
 from products as p
 inner join sales as s on s.productid = p.productid
 where p.productid = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- select * from products;
select p.name, r.reviewer, r.rating, r.comment
from products as p
inner join reviews as r on r.productid = p.productid
where p.productid = 857
order by r.rating asc
limit 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.employeeid as 'I.D.', e.firstname as 'First', e.lastname as 'Last', p.name as 'Product', s.quantity
from sales as s
inner join products as p on s.productid = p.productid
inner join employees as e on e.employeeid = s.employeeid
order by e.lastname asc, e.firstname asc;