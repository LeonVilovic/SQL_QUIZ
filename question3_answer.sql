--What is the output of this SQL batch :

DECLARE @SQL NVARCHAR(MAX)

SET @SQL='
    CREATE TABLE #Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    DateOfBirth DATE,
    Department NVARCHAR(10),
    Salary DECIMAL(10, 2)
);

INSERT INTO #Employee (EmployeeID, FirstName, LastName, DateOfBirth, Department, Salary)
VALUES
    (1, ''John'', ''Doe'', ''1990-05-15'', ''IT'', 60000.00),
    (2, ''Jane'', ''Smith'', ''1985-08-22'', ''HR'', 55000.00),
    (3, ''Michael'', ''Johnson'', ''1988-12-10'', ''Finance'', 70000.00),
    (4, ''Emily'', ''Williams'',  ''1992-03-28'', ''Marketing'', 62000.00)
'
EXEC SP_EXECUTESQL @SQL

SELECT TOP 1 CONCAT(FirstName,' ', LastName) as FullName FROM #Employee WHERE EmployeeID = 2;

--A) batch will raise an error
--B) Jane Smith
--C) Michael Johnson  
--D) Jane Smith, Michael Johnson, Emily Williams




-- CORRECT ANSWER : A) batch will raise an error
-- Temporary tables created inside a dynamic SQL only exist in the scope of the dynamic SQL. After the statment 
-- 'EXEC SP_EXECUTESQL @SQL' temporary table #Employee is dropped so 'Invalid object name '#Employee'.' error is raised. 
-- If you need a temporary table to persist beyond the scope of a session, you might consider using a global temporary table, 
-- which is denoted with a double ## before the table name (##Employee).
