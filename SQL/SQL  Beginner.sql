--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LatsName varchar(50),
--Age int,
--Gender varchar(50),
--)

--CREATE TABLE Employeeesalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int
--)

--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--INSERT INTO Employeeesalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--SELECT Statements
--*,TOP, DISTINCT, COUNT, AS, MAX, MIN, AVG

SELECT *
FROM EmployeeDemographics

--SELECT FirstName, LatsName
--FROM EmployeeDemographics

SELECT TOP 5 *
FROM EmployeeDemographics

--SELECT distinct (EmployeeID)
--from EmployeeDemographics

--SELECT distinct (Gender)
--from EmployeeDemographics

--SELECT COUNT (LatsName) as LastNameCount
--from EmployeeDemographics

--SELECT MAX (Salary)
--FROM Employeeesalary

--SELECT AVG (Salary)
--FROM Employeeesalary

--SELECT *
--FROM SQLtutorial.dbo.Employeeesalary


--WHERE Statement
--=, <>, <,>,And, Or, Like, Null, Not, Not Null, In

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName = 'JIM'

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName <> 'JIM'

--SELECT *
--FROM EmployeeDemographics
--WHERE Age > 30


--SELECT *
--FROM EmployeeDemographics
--WHERE Age > 30 AND Gender='Male'

--SELECT *
--FROM EmployeeDemographics
--WHERE Age > 30 OR Gender='Male'

--SELECT *
--FROM EmployeeDemographics
--WHERE LatsName LIKE '%S%'

--SELECT *
--FROM EmployeeDemographics
--WHERE LatsName LIKE 'S%O%'

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName IS NOT NULL


--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName IN ('Jim', 'Michael')



--GROUP BY, Order By


--SELECT *
--FROM EmployeeDemographics

--SELECT Gender, Age, COUNT(Gender)
--FROM EmployeeDemographics
--GROUP BY Gender, Age

--SELECT Gender, Age, COUNT(Gender)AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender, Age
--order by age desc


Select Gender, COUNT(Gender)
From EmployeeDemographics


SELECT  max(Age)
FROM EmployeeDemographics
