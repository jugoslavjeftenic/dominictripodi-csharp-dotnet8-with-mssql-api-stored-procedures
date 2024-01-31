USE DotNetCourseDatabase
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spUser_Upsert
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Email NVARCHAR(50),
	@Gender NVARCHAR(50),
	@Active BIT = 1,
	@UserId INT = NULL
AS
    BEGIN
    IF EXISTS (SELECT * FROM TutorialAppSchema.Users WHERE UserId = @UserId)
        IF EXISTS (SELECT * FROM TutorialAppSchema.Users WHERE Email = @Email)
            BEGIN
            UPDATE TutorialAppSchema.Users SET
                [FirstName] = @FirstName,
                [LastName] = @LastName,
                [Email] = @Email,
                [Gender] = @Gender,
                [Active] = @Active
            WHERE UserId = @UserId
            END
    ELSE
        BEGIN
        INSERT INTO TutorialAppSchema.Users(
            [FirstName],
            [LastName],
            [Email],
            [Gender],
            [Active]
        ) VALUES (
            @FirstName,
            @LastName,
            @Email,
            @Gender,
            @Active
        )
        END
    END
GO
