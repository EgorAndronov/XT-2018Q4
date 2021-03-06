USE [master]
GO
/****** Object:  Database [UsersAndAwards]    Script Date: 05.03.2019 17:42:05 ******/
CREATE DATABASE [UsersAndAwards]
 CONTAINMENT = NONE
ALTER DATABASE [UsersAndAwards] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UsersAndAwards].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UsersAndAwards] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UsersAndAwards] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UsersAndAwards] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UsersAndAwards] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UsersAndAwards] SET ARITHABORT OFF 
GO
ALTER DATABASE [UsersAndAwards] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UsersAndAwards] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UsersAndAwards] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UsersAndAwards] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UsersAndAwards] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UsersAndAwards] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UsersAndAwards] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UsersAndAwards] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UsersAndAwards] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UsersAndAwards] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UsersAndAwards] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UsersAndAwards] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UsersAndAwards] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UsersAndAwards] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UsersAndAwards] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UsersAndAwards] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UsersAndAwards] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UsersAndAwards] SET RECOVERY FULL 
GO
ALTER DATABASE [UsersAndAwards] SET  MULTI_USER 
GO
ALTER DATABASE [UsersAndAwards] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UsersAndAwards] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UsersAndAwards] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UsersAndAwards] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UsersAndAwards] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UsersAndAwards', N'ON'
GO
ALTER DATABASE [UsersAndAwards] SET QUERY_STORE = OFF
GO
USE [UsersAndAwards]
GO
/****** Object:  Table [dbo].[Awards]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Awards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Awards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisteredUsers]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredUsers](
	[LogIn] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RegisteredUsers] PRIMARY KEY CLUSTERED 
(
	[LogIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPhotos]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPhotos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[screen] [nvarchar](max) NOT NULL,
	[screen_format] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserPhotos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DateOfBirthday] [date] NOT NULL,
	[IdPhoto] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersAwards]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersAwards](
	[IdUsers] [int] NOT NULL,
	[IdAwards] [int] NOT NULL,
 CONSTRAINT [PK_UsersAwards] PRIMARY KEY CLUSTERED 
(
	[IdUsers] ASC,
	[IdAwards] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersAwards]  WITH CHECK ADD  CONSTRAINT [FK_UsersAwards_Awards] FOREIGN KEY([IdAwards])
REFERENCES [dbo].[Awards] ([Id])
GO
ALTER TABLE [dbo].[UsersAwards] CHECK CONSTRAINT [FK_UsersAwards_Awards]
GO
ALTER TABLE [dbo].[UsersAwards]  WITH CHECK ADD  CONSTRAINT [FK_UsersAwards_Users] FOREIGN KEY([IdUsers])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersAwards] CHECK CONSTRAINT [FK_UsersAwards_Users]
GO
/****** Object:  StoredProcedure [dbo].[AddAward]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAward]
	@Title NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;
	INSERT INTO Awards(title)
	VALUES (@Title)

END
GO
/****** Object:  StoredProcedure [dbo].[AddAwardForUser]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAwardForUser]

	@IdUser int,
	@IdAward int

AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT INTO UsersAwards (IdUsers,IdAwards)
	VALUES (@IdUser, @IdAward)
END
GO
/****** Object:  StoredProcedure [dbo].[AddRegisteredUser]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddRegisteredUser]
	@LogIn nvarchar(50),
	@Password nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO RegisteredUsers (LogIn, Password)
	VALUES (@LogIn, @Password)

END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUser]
	@Name NVARCHAR(50),
	@DateOfBirthday DATE	

AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Users( Name, DateOfBirthday)
	VALUES (@Name, @DateOfBirthday)

END
GO
/****** Object:  StoredProcedure [dbo].[AddUserPhoto]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUserPhoto]
	@IdUser int,
	@screen nvarchar(MAX),
	@screen_format nvarchar(10)
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT INTO UserPhotos (screen, screen_format)
	VALUES (@screen, @screen_format)

	UPDATE Users
	SET	IdPhoto = (SELECT Id FROM UserPhotos WHERE screen = @screen)
	WHERE Id = @IdUser

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAllUsers]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteAllUsers]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	--DELETE FROM Users
  
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAward]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteAward]
	@Id int
AS
BEGIN

	SET NOCOUNT ON;

	DELETE FROM UsersAwards
	WHERE IdAwards = @Id

	DELETE FROM Awards
	WHERE Id=@Id

	

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUser]
	@Id int
AS
BEGIN

	SET NOCOUNT ON;

	DELETE FROM UsersAwards
	WHERE IdUsers = @Id

	DELETE FROM Users
	Where Id=@Id

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAwards]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllAwards] 

AS
BEGIN

	SET NOCOUNT ON;

	SELECT A.Id, 
		   A.Title 
		FROM Awards A
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllUsers]
	
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT U.Id, 
		   U.Name, 
		   U.DateOfBirthday 
		FROM Users U
END
GO
/****** Object:  StoredProcedure [dbo].[GetAward]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAward]
	@Id int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT A.Id, A.Title FROM Awards A
	WHERE A.Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[GetPasswordUser]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPasswordUser]
	@LogIn nvarchar(50)

AS
BEGIN

	SET NOCOUNT ON;

	SELECT RU.Password FROM RegisteredUsers RU
	WHERE RU.LogIn = @LogIn
END
GO
/****** Object:  StoredProcedure [dbo].[GetPhoto]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhoto]
	@IdUser int

AS
BEGIN
	SET NOCOUNT ON;

	SELECT screen, screen_format FROM UserPhotos WHERE Id = (SELECT IdPhoto FROM Users WHERE Id = @IdUser AND IdPhoto IS NOT NULL)

END
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUser]
	@Id int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT U.Id, U.Name, U.DateOfBirthday FROM Users U
	WHERE U.Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersAwards]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUsersAwards]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT UA.IdUsers, 
		   UA.IdAwards
		FROM UsersAwards UA

END
GO
/****** Object:  StoredProcedure [dbo].[UsersUpdate]    Script Date: 05.03.2019 17:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersUpdate]
	@Id int,
	@Name nvarchar(50),
	@DateOfBirthday date

AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE Users
	SET Name = @Name,
		DateOfBirthday = @DateOfBirthday
	WHERE Id = @Id 

END
GO
USE [master]
GO
ALTER DATABASE [UsersAndAwards] SET  READ_WRITE 
GO
