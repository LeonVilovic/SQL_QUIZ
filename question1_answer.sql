--Is there a difference between these two SQL batches :

--batch_1--------------------
while exists ( select 1 from Orders where CustId = 1 ) 
delete top(1) from Orders where CustId = 1; 
-----------------------------

--batch_2--------------------
delete from Orders where CustId = 1; 
-----------------------------

--A) YES batch_2 deletes all rows from Orders where CustId = 1 and batch_1 deletes only one row from Orders where CustId = 1
--B) NO batches are functionally same
--C) YES batch_1 has a syntax error and will raise an error  
--D) YES batches are functionally same, but batch_2 can potentially create a large transaction that can be difficult to handle




-- CORRECT ANSWER : D) In case we have a very large number of rows in the table Orders, deleting all orders of customer 1 with 
-- one delete statement, like in batch_2,  will lead to a very big transaction. Problems can arise in handling such a transaction. 
-- Disk space for the transaction log could be critical, transaction can create performance issues, stopping the transaction 
-- could take a long time, etc. 
-- With delete top(n), you can split the large transaction into multiple smaller ones. 
