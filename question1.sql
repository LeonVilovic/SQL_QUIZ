--Is there a difference between these two SQL batches :

--batch_1--------------------
while exists ( select 1 from Orders where CustId = 1 ) 
delete top(1) from Orders where CustId = 1; 
-----------------------------

--batch_2--------------------
delete from Orders where CustId = 1; 
-----------------------------

--A) YES batch_2 deletes all rows from Orders where CustId = 1 and batch_1 deletes only one row from Orders where CustId = 1
--B) NO batches are funcionally same
--C) YES batch_1 has a syntax error and will raise an error  
--D) YES batches are funcionally same, but batch_2 can potentially create a large transaction that can be difficult to handle
