CREATE TABLE [dbo].[TagMapping] (
    [PostTagMappingID] INT IDENTITY (1, 1) NOT NULL,
    [TagID]            INT NOT NULL,
    [PostID]           INT NOT NULL,
    CONSTRAINT [PK_PostTagMapping] PRIMARY KEY CLUSTERED ([PostTagMappingID] ASC),
    CONSTRAINT [FK_PostTagMapping_Posts] FOREIGN KEY ([PostID]) REFERENCES [dbo].[Posts] ([PostID]),
    CONSTRAINT [FK_PostTagMapping_Tags] FOREIGN KEY ([TagID]) REFERENCES [dbo].[Tags] ([TagID])
);

