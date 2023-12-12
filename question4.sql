-- What will be the result of executing the following SQL code?

CREATE TABLE #Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

CREATE TABLE #Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

INSERT INTO #Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance');

INSERT INTO #Employees (EmployeeID, FirstName, LastName, Salary, DepartmentID)
VALUES
    (1, 'John', 'Doe', 60000.00, 1),
    (2, 'Jane', 'Smith', 55000.00, 2),
    (3, 'Michael', 'Johnson', 70000.00, 2),
    (4, 'Emily', 'Williams', 62000.00, 1);

SELECT 
    E.FirstName,
    D.DepartmentName,
    Salary * 1.1 AS IncreasedSalary
FROM #Employees E
JOIN #Departments D ON E.DepartmentID = D.DepartmentID
WHERE Salary > (SELECT AVG(Salary) FROM #Employees WHERE DepartmentID = E.DepartmentID);

--A) The code will raise an error 
--B) Result set: Emily	IT	68200.000, Michael	HR	77000.000
--C) Empty result set.
--D) Result set:  Michael	HR	77000.000
