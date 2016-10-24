CREATE TABLE [dbo].[Roles] (
    [RoleId]          SMALLINT      NOT NULL,
    [RoleName]        VARCHAR (50)  NOT NULL,
    [RoleDescription] VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([RoleId] ASC)
);

