
CREATE TABLE Employees (
	EmployeeNumber int PRIMARY KEY,
	EmployeeTitleID VARCHAR,
 	Birth_Date VARCHAR,
	First_Name VARCHAR,
	Last_Name VARCHAR,
	Sex VARCHAR,
	Hire_Date VARCHAR
);


CREATE TABLE Salaries (
	EmployeeNumber int PRIMARY KEY,
	Salary int,
	FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber)
);


CREATE TABLE Titles (
	EmployeeTitleID VARCHAR PRIMARY KEY,
	Title VARCHAR
);


CREATE TABLE Departments(
	DepartmentNumber VARCHAR PRIMARY KEY,
	DepartmentName VARCHAR
);


CREATE TABLE Department_Employees(
	EmployeeNumber int,
	DepartmentNumber VARCHAR,
	CONSTRAINT CompKey_ID_NAME PRIMARY KEY (EmployeeNumber, DepartmentNumber),
	FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber),
	FOREIGN KEY (DepartmentNumber) REFERENCES Departments(DepartmentNumber)
);


CREATE TABLE Department_Managers(
	DepartmentNumber VARCHAR,
	EmployeeNumber int PRIMARY KEY,
	FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber),
	FOREIGN KEY (DepartmentNumber) REFERENCES Departments(DepartmentNumber)
);



ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeNumber
FOREIGN KEY (EmployeeTitleID) REFERENCES Titles(EmployeeTitleID);



