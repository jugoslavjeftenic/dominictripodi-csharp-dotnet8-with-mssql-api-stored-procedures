USE DotNetCourseDatabase
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spRegistration_Upsert
	@Email NVARCHAR(50),
	@PasswordHash VARBINARY(MAX),
	@PasswordSalt VARBINARY(MAX)
AS
    BEGIN
    IF EXISTS (SELECT * FROM TutorialAppSchema.Auth WHERE Email = @Email)
        BEGIN
        UPDATE TutorialAppSchema.Auth SET
            [PasswordHash] = @PasswordHash,
            [PasswordSalt] = @PasswordSalt
        WHERE Email = @Email
        END
    ELSE
        BEGIN
        INSERT INTO TutorialAppSchema.Auth(
            [Email],
            [PasswordHash],
            [PasswordSalt]
        ) VALUES (
            @Email,
            @PasswordHash,
            @PasswordSalt
        )
        END
    END
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spLoginConfirmation_Get
	@Email NVARCHAR(50)
AS
    BEGIN
    SELECT
        [Auth].[PasswordHash],
        [Auth].[PasswordSalt]
    FROM TutorialAppSchema.Auth AS Auth
    WHERE Email = @Email
    END
