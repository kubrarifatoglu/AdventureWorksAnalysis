----New Model for Sales Performance------
---SalesPerformance---
select
SalesPersonID,
CustomerID,
TotalDue,
sod.ProductID,
p.Name ProductName,
soh.TerritoryID,
st.Name TerritoryName,
sod.OrderQty,
soh.OrderDate,
YEAR(OrderDate) SalesYear,
DateName(Month,OrderDate) SalesMonth,
case
	when DATEPART(QUARTER,OrderDate)=1 then 'Q1'
	when DATEPART(QUARTER,OrderDate)=2 then 'Q2'
	when DATEPART(QUARTER,OrderDate)=3 then 'Q3'
	else 'Q4'
end SalesQuarter
from Sales.SalesOrderDetail sod
join Sales.SalesOrderHeader soh on soh.SalesOrderID=sod.SalesOrderID
join Sales.SalesTerritory st on st.TerritoryID=soh.TerritoryID
join Production.Product p on p.ProductID=sod.ProductID;
-----HR Analysis-------
--Kaç yýldýr çalýþýyor kýdem(2006-2013), Yaþ, JobTitle, Gender
Select
e.BusinessEntityID,
JobTitle,
d.Name DepartmentName,
d.GroupName GroupName,
Gender,
SickLeaveHours,
s.Name ShiftTime,
case
	when DATEDIFF(YEAR,HireDate,GETDATE()) <13 then 'Jr.'
	when DATEDIFF(YEAR,HireDate,GETDATE()) between 13 and 16 then 'Mid'
	else 'Senior'
end ExperienceLevel,
case
	when DATEDIFF(YEAR,BirthDate,GETDATE())< 40 then '18-40 Age Group'
	when DATEDIFF(YEAR,BirthDate,GETDATE()) between 40 and 60 then '40-60 Age Group'
	else '60+ Age Group'
end AgeGroup
from HumanResources.Employee e
left join HumanResources.EmployeeDepartmentHistory ed on ed.BusinessEntityID=e.BusinessEntityID
left join HumanResources.Department d on ed.DepartmentID=d.DepartmentID
left join HumanResources.Shift s on ed.ShiftID=s.ShiftID;
---CustomerAnalysis-----
select
sc.CustomerID,
SUM(TotalDue) TotalSales,
DENSE_RANK() Over(Order by Sum(TotalDue) desc) SalesRank
from Sales.SalesOrderHeader soh
right join Sales.Customer sc on sc.CustomerID=soh.CustomerID
group by sc.CustomerID
order by CustomerID desc
