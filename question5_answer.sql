-- What will be the result of executing the following SQL code?

EXEC('EXEC sp_isThisACoolDate ?', '2022-11-22') AT coolDates

--A) procedure sp_isThisACoolDate will be executed with parametar '2022-11-22'
--B) code will try to execute procedure sp_isThisACoolDate with parameter ? which will raise an error
--C) procedure sp_isThisACoolDate will be executed with parametar '2022-11-22' at linked server with alias 'coolDates'
--D) procedure sp_isThisACoolDate will be executed with no parametars




-- CORRECT ANSWER : C) procedure sp_isThisACoolDate will be executed with parametar '2022-11-22' at linked server with alias 'coolDates'
-- In the EXECUTE Syntax the keyword AT refers to the linked server name. A linked server needs to exist and be accessible or else an   
-- error will occur. You can find a list of servers with command 'SELECT * FROM sys.servers'.
