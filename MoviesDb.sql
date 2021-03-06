USE [master]
GO
/****** Object:  Database [MoviesDb]    Script Date: 24-03-2020 8.22.39 PM ******/
CREATE DATABASE [MoviesDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoviesDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MoviesDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MoviesDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MoviesDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MoviesDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoviesDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoviesDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoviesDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoviesDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoviesDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoviesDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoviesDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MoviesDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoviesDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoviesDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoviesDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoviesDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoviesDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoviesDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoviesDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoviesDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MoviesDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoviesDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoviesDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoviesDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoviesDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoviesDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MoviesDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoviesDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MoviesDb] SET  MULTI_USER 
GO
ALTER DATABASE [MoviesDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoviesDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoviesDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoviesDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MoviesDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MoviesDb] SET QUERY_STORE = OFF
GO
USE [MoviesDb]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 24-03-2020 8.22.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [varchar](50) NOT NULL,
	[MovieType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 24-03-2020 8.22.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorId] [int] IDENTITY(1,1) NOT NULL,
	[ActorName] [varchar](50) NOT NULL,
	[Citizenship] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActorMovies]    Script Date: 24-03-2020 8.22.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorMovies](
	[ActorMovieId] [int] IDENTITY(1,1) NOT NULL,
	[ActorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
 CONSTRAINT [PK_ActorMovies] PRIMARY KEY CLUSTERED 
(
	[ActorMovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vActorMovies]    Script Date: 24-03-2020 8.22.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vActorMovies]
AS
SELECT dbo.ActorMovies.ActorMovieId, dbo.ActorMovies.ActorId, dbo.ActorMovies.MovieId, dbo.Actors.ActorName, dbo.Movies.MovieName, dbo.Actors.Citizenship
FROM     dbo.ActorMovies INNER JOIN
                  dbo.Actors ON dbo.ActorMovies.ActorId = dbo.Actors.ActorId INNER JOIN
                  dbo.Movies ON dbo.ActorMovies.MovieId = dbo.Movies.MovieId
GO
ALTER TABLE [dbo].[ActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovies_Actors] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([ActorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovies] CHECK CONSTRAINT [FK_ActorMovies_Actors]
GO
ALTER TABLE [dbo].[ActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovies_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovies] CHECK CONSTRAINT [FK_ActorMovies_Movies]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ActorMovies"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Actors"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Movies"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 148
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vActorMovies'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vActorMovies'
GO
USE [master]
GO
ALTER DATABASE [MoviesDb] SET  READ_WRITE 
GO
