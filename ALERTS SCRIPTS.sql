USE [msdb]
GO
EXEC msdb.dbo.sp_add_alert @name=N'SERVER_MEM_ALERT', 
		@enabled=1, 
		@delay_between_responses=600, 
		@include_event_description_in=1, 
		@notification_message=N'/* CRITICAL ALERT : HIGH MEMORY USAGE */', 
		@performance_condition=N'Memory Manager|Total Server Memory (KB)||>|12000000', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SERVER_MEM_ALERT', @operator_name=N'EMAIL_OPERATOR', @notification_method = 1
GO

