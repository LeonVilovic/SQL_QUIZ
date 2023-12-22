-- What will be the result of executing the following SQL code?

CREATE TABLE #Temp (
    Number INT
);

INSERT INTO #Temp
VALUES
    (4),(3),(2),(1);

SELECT TOP 1 * FROM #Temp
ORDER BY NEWID();


--A) Result set: 1
--B) Result set: 4
--C) The code will return a random row from table #Temp as a result set 
--D) The code will raise an error
