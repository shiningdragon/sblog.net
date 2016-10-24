/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


/* Insert the entries in to the table */
IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'InstallationComplete')
BEGIN
	INSERT INTO sBlog_Settings VALUES('InstallationComplete', 'false');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogName')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogName','sBlog.Net');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogCaption')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogCaption','Just another sBlog.net blog!');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogTheme')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogTheme',NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogPostsPerPage')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogPostsPerPage','5');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'ManageItemsPerPage')
BEGIN
	INSERT INTO sBlog_Settings VALUES('ManageItemsPerPage', '5');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSocialSharing')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSocialSharing','false');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSocialSharingChoice')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSocialSharingChoice', NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSyntaxHighlighting')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSyntaxHighlighting','false');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSyntaxTheme')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSyntaxTheme',NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSyntaxScripts')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSyntaxScripts',NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSiteErrorEmailAction')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSiteErrorEmailAction','false');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogAkismetEnabled')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogAkismetEnabled','false');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogAkismetKey')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogAkismetKey',NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogAkismetUrl')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogAkismetUrl',NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogAkismetDeleteSpam')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogAkismetDeleteSpam','false');
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogAdminEmailAddress')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogAdminEmailAddress',NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSmtpAddress')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSmtpAddress',NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogSmtpPassword')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogSmtpPassword', NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'DisqusEnabled')
BEGIN
	INSERT INTO sBlog_Settings VALUES('DisqusEnabled', NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogDisqusShortName')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogDisqusShortName', NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'BlogDbVersion')
BEGIN
	INSERT INTO sBlog_Settings VALUES('BlogDbVersion', NULL);
END

IF NOT EXISTS (SELECT * FROM sBlog_Settings WHERE KeyName = 'EditorType')
BEGIN
	INSERT INTO sBlog_Settings VALUES('EditorType', 'html');
END


/* Roles table entries */
IF NOT EXISTS (SELECT * FROM dbo.Roles WHERE RoleId = 0)
BEGIN
INSERT INTO dbo.Roles VALUES(0,'SuperAdmin','Super Admin');
END

IF NOT EXISTS (SELECT * FROM dbo.Roles WHERE RoleId = 1)
BEGIN
INSERT INTO dbo.Roles VALUES(1, 'Admin', 'Administrator');
END

IF NOT EXISTS (SELECT * FROM dbo.Roles WHERE RoleId = 2)
BEGIN
INSERT INTO dbo.Roles VALUES(2, 'Author', 'Blog Author');
END
GO

/* Insert the default user with the default password */
IF NOT EXISTS (SELECT * FROM Users WHERE [UserName] = 'admin')
BEGIN
INSERT INTO Users ([UserName],[Password],[UserEmailAddress],[UserDisplayName],[UserActiveStatus],
					[ActivationKey],[OneTimeToken],[UserCode],[UserSite],[LastLoginDate])
VALUES ('admin','','','admin',1,NULL,NULL,'',NULL,NULL);
END

/* Entry for 1 user */
IF NOT EXISTS (SELECT * FROM dbo.UserRoles WHERE UserRoleId = 1)
BEGIN
INSERT INTO dbo.UserRoles VALUES(1, 0);
END

/* Update the db version - to be used in the future by the soon to be written app! */
UPDATE sBlog_Settings SET KeyValue = '02_02' WHERE KeyName = 'BlogDbVersion';
GO

--INSERT INTO [dbo].[Posts]
--		([PostTitle],[PostContent],[PostUrl],[PostAddedDate],[PostEditedDate],[OwnerUserID],
--		[UserCanAddComments],[CanBeShared],[IsPrivate],[EntryType],[Order])
--	VALUES
--		('Hello World!',
--		'Hello World!<br /><br />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non sollicitudin dui. Nunc ac augue tellus, sit amet rutrum nunc. Integer malesuada sapien tincidunt ligula vulputate blandit eu eget tellus. Praesent rhoncus neque eget augue blandit viverra. Praesent mattis gravida egestas. Integer dictum, sapien sit amet pharetra tempus, elit elit porta sem, sed fermentum tortor diam quis nulla. Sed felis sem, ultrices quis sagittis vitae, convallis at dui. Curabitur rutrum, nulla vitae semper interdum, justo velit blandit augue, ac porta lorem lorem a est. Curabitur quis metus in magna scelerisque viverra. Proin id leo eros, ullamcorper pellentesque mauris. Donec metus leo, varius at faucibus id, interdum a ipsum. Donec adipiscing tortor ac nulla convallis scelerisque. Ut posuere aliquam dolor eu viverra. Maecenas ut arcu eu lacus iaculis euismod dictum pulvinar turpis. Nulla vel sem eget lacus tristique lacinia eu id diam.<br /><br />',
--		'hello-world',GETDATE(),GETDATE(),1,'true','true','false',1,NULL)

--/* Insert the default page */
--INSERT INTO [dbo].[Posts]
--			([PostTitle],[PostContent],[PostUrl],[PostAddedDate],[PostEditedDate],[OwnerUserID],
--			[UserCanAddComments],[CanBeShared],[IsPrivate],[EntryType],[Order])
--VALUES
--	('About',
--	'This is just a basic &quot;About&quot; page!<br /><br />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non sollicitudin dui. Nunc ac augue tellus, sit amet rutrum nunc. Integer malesuada sapien tincidunt ligula vulputate blandit eu eget tellus. Praesent rhoncus neque eget augue blandit viverra. Praesent mattis gravida egestas. Integer dictum, sapien sit amet pharetra tempus, elit elit porta sem, sed fermentum tortor diam quis nulla. Sed felis sem, ultrices quis sagittis vitae, convallis at dui. Curabitur rutrum, nulla vitae semper interdum, justo velit blandit augue, ac porta lorem lorem a est. Curabitur quis metus in magna scelerisque viverra. Proin id leo eros, ullamcorper pellentesque mauris. Donec metus leo, varius at faucibus id, interdum a ipsum. Donec adipiscing tortor ac nulla convallis scelerisque. Ut posuere aliquam dolor eu viverra. Maecenas ut arcu eu lacus iaculis euismod dictum pulvinar turpis. Nulla vel sem eget lacus tristique lacinia eu id diam.<br /><br />',
--	'about',GETDATE(),GETDATE(),1,'true','true','false',2,1)

			   
--/* Insert a default comment for the defaul page & post */
--INSERT INTO [dbo].[Comments]
--			([CommentUserFullName],[CommenterEmail],[CommenterSite]
--			,[CommentContent],[CommentPostedDate],[CommentStatus],[PostID],[UserID])
--		VALUES('admin','','','Welcome to the blogosphere!',
--			GETDATE(),0,1,NULL);
--INSERT INTO [dbo].[Comments]
--			([CommentUserFullName],[CommenterEmail],[CommenterSite]
--			,[CommentContent],[CommentPostedDate],[CommentStatus],[PostID],[UserID])
--		VALUES('admin','','','About Me!',
--			GETDATE(),0,2,NULL);

--/* Insert default category */
--INSERT INTO Categories (CategoryName, CategorySlug) VALUES ('General','general');

--/* Insert a default tag */
--INSERT INTO [dbo].[Tags] (TagName, TagSlug) VALUES('general','general');

--INSERT INTO [dbo].[CategoryMapping]([CategoryID],[PostID]) VALUES (1,1)

--/* Add default tag mapping */
--INSERT INTO [dbo].[TagMapping] VALUES(1,1);




