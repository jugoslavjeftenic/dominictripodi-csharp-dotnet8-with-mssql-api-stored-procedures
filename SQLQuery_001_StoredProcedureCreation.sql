  USE [DotNetCourseDatabase]
  GO

  /*CREATE PROCEDURE TutorialAppSchema.spUsers_Get*/
  ALTER PROCEDURE TutorialAppSchema.spUsers_Get
  /*EXEC [TutorialAppSchema].spUsers_Get*/
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
  END

  EXEC [TutorialAppSchema].spUsers_Get