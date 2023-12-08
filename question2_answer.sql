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
	
--DELETE FROM #Employee WHERE EmployeeID = 2

SELECT TOP 1 CONCAT(FirstName,'' '', LastName) as FullName FROM #Employee WHERE EmployeeID >= 2 ORDER BY EmployeeID;
'

EXEC SP_EXECUTESQL @SQL

--A) batch will raise an error
--B) Jane Smith
--C) Michael Johnson  
--D) Jane Smith, Michael Johnson, Emily Williams




-- CORRECT ANSWER : B) Jane Smith. 
-- Commened lines are also ignored inside dynamic SQL string so DELETE statement will not execute. Since the SELECT statement 
-- has the keyword TOP 1 only one record will be returned and because of the ORDER BY EmployeeID clause, first returned row 
-- is a string with value ‘Jane Smith’. 
-- NOTE: putting comments inside dynamic SQL strings is not considered a good practice.
