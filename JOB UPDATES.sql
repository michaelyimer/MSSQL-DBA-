USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_id=N'849b7c3d-259d-406d-8523-2ed0f1a3413d', 
		@notify_level_email=3, 
		@notify_level_page=2, 
		@notify_email_operator_name=N'EMAIL_OPERATOR'
GO
