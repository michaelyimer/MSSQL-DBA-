USE [master]
GO
EXEC master.dbo.sp_addlinkedserver @server = N'SQLSCHOOL\SERVER2', @srvproduct=N'SQL Server'


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'SQLSCHOOL\SERVER2', @locallogin = NULL , @useself = N'True'
GO
