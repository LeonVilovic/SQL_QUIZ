-- What will be the result of executing the following SQL code?

CREATE TABLE #Temp (
    Number INT
);

INSERT INTO #Temp
VALUES
    (1),(2),(3),(4);

SELECT TOP 1 * FROM #Temp
ORDER BY NEWID()


--A) Result set: 1
--B) Result set: 4
--C) The code will return a random row from table #Temp as a result set 
--D) The code will raise an error




-- CORRECT ANSWER : C) The code will return a random row from table #Temp as a result set 
-- NEWID is a function used to generete globally unique identifiers (GUID) which are strings that, for example, 
-- look like this: 1B4E92B5-4353-4968-A14A-15AD3D5E1D2E  
-- But you can also use NEWID in the ORDER BY clause to query random data, like in the example above.
