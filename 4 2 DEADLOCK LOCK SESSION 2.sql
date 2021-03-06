USE TEMPDB 
GO

CREATE TABLE tblInventory  
(
  ID INT NOT NULL PRIMARY KEY,
  TitleTag NVARCHAR(100) NOT NULL,
  Measure INT NOT NULL DEFAULT 0
)

INSERT tblInventory VALUES
  (113, 'BUSN PROFILES', 100),  (114, 'PB CHAPTER BKS', 100),
  (115, 'BEG READER HC', 100),  (116, 'Literature', 100);

SELECT * FROM tblInventory			-- 4 ROWS


SET DEADLOCK_PRIORITY HIGH	-- THIS MEANS, THE CURRENT SESSION CAN BE THE DEADLOCK WINNER INCASE OF ANY DEADLOCK.


BEGIN TRAN T2
UPDATE tblInventory SET Measure = 1000
UPDATE tblOrders SET Measure = 10000
-- START PROFILER TOOL > USE TEMPALTE "LOCKS"
-- NOW EXECUTE THE REMAINING PART OF T1




