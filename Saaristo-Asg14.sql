

--14 #1

use MyGuitarShop
select a.customerID, firstname + ' ' + lastname as FullName, city as BillingCity, [state] as BillingState,
'A14 #1 Customers with BILLING State of MI or MN or WI' as QueryInfo
from Addresses a
join Customers c on a.AddressID = c.BillingAddressID
where [state] in ( 'WI', 'MN', 'MI' )
order by billingstate, a.customerID

--14 #2

use  MyGuitarShop
select top 20 c.CustomerID, firstname + ' ' + lastname as FullName, o.OrderID, OrderDate, ItemPrice, Quantity,
ItemPrice * Quantity as Linetotal, ProductName, CategoryName, 'A14 #2 Customer Orders' as QueryInfo
from Customers c
join orders o on c.CustomerID = o.CustomerID
join OrderItems oi on o.OrderID = oi.OrderID
join Products p on oi.ProductID = p.ProductID
join Categories ca on p.CategoryID = ca.CategoryID
order by LastName, OrderID

--14 #3

select top 20 c.CustomerID, (firstname + ' ' + lastname) as FullName, ItemPrice * Quantity as TotalOrders,
'A14 #3 Customer Orders Total Orders' as QueryInfo
from Customers c
join orders o on c.CustomerID = o.CustomerID
join OrderItems oi on o.OrderID = oi.OrderID
join Products p on oi.ProductID = p.ProductID
join Categories ca on p.CategoryID = ca.CategoryID
group by c.CustomerID, c.FirstName, c.LastName, oi.ItemPrice, oi.Quantity
having sum(itemprice *( quantity)) <> 0
order by TotalOrders desc

select * from OrderItems
select * from Orders

--14 #4

use MyGuitarShop
select top 20 c.CustomerID, firstname + ' ' + lastname as FullName, sum((ItemPrice) * Quantity) as TotalOrders,
'A14 #4 Customer Orders > 1000' as QueryInfo
from Customers c
join orders o on c.CustomerID = o.CustomerID
join OrderItems oi on o.OrderID = oi.OrderID
join Products p on oi.ProductID = p.ProductID
join Categories ca on p.CategoryID = ca.CategoryID
group by c.CustomerID, FirstName, LastName, ItemPrice, Quantity

--14 #5

select p.ProductID, ProductCode, ProductName, CategoryName, sum(quantity) as SumOfProductsSold,
'A14 #5 Sum of Products Sold' as QueryInfo
from Customers c
join orders o on c.CustomerID = o.CustomerID
join OrderItems oi on o.OrderID = oi.OrderID
join Products p on oi.ProductID = p.ProductID
join Categories ca on p.CategoryID = ca.CategoryID
group by p.ProductID, ProductCode, ProductName, CategoryName
order by SumOfProductsSold desc

--14 #6
select c.CustomerID,  firstname + ' ' + lastname as FullName, 
'A14 #6 Customer who have never purchased... Slackers!' as QueryInfo
from Customers c
left join orders o on c.CustomerID = o.CustomerID
left join OrderItems oi on o.OrderID = oi.OrderID
left join Products p on oi.ProductID = p.ProductID
left join Categories ca on p.CategoryID = ca.CategoryID
order by CustomerID desc




select * from OrderItems
select * from Orders
select * from Categories
select * from Products
select * from Customers
select * from Addresses
