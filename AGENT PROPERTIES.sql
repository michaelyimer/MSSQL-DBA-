USE [msdb]
GO
EXEC msdb.dbo.sp_set_sqlagent_properties @email_save_in_sent_folder=1, 
		@databasemail_profile=N'DATABASE_MAIL_PROFILE', 
		@use_databasemail=1
GO
