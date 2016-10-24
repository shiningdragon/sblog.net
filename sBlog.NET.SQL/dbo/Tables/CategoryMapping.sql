CREATE TABLE [dbo].[CategoryMapping] (
    [PostCategoryMappingID] INT IDENTITY (1, 1) NOT NULL,
    [CategoryID]            INT NOT NULL,
    [PostID]                INT NOT NULL,
    CONSTRAINT [PK_PostCategoryMapping] PRIMARY KEY CLUSTERED ([PostCategoryMappingID] ASC),
    CONSTRAINT [FK_PostCategoryMapping_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID]),
    CONSTRAINT [FK_PostCategoryMapping_Posts] FOREIGN KEY ([PostID]) REFERENCES [dbo].[Posts] ([PostID])
);

