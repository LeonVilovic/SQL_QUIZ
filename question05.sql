-- What will be the result of executing the following SQL code?

EXEC('EXEC sp_isThisACoolDate ?', '2022-11-22') AT coolDates

--A) procedure sp_isThisACoolDate will be executed with parametar '2022-11-22' with result set definition equal to 'coolDates'
--B) code will try to execute procedure sp_isThisACoolDate with parameter ? which will raise an error
--C) procedure sp_isThisACoolDate will be executed with parametar '2022-11-22' at linked server with alias 'coolDates'
--D) procedure sp_isThisACoolDate will be executed with no parametars
