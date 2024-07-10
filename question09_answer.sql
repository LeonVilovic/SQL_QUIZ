-- What will be the result of executing the following SQL code?

SELECT DATETRUNC(month, '2023-12-09 10:35:20.1221767');

--A) Returns: 2023-01-09 10:35:20.1221767
--B) Returns: 2023-12
--C) Returns: 2023-12-01 00:00:00.0000000
--D) Returns: 2023-12-09 00:00:00.0000000




-- CORRECT ANSWER : C) Returns: 2023-12-01 00:00:00.0000000
-- DATETRUNC function returns an input date truncated to a specified date-part.
-- This funtion can for example help to simplify summarizeing of sales data by different time periods
-- 