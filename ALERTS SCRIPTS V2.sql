USE [msdb]
GO
EXEC msdb.dbo.sp_add_alert @name=N'ALERT_FOR_HIGH_TPS', 
		@enabled=1, 
		@delay_between_responses=600, 
		@include_event_description_in=1, 
		@notification_message=N'/* HIGH USAGE OF THE DATABASE  :  " BANKING DATABASE ". HIGH PRIORITY ALERT */', 
		@performance_condition=N'Databases|Transactions/sec|Banking_DB|>|1000', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'ALERT_FOR_HIGH_TPS', @operator_name=N'EMAIL_OPERATOR', @notification_method = 1
GO
