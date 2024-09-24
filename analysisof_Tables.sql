---------Exploring Data-------------
select
*
from Sales.SalesOrderHeader;

select
*
from Sales.SalesOrderDetail;

select
*
from Sales.Customer;
select
*
from Sales.SalesTerritory;

select
* from Production.Product;

select
*
from Person.Person;

Select
*
from Person.Address;

select
*
from HumanResources.Employee
order by Year(HireDate) ;
select
*
from Sales.SalesPerson
order by BusinessEntityID desc;
select
*
from HumanResources.Department
select
*
from HumanResources.EmployeeDepartmentHistory
order by BusinessEntityID
select
*
from HumanResources.Shift
