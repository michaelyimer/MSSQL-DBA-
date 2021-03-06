CREATE DATABASE TRIGGER_TEST_DB
GO

USE TRIGGER_TEST_DB 

create table Reservation1 ( Aircraft_Code varchar(10), No_of_Seats int, Class_Code varchar(10) )

create table Reservation2 ( Aircraft_Code varchar(10), No_of_Seats int, Class_Code varchar(10) )

-- REQ 1: WHENEVER WE INSERT DATA INTO Reservation1 THEN SAME DATA SHOULD BE AUTO INSERTED INTO Reservation2. 
CREATE TRIGGER trgAdd_Operation
ON Reservation1
FOR INSERT			-- IN ADDITION TO
AS
INSERT INTO Reservation2 SELECT * FROM INSERTED 

SELECT * FROM Reservation1
SELECT * FROM Reservation2

-- HOW TO TEST ABOVE TRIGGER?
INSERT INTO Reservation1 VALUES ('AI01', 11, 'ECO')
INSERT INTO Reservation1 VALUES ('AI02', 22, 'ECO')

SELECT * FROM Reservation1
SELECT * FROM Reservation2


-- REQUIREMENT: RESERVATIONS ONCE APPROVED CANNOT BE MODIFIED OR CANCELLED. MEANS, WE NEED TO MAKE TABLE READONLY?
CREATE TRIGGER TrigInplaceOfOperation 
ON Reservation1
INSTEAD OF INSERT, UPDATE, DELETE
AS
PRINT 'TABLE IS READONLY. CONTACT YOUR ADMIN.'

-- HOW TO TEST ABOVE TRIGGER?
DELETE FROM Reservation1
SELECT * FROM Reservation1

UPDATE Reservation1 SET NO_OF_SEATS = 0
SELECT * FROM Reservation1

-- HOW TO DISABLE TRIGGER ON A TABLE?
DISABLE TRIGGER TrigInplaceOfOperation ON Reservation1

DELETE FROM Reservation1
SELECT * FROM Reservation1

-- HOW TO ENABLE TRIGGER ON A TABLE?
ENABLE TRIGGER TrigInplaceOfOperation ON Reservation1



-- REQUIREMENT :  WHENEVER WE INSERT DATA INTO RESERVATION1 IT SHOULD AUTO INSERT TO RESERVATION2?
CREATE DATABASE DATABASE1
GO
USE DATABASE1 

create table Reservation1 ( Aircraft_Code varchar(10), No_of_Seats int, Class_Code varchar(10) )

-- SOLUTION:
CREATE TRIGGER trigTableReplica
ON Reservation1
FOR
INSERT
AS
INSERT INTO [SQLSCHOOL\SERVER2].DATABASE2.DBO.Reservation2 SELECT * FROM INSERTED 

-- WORKING:
INSERT INTO Reservation1 VALUES ('AI01', 11, 'ECO')
SELECT * FROM Reservation1

INSERT INTO Reservation1 VALUES ('AI02', 22, 'ECO')
SELECT * FROM Reservation1

SELECT * FROM [SQLSCHOOL\SERVER2].DATABASE2.DBO.Reservation2