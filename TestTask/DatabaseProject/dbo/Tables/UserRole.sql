﻿CREATE TABLE [dbo].[UserRole]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR(50) NOT NULL
	CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([Id] ASC), 
)