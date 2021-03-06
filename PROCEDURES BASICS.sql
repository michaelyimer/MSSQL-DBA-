-- EXAMPLE 3:  USER DEFINED PROCEDURES (STORED PROCEDURES)
CREATE PROCEDURE SP_REPORT_EMPLOYEES (@Country varchar(30))
AS
SELECT * FROM EMPLOYEE_INFO WHERE EMP_CNTRY = @Country

-- UNLIKE FUNCTIONS, THE STORED PROCEDURES [SPs or SPROCs] ARE PRECOMPILED, PRE-OPTIMIZED.
-- MEANS, THE QUERY SPECIFIED IN THE PROCEDURE DEFINITION IS COMPILED AND STORED IN THE DATABASE. 
-- ALSO, THE EXECUTION PLAN IS GENEERATED AND STORED BY QUERY OPTIMIZER IN "PROCEDURE CAHCE"

-- TO ACCESS ABOVE STORED PROCEDURE
EXEC SP_REPORT_EMPLOYEES 'INDIA'

-- IMPORTANT SYSTEM PROCEDURES : FOR METADATA [SYSTEM INFORMATION] AUDITS
EXEC SP_HELPDB				-- TO REPORT LIST OF ALL DATABASES IN THE SERVER
EXEC SP_HELP				-- TO REPORT LIST OF ALL OBJECTS IN THE DATABASE
EXEC SP_HELP'EMPLOYEE_INFO'  		-- TO REPORT DEFINITION OF THE GIVEN OBJECT [TABLE]
EXEC SP_HELPINDEX 'EMPLOYEE_INFO'	-- TO REPORT ALL INDEXES OF THE GIVEN TABLE
EXEC SP_PKEYS	'EMPLOYEE_INFO'	-- TO REPORT PRIMARY KEY INFORMATION OF THE GIVEN TABLE
EXEC SP_DEPENDS 'EMPLOYEE_INFO'	-- TO REPORT ALL DEPENDANCIES ON THE GIVEN TABLE
EXEC SP_RENAME 'EMPLOYEE_INFO', 'NEW_TABLE_NAME'  	-- RENAME A TABLE OR DB OBJECT
EXEC SP_RECOMPILE	'SP_REPORT_EMPLOYEES'    	-- RECOMPILE THE QUERY 
EXEC SP_HELPTEXT	'SP_REPORT_EMPLOYEES'    		-- REPORT DEFINITION OF PROCEDURE 
EXEC SP_HELPTEXT	'VW_INDIA_EMPLOYEES'    		-- REPORT DEFINITION OF VIEW
EXEC SP_HELPTEXT	'FN_REPORT_EMPLOYEES'    		-- REPORT DEFINITION OF FUNCTION
 

