/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF NOT EXISTS (SELECT * FROM [dbo].[UserRole])
BEGIN
	INSERT INTO [dbo].[UserRole] ([Name])
	VALUES ('User'), ('Admin');
END
GO

IF NOT EXISTS (SELECT * FROM [dbo].[ScriptsExecuted])
BEGIN
	INSERT INTO [dbo].[ScriptsExecuted] ([Name])
	VALUES ('SETTING_ROLES')
END
GO

IF (SELECT TOP 1 [ExecutedDate] FROM [dbo].[ScriptsExecuted] WHERE [Name] = 'SETTING_ROLES') IS NULL
BEGIN
	UPDATE [dbo].[User]
	SET [RoleId] = 1
	WHERE Id % 2 = 0
	
	UPDATE [dbo].[User]
	SET [RoleId] = 2
	WHERE Id % 2 <> 0

	UPDATE [dbo].[ScriptsExecuted]
	SET [ExecutedDate] = GETDATE()
	WHERE [Name] = 'SETTING_ROLES'
END