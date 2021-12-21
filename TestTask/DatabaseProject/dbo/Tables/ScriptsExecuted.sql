CREATE TABLE [dbo].[ScriptsExecuted]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR(50) NOT NULL, 
    [ExecutedDate] DATETIME2 NULL
    CONSTRAINT [PK_ExecutedScript] PRIMARY KEY CLUSTERED ([Id] ASC), 
)
