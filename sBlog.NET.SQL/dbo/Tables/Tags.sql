CREATE TABLE [dbo].[Tags] (
    [TagID]   INT           IDENTITY (1, 1) NOT NULL,
    [TagName] VARCHAR (50)  NOT NULL,
    [TagSlug] VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED ([TagID] ASC)
);

