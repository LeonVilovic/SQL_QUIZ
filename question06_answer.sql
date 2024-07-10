-- What will be the result of executing the following SQL code?

CREATE TABLE #Employee (    
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    DateOfBirth DATE,
    Department NVARCHAR(10),
    Salary DECIMAL(10, 2)
);

INSERT INTO #Employee (EmployeeID,FirstName, LastName, DateOfBirth, Department, Salary)
VALUES
    (1, 'John', 'Doe', '1990-05-15', 'IT', 60000.00),
    (2, 'Jane', 'Smith', '1985-08-22', 'HR', 55000.00),
    (3, 'Jane', 'Smith', '1985-08-22', 'IT', 65000.00),
    (4, 'Michael', 'Johnson', '1988-12-10', 'Finance', 60000.00),
    (5, 'Michael', 'Johnson', '1988-12-10', 'HR', 50000.00),
    (6, 'Michael', 'Johnson', '1994-02-25', 'IT', 56000.00),
    (7, 'Emily', 'Williams',  '1992-03-28', 'Marketing', 62000.00);

WITH CTE AS 
(SELECT 
ROW_NUMBER() OVER (PARTITION BY FirstName, LastName, DateOfBirth ORDER BY EmployeeID) AS RN, 
CONCAT(FirstName,' ',LastName,' ',DateOfBirth,' ',Department) AS EmployeeInfo
FROM #Employee )
SELECT EmployeeInfo
FROM CTE
WHERE RN <> 1

--A) Result set: Jane Smith 1985-08-22 IT, Michael Johnson 1988-12-10 HR
--B) Result set: Jane Smith 1985-08-22 HR, Michael Johnson 1988-12-10 Finance
--C) Result set: Emily Williams 1992-03-28 Marketing, John Doe 1990-05-15 IT 
--D) Result set: Jane Smith 1985-08-22 IT, Michael Johnson 1988-12-10 HR, Michael Johnson 1994-02-25 IT




-- CORRECT ANSWER : A) Result set: Jane Smith 1985-08-22 IT, Michael Johnson 1988-12-10 HR
-- Because ROW_NUMBER() function is using EmployeeID in it's order by clause Michael Johnson 1988-12-10 Finance
-- and Jane Smith 1985-08-22 HR get RN 1 assigned to them. Michael Johnson 1994-02-25 IT gets RN 1 assigned
-- because this Michael Johnson is born on a different date and DateOfBirth column is included in partitioning clause
-- This type of query is useful in selecting or deleting duplicate values in a table.
