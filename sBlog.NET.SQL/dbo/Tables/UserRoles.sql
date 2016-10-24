CREATE TABLE [dbo].[UserRoles] (
    [UserRoleId] INT      IDENTITY (1, 1) NOT NULL,
    [UserId]     INT      NOT NULL,
    [RoleId]     SMALLINT NOT NULL,
    CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED ([UserRoleId] ASC),
    CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([RoleId])
);

