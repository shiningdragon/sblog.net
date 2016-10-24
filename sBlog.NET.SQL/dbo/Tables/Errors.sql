CREATE TABLE [dbo].[Errors] (
    [ErrorID]          INT           IDENTITY (1, 1) NOT NULL,
    [ErrorDateTime]    DATETIME      NOT NULL,
    [ErrorMessage]     VARCHAR (500) NOT NULL,
    [ErrorDescription] VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Errors] PRIMARY KEY CLUSTERED ([ErrorID] ASC)
);

