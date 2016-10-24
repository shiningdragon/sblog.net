CREATE TABLE [dbo].[Users] (
    [UserID]           INT           IDENTITY (1, 1) NOT NULL,
    [UserName]         VARCHAR (50)  NOT NULL,
    [Password]         VARCHAR (50)  NOT NULL,
    [UserEmailAddress] VARCHAR (50)  NOT NULL,
    [UserDisplayName]  VARCHAR (50)  NULL,
    [UserActiveStatus] INT           NULL,
    [ActivationKey]    VARCHAR (50)  NULL,
    [OneTimeToken]     VARCHAR (50)  NULL,
    [UserCode]         VARCHAR (128) NULL,
    [UserSite]         VARCHAR (128) NULL,
    [LastLoginDate]    DATETIME      NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC)
);

