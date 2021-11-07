-- EVERY OPERATION YOU PERFORM ON DATABASE RESULTS IN ONE OR MORE "LOCKS"
-- LOCKS ARE MEMORY RESOURCE APPLIED ON DATABASE OBJECTS (TABLES, VIEWS,..) & DATABASE STRUCTURES (FILES, PAGES..)

-- THESE LOCKS ARE USED TO CONTROL THE CONCURRENT (PARALLEL) ACCESS TO DATABASE.
-- "LOCK MANAGER" @ ARCHITECTURE MANAGES ALL THESE LOCKS. 

/*
TYPES OF LOCKS:
		SHARED LOCK					S			APPLICABLE FOR READ or FETCH OPERATIONS

		EXCLUSIVE LOCK				X			APPLICABLE FOR WRITE or DML OPERATIONS

		SCHEMA STABILITY LOCK		SCH-S		APPLICABLE FOR METADATA READS (EX: SP_HELP, SYS.TABLES..)

		SCHEMA MODIFY LOCK			SCH-M		APPLICABLE FOR METADATA WRITES ( EX: CREATE, ALTER, DROP)

		UPDATE LOCK					U			APPLICABLE FOR DATA UPDATES USING TABLES & VIEWS

		INTENT LOCK					I			APPLICABLE FOR S & X LOCKS
												TO PREVENT LOWER LEVEL RESOURCES (PAG) FROM BEING LOCKED BY 
												HIGHER LEVEL RESOURCES (TABLE)

		METADATA LOCKS				MD			APPLICABLE FOR OPERATIONS ON THE MASTER PAGES (FROM MASTER EXTENT)
*/

USE TRANTEST
GO

-- HOW TO MONITOR LOCKS?
EXEC SP_LOCK 

-- HOW TO MONITOR QUERY BLOCKING?
SELECT * FROM SYSPROCESSES WHERE BLOCKED <> 0  OR BLOCKED = SPID 
EXEC SP_LOCK			-- ANY LOCK WAIT RESULTS IN BLOCKING
EXEC SP_WHO2 

-- GIVEN A SESSION ID, HOW TO KNOW THE TYPE OF QUERIES / OPERATIONS SUBMITTED AS INPUT FROM THAT SESSION?
DBCC INPUTBUFFER(54)

/*
BEGIN TRANSACTION T1  INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (43, N'0101043', N'Contoso 16GB New Generation MP5 Player M1650 Black', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'1', N'Product0101043', N'2', N'Black', N'2.2 x 0.6 x 1.4', N' ', N' ', 14.1, N'ounces', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-06 08:01:12.000' AS DateTime), CAST(N'2008-07-06 08:01:12.000' AS DateTime))  INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (44, N'0101044', N'Contoso 16GB New Generation MP5 Player M1650 blue', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'1', N'Product0101044', N'3', N'blue', N'2.2 x 1.8 x 4', N' ', N' ', 1, N'pounds', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-07 08:01:12.000' AS DateTime), CAST(N'2008-07-07 08:01:12.000' AS DateTime))  INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (45, N'0101045', N'Contoso 16GB New Generation MP5 Player M1650 Pink', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'4', N'Product0101045', N'10', N'Pink', N'4.1 x 2.4 x 0.4', N' ', N' ', 5, N'ounces', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-08 08:01:12.000' AS DateTime), CAST(N'2008-07-08 08:01:12.000' AS DateTime))  INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (46, N'0104001', N'WWI 1GB Pulse Smart pen E50 White', N'Record and link audio to be written, listen to recordings, share notes and recording with computer', 4, N'Wide World Importers', N'Wide World Importers', N'1', N'Economy', N'1', N'Product0104001', N'8', N'White', N'6 x 0.5 x 0.5', N' ', N' ', 1.3, N'ounces', N'1
*/

-- HOW TO KNOW THE NUMBER OF OPEN TRANSACTIONS IN THE CURRENT SESSION?
SELECT @@TRANCOUNT 

-- HOW TO KNOW THE THE DETAILS OF OPEN TRANSACTIONS IN THE CURRENT DATABASE?
DBCC OPENTRAN()

/*
QUERY BLOCKING CAN BE AVOIDED BY IMPLEMENTING ONE OF THE BELOW MECHANISMS:
		1. LOCK HINTS
		2. ISOLATION LEVELS
*/


USE MASTER 


