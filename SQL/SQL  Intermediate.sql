--What would be treated in the intermediate course
--Joins, 
--Unions, 
--Case Statement, 
--Updating/Deleting DATA, 
--Partition By, 
--Data types, 
--Aliasing, 
--Creating Views, 
--Having vs groupby statement, 
--GETDATE, 
--Primary key vs foreign key.





--Join


select *
from EmployeeDemographics

INSERT INTO EmployeeDemographics VALUES
(ISNULL, 'Holly', 'Flax', '', ''),
(1013, 'Darryl', 'Phibin', '','Male')


select *
from SQLtutorial.dbo.EmployeeDemographics
inner join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID


select *
from SQLtutorial.dbo.EmployeeDemographics
full outer join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID

select *
from SQLtutorial.dbo.EmployeeDemographics
left join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID

select *
from SQLtutorial.dbo.EmployeeDemographics
right join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID


select EmployeeDemographics.EmployeeID, FirstName, LatsName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographics
inner join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID

select Employeeesalary.EmployeeID, FirstName, LatsName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographics
inner join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID


select Employeeesalary.EmployeeID, FirstName, LatsName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographics
right join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID
where FirstName <> 'Michael'
order by Salary desc



select JobTitle,  avg(Salary) as avg_salary
from SQLtutorial.dbo.EmployeeDemographics
right join SQLtutorial.dbo.Employeeesalary
	on EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID
where JobTitle = 'Salesman'
group by JobTitle

 --Union


create table WarehouseEmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LatsName varchar(50),
Age int,
Gender varchar(50),
)

insert into WarehouseEmployeeDemographics values
(1013, 'Darryl', 'Philbin', '', 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')



select *
from SQLtutorial.dbo.EmployeeDemographics
full outer join SQLtutorial.dbo.WarehouseEmployeeDemographics
	on EmployeeDemographics.EmployeeID = 
	WarehouseEmployeeDemographics.EmployeeID


select * 
from EmployeeDemographics
union
select * 
from WarehouseEmployeeDemographics


select * 
from EmployeeDemographics
union all
select * 
from WarehouseEmployeeDemographics
order by EmployeeID


select EmployeeID, FirstName, LatsName
from EmployeeDemographics

select EmployeeID, JobTitle, Salary
from Employeeesalary

--Cases Statement
select FirstName, LatsName, Age
from EmployeeDemographics
where Age is not null
order by Age desc 


select  FirstName, LatsName, Age,
case
	when Age >30 then 'old'
	when Age = 38 then 'stanley'
	else 'Baby'
end 
from EmployeeDemographics
where Age is not null
order by Age desc


select FirstName, LatsName, JobTitle, Salary,
case
	when JobTitle = 'Salesman' then Salary + (Salary* 0.10)
	when JobTitle = 'Accountant' then Salary + (Salary* 0.5)
	when JobTitle = 'HR' then Salary + (Salary*0.0001)
	else Salary + (Salary*0.03)
end as salaryafterincrement
from EmployeeDemographics
join Employeeesalary
	on  EmployeeDemographics.EmployeeID = Employeeesalary.EmployeeID
order by Salary


--Having Clause


select JobTitle, COUNT(JobTitle)
from EmployeeDemographics
join Employeeesalary
	on EmployeeDemographics.EmployeeID = 
	Employeeesalary.EmployeeID
group by JobTitle
having COUNT(JobTitle) > 1


select JobTitle, avg(Salary)
from EmployeeDemographics
join Employeeesalary
	on EmployeeDemographics.EmployeeID = 
	Employeeesalary.EmployeeID
group by JobTitle
having avg(Salary) > 45000
order by AVG(Salary)


--Updating Deleting data

select *
from  EmployeeDemographics

update EmployeeDemographics
set EmployeeID = 1012
where FirstName = 'Holly' and LatsName='Flax'


update EmployeeDemographics
set Age = 31, Gender= 'Female'
where EmployeeID = 1012

delete from EmployeeDemographics
where EmployeeID = 1012

--Aliasing

select FirstName as fname
from EmployeeDemographics

select FirstName + ' ' + LatsName as FullName, demo.EmployeeID
from EmployeeDemographics demo

select  demo.EmployeeID, sal.Salary
from EmployeeDemographics as demo
join Employeeesalary as sal
	on demo.EmployeeID = sal.EmployeeID


--Partition By

select *
from EmployeeDemographics

select *
from Employeeesalary

select * 
from EmployeeDemographics as demo
join Employeeesalary as sal
	on demo.EmployeeID = sal.EmployeeID



select FirstName, LatsName, Gender, Salary
from EmployeeDemographics as demo
join Employeeesalary as sal
	on demo.EmployeeID = sal.EmployeeID



select FirstName, LatsName, Gender, Salary,
count(Gender) over(partition by Gender) as TotalGener
from EmployeeDemographics as demo
join Employeeesalary as sal
	on demo.EmployeeID = sal.EmployeeID



select FirstName, LatsName, Gender, Salary,count(Gender) 
from EmployeeDemographics as demo
join Employeeesalary as sal
	on demo.EmployeeID = sal.EmployeeID
group by FirstName, LatsName, Gender, Salary