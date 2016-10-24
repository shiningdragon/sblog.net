CREATE TABLE [dbo].[Schema] (
    [SchemaRecordId]    INT          IDENTITY (1, 1) NOT NULL,
    [ScriptName]        VARCHAR (50) NOT NULL,
    [MajorVersion]      SMALLINT     NOT NULL,
    [MinorVersion]      SMALLINT     NOT NULL,
    [ScriptVersion]     SMALLINT     NOT NULL,
    [ScriptRunDateTime] DATETIME     NOT NULL,
    CONSTRAINT [PK_Schema] PRIMARY KEY CLUSTERED ([SchemaRecordId] ASC)
);

