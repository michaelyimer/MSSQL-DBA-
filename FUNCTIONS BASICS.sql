-- EXAMPLE 2:  USER DEFINED FUNCTIONS 
CREATE FUNCTION FN_REPORT_EMPLOYEES (@Country varchar(30))
RETURNS table
AS
RETURN ( SELECT * FROM EMPLOYEE_INFO WHERE EMP_CNTRY = @Country)

-- TO ACCESS ABOVE FUNCTION
SELECT * FROM FN_REPORT_EMPLOYEES('INDIA') 


-- IMPORTANT SYSTEM FUNCTIONS : FOR METADATA [SYSTEM INFORMATION] AUDITS
SELECT DB_NAME()			-- REPORTS CURRENTLY CONNECTED DATABASE NAME
SELECT DB_ID()				-- REPORTS CURRENTLY CONNECTED DATABASE ID
SELECT DB_NAME(6)			-- REPORTS DATABASE NAME FOR A GIVEN DATABASE ID
SELECT DB_ID('AUDIT_DATABASE') 	-- REPORTS DATABASE ID FOR A GIVEN DATABASE NAME
SELECT OBJECT_ID('EMP_INFO') 	-- REPORTS OBJECT ID FOR A GIVEN OBJECT NAME
SELECT OBJECT_NAME(581577110) 	-- REPORTS OBJECT NAME FOR A GIVEN OBJECT ID
SELECT GETDATE()			-- REPORTS TODAY'S DATE & TIME
SELECT @@SERVERNAME		-- REPORTS THE CURRENTLY CONNECTED SERVER NAME
SELECT @@VERSION			-- REPORTS VERSION, EDITION OF THE CONNECTED SQL SERVER