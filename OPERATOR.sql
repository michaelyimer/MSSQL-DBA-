USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'EMAIL_OPERATOR', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'contact@sqlschool.com;saiphanindrait@gmail.com;'
GO
