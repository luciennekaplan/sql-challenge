-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT E.employeenumber, E.first_name, E.last_name, E.sex, S.salary
	FROM Employees E 
	JOIN Salaries S ON E.Employeenumber = S.Employeenumber;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date 

-- List the manager of each department with the following 
-- information: department number, department name, the manager's employee number, last name, first name.

SELECT E.employeenumber, E.first_name, E.last_name, DM.departmentnumber, D.departmentname
	FROM Employees E
	JOIN Department_Managers DM ON E.Employeenumber = DM.Employeenumber
	JOIN Departments D ON DM.departmentnumber = D.departmentnumber;
	
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT E.employeenumber, E.first_name, E.last_name, D.departmentname
	FROM Employees E
	JOIN Department_Employees DE ON E.Employeenumber = DE.Employeenumber
	JOIN Departments D ON DE.departmentnumber = D.departmentnumber;
	
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name like '%B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

WITH SalesDeptNumber AS (
    SELECT  departmentnumber, departmentname
    FROM    Departments
    WHERE   departmentname = 'Sales'    
)
, SalesEmpNumbers AS (
    SELECT  employeenumber, departmentname
    FROM    Department_Employees DE
            JOIN SalesDeptNumber SDN ON DE.departmentnumber = SDN.departmentnumber
)
SELECT  first_name, last_name, departmentname, E.employeenumber
FROM    Employees E
        JOIN SalesEmpNumbers SEN ON E.Employeenumber = SEN.Employeenumber;

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

WITH SalesDeptNumber AS (
    SELECT  departmentnumber, departmentname
    FROM    Departments
    WHERE   departmentname = 'Sales' OR departmentname = 'Development'
)
, SalesEmpNumbers AS (
    SELECT  employeenumber, departmentname
    FROM    Department_Employees DE
            JOIN SalesDeptNumber SDN ON DE.departmentnumber = SDN.departmentnumber
)
SELECT  first_name, last_name, departmentname, E.employeenumber
FROM    Employees E
        JOIN SalesEmpNumbers SEN ON E.Employeenumber = SEN.Employeenumber;
		
		
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM Employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
