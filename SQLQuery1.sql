CREATE DATABASE S15_L4;

USE S15_L4;

CREATE TABLE Employments (
	IdEmployment INT IDENTITY(1,1) PRIMARY KEY,
	Title NVARCHAR(200) NOT NULL,
	EmploymentHiring DATE NOT NULL
);

CREATE TABLE Employees (
	IdEmployee INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeName NVARCHAR(50) NOT NULL,
	EmployeeSurname NVARCHAR(50) NOT NULL,
	FiscalCode NVARCHAR(17) NOT NULL UNIQUE,
	Age INT NOT NULL,
	Income DECIMAL(7,2) NOT NULL,
	TaxDeduction BIT NOT NULL DEFAULT 0,
	IdEmployment INT NOT NULL,
	CONSTRAINT FK_employee_employment FOREIGN KEY (IdEmployment) REFERENCES Employments(IdEmployment),
	CONSTRAINT CK_income CHECK (Income > 500)
);


-- Employee 1
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('CEO', '2000-02-13');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Mario', 'Rossi', 'RSSMRO00A00A000A', 36, 1700, 1, 1);

-- Employee 2
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Junior Front-End', '2015-05-23');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Luca', 'Bianchi', 'BNCLCA00A00A000A', 21, 1200, 0, 2);

-- Employee 3
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Junior Back-End', '2020-10-30');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Marianna', 'Verdi', 'VRDMRN00A00A000A', 28, 1500, 1, 3);

-- Employee 4
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Senior Full-Stack', '2010-04-03');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Giulia', 'Neri', 'NRIGLA00A00A000A', 40, 2200, 1, 4);

-- Employee 5
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('DEV-OPS', '2022-06-12');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Francesco', 'Gialli', 'GLLFRN00A00A000A', 19, 1800, 0, 5);

-- Employee 6
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Tester', '2008-12-10');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Sara', 'Blu', 'BLUSRA00A00A000A', 24, 700, 0, 6);

-- Employee 7
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Project Manager', '2007-01-10');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Alessandro', 'Ferrari', 'FRRLSS00A00A000A', 42, 3000, 1, 7);

-- Employee 8
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Designer', '2008-05-27');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Marta', 'Ricci', 'RCCMRT00A00A000A', 26, 1600, 0, 8);

-- Employee 9
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('SEO', '2005-09-17');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Giovanni', 'Esposito', 'SPSGVN00A00A000A', 34, 2700, 1, 9);

-- Employee 10
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Cleaner', '2007-01-10');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Marco', 'Polo', 'PLOMRC00A00A000A', 30, 1500, 0, 10);

-- Employee 11
INSERT INTO Employments (Title, EmploymentHiring)
VALUES ('Human Resource', '2007-08-20');

INSERT INTO Employees (EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, IdEmployment)
VALUES ('Patrizia', 'Gallone', 'GLLPTR00A00A000A', 25, 2000, 0, 11);


SELECT * FROM Employments;

SELECT * FROM Employees;


-- Request a
SELECT * FROM Employees WHERE Age > 29;

-- Request b
SELECT * FROM Employees WHERE Income >= 800;

-- Request c
SELECT * FROM Employees WHERE TaxDeduction = 0;

-- Request d
SELECT * FROM Employees WHERE TaxDeduction = 1;

-- Request e
SELECT * FROM Employees WHERE EmployeeSurname LIKE 'G%' ORDER BY EmployeeSurname ASC;

-- Request f
SELECT COUNT(*) as TotalEmployees FROM Employees;

-- Request g
SELECT SUM(Income) as TotalIncomes FROM Employees;

-- Request h
SELECT AVG(Income) as IncomeAverage FROM Employees;

-- Request i
SELECT MAX(Income) as MaxIncome FROM Employees;

-- Request j
SELECT MIN(Income) as MinIncome FROM Employees;

-- Request k
SELECT IdEmployee, EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, Title, EmploymentHiring
FROM Employees
INNER JOIN
Employments ON
Employees.IdEmployment = Employments.IdEmployment
WHERE Employments.EmploymentHiring BETWEEN '2007-01-01' AND '2008-01-01';

-- Request l
SELECT IdEmployee, EmployeeName, EmployeeSurname, FiscalCode, Age, Income, TaxDeduction, Title, EmploymentHiring
FROM Employees
INNER JOIN
Employments ON
Employees.IdEmployment = Employments.IdEmployment
WHERE Employments.Title LIKE '%or%';

-- Request m
SELECT AVG(Age) as AverageAge FROM Employees;
