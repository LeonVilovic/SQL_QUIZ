--Is there a difference between these two SQL statments :

--statment1--------------------
while exists ( select 1 from Orders where CustId = 1 ) 
delete top(1) from Orders where CustId = 1; 
--------------------

--statment2--------------------
delete from Orders where CustId = 1; 
--------------------

--a) YES statment2 deletes all rows from Orders where CustId = 1 and  statment1 deletes only one row from Orders where CustId = 1
--b) NO statments are funcionally same
--c) YES statment1 is with a syntax error and will not work  
--d) YES statments are funcionally same, but statment2 can potentially create a large transaction that can be difficult to handle




--CORRECT ANSWER : d)
