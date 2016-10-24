CREATE TABLE [dbo].[Comments] (
    [CommentID]           INT           IDENTITY (1, 1) NOT NULL,
    [CommentUserFullName] VARCHAR (50)  NOT NULL,
    [CommenterEmail]      VARCHAR (50)  NULL,
    [CommenterSite]       VARCHAR (50)  NULL,
    [CommentContent]      VARCHAR (512) NOT NULL,
    [CommentPostedDate]   DATETIME      NOT NULL,
    [CommentStatus]       INT           NOT NULL,
    [PostID]              INT           NOT NULL,
    [UserID]              INT           NULL,
    CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED ([CommentID] ASC),
    CONSTRAINT [FK_Comments_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
);

