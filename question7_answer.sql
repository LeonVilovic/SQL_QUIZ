-- What will be the result of executing the following SQL code?

CREATE TABLE #Requests ( 
    Request_id INT PRIMARY KEY,
    EmployeeID INT,
    Request_date DATE
);

INSERT INTO #Requests (Request_id, EmployeeID, Request_date)
VALUES
    (1, 1, '2023-01-10'),
    (2, 1, '2023-02-11'),
    (3, 2, '2024-07-05'),
    (4, 2, '2020-05-02'),
    (5, 3, '2021-02-24'),
    (6, 4, '2023-03-15'),
    (7, 5, '2022-04-01');

SELECT 
   (SELECT 'R: ' + ltrim(rtrim(c.Request_id)) + ' D: ' + ltrim(rtrim(c.Request_date)) + ' '
    FROM (SELECT b.Request_date,b.Request_id FROM #Requests b WHERE b.EmployeeID = a.EmployeeID) as c
    FOR XML PATH(''))
FROM #Requests a
GROUP BY EmployeeID
HAVING count(EmployeeID) > 1

--A) Result set: R: 1 D: 2023-01-10 R: 2 D: 2023-02-11
--B) Result set: R: 1 D: 2023-01-10 R: 2 D: 2023-02-11 , R: 3 D: 2024-07-05 R: 4 D: 2020-05-02
--C) Result set: R: 5 D: 2021-02-24 , R: 6 D: 2023-03-15 , R: 7 D: 2022-04-01
--D) Result set: R: 3 D: 2024-07-05 R: 4 D: 2020-05-02




-- CORRECT ANSWER : B) Result set: R: 1 D: 2023-01-10 R: 2 D: 2023-02-11 , R: 3 D: 2024-07-05 R: 4 D: 2020-05-02
-- Only requests where EmployeeID is 1 or 2 are shown because of HAVING clause with condition count(EmployeeID) > 1 
-- FOR XML clause is used for displaying row data in a form of an xml document, but in our case we use it to
-- concatenate multiple rows from a subquery into a string. Here is a common variation of this method used to create
-- comma-separated concatenated rows that combines FOR XML PATH('') and STUFF:
--   SELECT
--       STUFF((
--       SELECT ',' + Name
--       FROM temp FOR XML PATH('')
--       ), 1, 1, '')
--   FROM temp
-- In the case above STUFF is used to remove the first comma in the string. In the versions of SQL Server released
-- after 2017 you can simply use STRING_AGG function, but when you have to use an older server version FOR XML 
-- clause should be used.
