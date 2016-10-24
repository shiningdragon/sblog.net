CREATE TABLE [dbo].[Posts] (
    [PostID]             INT           IDENTITY (1, 1) NOT NULL,
    [PostTitle]          VARCHAR (255) NOT NULL,
    [PostContent]        VARCHAR (MAX) NOT NULL,
    [PostUrl]            VARCHAR (MAX) NOT NULL,
    [PostAddedDate]      DATETIME      NOT NULL,
    [PostEditedDate]     DATETIME      NULL,
    [OwnerUserID]        INT           NOT NULL,
    [UserCanAddComments] BIT           NOT NULL,
    [CanBeShared]        BIT           NOT NULL,
    [IsPrivate]          BIT           NOT NULL,
    [EntryType]          TINYINT       NOT NULL,
    [Order]              INT           NULL,
    [BitlyUrl]           VARCHAR (MAX) NULL,
    [BitlySourceUrl]     VARCHAR (MAX) NULL,
    CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED ([PostID] ASC)
);

