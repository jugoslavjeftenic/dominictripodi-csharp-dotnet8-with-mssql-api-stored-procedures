USE DotNetCourseDatabase
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spPosts_Upsert
	@UserId INT,
	@PostTitle NVARCHAR(255),
	@PostContent NVARCHAR(255),
	@PostId INT = NULL
AS
    BEGIN
    IF EXISTS (SELECT * FROM TutorialAppSchema.Posts WHERE PostId = @PostId)
        BEGIN
        UPDATE TutorialAppSchema.Posts SET
            [PostTitle] = @PostTitle,
            [PostContent] = @PostContent,
            [PostUpdated] = GETDATE()
        WHERE PostId = @PostId
        END
    ELSE
        BEGIN
        INSERT INTO TutorialAppSchema.Posts(
            [UserId],
            [PostTitle],
            [PostContent],
            [PostCreated],
            [PostUpdated]
        ) VALUES (
            @UserId,
            @PostTitle,
            @PostContent,
            GETDATE(),
            GETDATE()
        )
        END
    END
GO

-- EXEC [TutorialAppSchema].spPosts_Upsert
GO