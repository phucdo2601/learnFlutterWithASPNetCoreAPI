IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220406143324_DbInit')
BEGIN
    CREATE TABLE [student] (
        [Id] int NOT NULL IDENTITY,
        [firstName] nvarchar(150) NULL,
        [lastName] nvarchar(150) NULL,
        [gender] int NOT NULL,
        CONSTRAINT [PK_student] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220406143324_DbInit')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220406143324_DbInit', N'5.0.15');
END;
GO

COMMIT;
GO

