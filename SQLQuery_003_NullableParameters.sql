USE [DotNetCourseDatabase]
GO

/*CREATE PROCEDURE TutorialAppSchema.spUsers_Get*/
ALTER PROCEDURE TutorialAppSchema.spUsers_Get
	@UserId INT = NULL
AS
BEGIN
    SELECT 
        [Users].[UserId],
        [Users].[FirstName],
        [Users].[LastName],
        [Users].[Email],
        [Users].[Gender],
        [Users].[Active] 
    FROM TutorialAppSchema.Users AS Users
		WHERE Users.UserId = ISNULL(@UserId, UserId)
END
GO

EXEC [TutorialAppSchema].spUsers_Get
GO
