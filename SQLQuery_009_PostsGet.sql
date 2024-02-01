USE DotNetCourseDatabase
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spPosts_Get
	@PostId INT = NULL, @UserId INT = NULL, @SearchValue NVARCHAR(MAX) = NULL
AS
    BEGIN
    SELECT
        [Posts].[PostId],
        [Posts].[UserId],
        [Posts].[PostTitle],
        [Posts].[PostContent],
        [Posts].[PostCreated],
        [Posts].[PostUpdated]
    FROM TutorialAppSchema.Posts AS Posts
    WHERE
        UserId = ISNULL(@UserId, UserId)
        AND Posts.PostId = ISNULL(@PostId, PostId)
        AND (@SearchValue IS NULL OR Posts.PostContent LIKE '%' + @SearchValue + '%' OR Posts.PostTitle LIKE '%' + @SearchValue + '%')
    END
GO

EXEC [TutorialAppSchema].spPosts_Get
GO