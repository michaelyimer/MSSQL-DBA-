
USE TRANTEST
GO

SELECT * FROM Product		


/*  ISOLATION LEVELS ARE A MECHANISM TO CONTROL THE DEGREE OF DEPENDANCY BETWEEN TRANSACTIONS.
THESE ISOLATION LEVELS OPERATE AT INDIVIDUAL SESSION LEVEL. 
*/

-- ISOLATION LEVEL #1: READ COMMITTED ISOLATION LEVEL
SET TRANSACTION ISOLATION LEVEL READ COMMITTED		-- WE CAN READ COMMITTED DATA IF THERE ARE NO PENDING COMMITS
SELECT * FROM Product								-- BLOCKING. REASON : DUE TO LOCK WAITS


-- ISOLATION LEVEL #2: READ UNCOMMITTED ISOLATION LEVEL
-- WRITERS DO NOT BLOCK READERS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED	-- WE CAN READ COMMITTED & UNCOMITED DATA EVEN IF THERE ARE PENDING COMMITS
SELECT * FROM Product								-- NO BLOCKING BUT DIRTY READS. MEANS : NO LOCK WAITS


-- ISOLATION LEVEL #3: SERIALIZABLE ISOLATION LEVEL
-- READERS (SELECT)  BLOCK WRITERS (INSERTS, UPDATES, DELETES). 
-- WRITERS (INSERTS, UPDATES, DELETES) BLOCK READERS  (SELECT).
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SELECT * FROM Product					-- BLOCKING


-- ISOLATION LEVEL #4: SNAPSHOT ISOLATION LEVEL
-- READERS DO NOT BLOCK WRITERS. 
-- WRITERS DO NOT BLOCK READERS.
-- OFFERS BETTER PERFORMANCE, USES TEMPDB FOR "PAGE VERSIONING"

-- STEP 1: ENSURE NO OTHER USER IS CONNECTED TO THE DATABASE. MEANS, TO CANCELL ONGOING TRANSACTIONS. DISCONNECT THE DATABASE.
USE MASTER 
GO
ALTER DATABASE TRANTEST SET ALLOW_SNAPSHOT_ISOLATION  ON

-- STEP 2: START THE OPEN TRANSACTION FROM THE 1ST QUERY FILE
USE TRANTEST 
GO
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
SELECT * FROM Product					-- NO BLOCKING AND NO DIRTY READS


-- ISOLATION LEVEL #5: REPEATABLE READ ISOLATION LEVEL
-- APPLICABLE FOR REPEATED READS WITHIN A TRANSACTION
-- SHARED LOCKS (APPLICABLE FOR "SELECT") ARE RELEASED AT END OF THE TRANSACTION
-- THIS MEANS, THE READ (SHARED) LOCKS ARE not RELEASED FOR EVERY SELECT STATEMENT. DUE TO THIS, WE SEE "PHANTOM READS"
-- APPLICABLE FOR REPORTING SOLUTIONS : SSRS, POWER BI, TABLEU, QLICKVIEW ...
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION T2
SELECT * FROM Product		-- LOCKS ARE ALLOCATED
-- FEW DML / DDL OPERATIONS
SELECT * FROM Product		-- LOCKS ARE REUSED
-- FEW DML / DDL OPERATIONS
SELECT * FROM Product		-- LOCKS ARE REUSED
COMMIT TRANSACTION T2		-- SHARED LOCKS ARE RELEASED



-- ISOLATION LEVEL #6: READ COMMITTED SNAPSHOT ISOLATION LEVEL
-- APPLICABLE FOR SUCH APPLICATIONS WITH FREQUENT DML OPERATIONS
-- SHARED LOCKS ARE RELEASED IMMEDIATELY AFTER THE SELECT QUERY
SET TRANSACTION ISOLATION LEVEL READ_COMMITTED_SNAPSHOT

SELECT * FROM Product	-- NO BLOCKING, NO DIRTY READS. PREVIOUSLY COMITTED DATA IS READ. 
						-- LESSER TEMPDB SPACE FOR ROW VERSIONING.




