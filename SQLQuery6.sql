-- QUERY 1: HOW TO CREATE NEW DATABASE?
CREATE  DATABASE  RetailDatabase


-- QUERY 2: HOW TO CONNECT TO ABOVE DATABASE?
USE RetailDatabase


-- QUERY 3: HOW TO CREATE TABLE FOR DATA STORAGE?
CREATE TABLE tblProducts
(
ProductID		INTEGER,	 	-- this column stores DIGITS : 0, -10, 99, etc..	
ProductName		CHARACTER(40),	-- this column stores up to 40 CHARACTERS
Price			INT,			-- this column stores DIGITS : 0, -10, 99, etc..	
Size			Char(10)		-- this column stores up to 10 CHARACTERS
)


-- QUERY 4: HOW TO STORE DATA INTO ABOVE TABLE?
INSERT INTO  tblProducts VALUES (1001, 'CAPS', 10, 'S')


-- QUERY 5: HOW TO INSERT MULTIPLE ROWS IN ABOVE TABLE?
INSERT  tblProducts VALUES (1002, 'BALLS', 11, 'S'),  (1003, 'BALLS', 12, 'M');


-- QUERY 6: HOW TO REPORT ABOVE INSERTED TABLE DATA?
SELECT * FROM  tblProducts

-- TABLE SCAN :  ORDER OF INSERTION  = ORDER OF STORAGE  = ORDER OF RETREIVAL
-- To verify Table Scan: Right Click Query > Include LIVE Query Statistics. Right Click Query > Execute


/*
multi 
line
comment */

