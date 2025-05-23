USE [master]
GO
/****** Object:  Database [Dataled]    Script Date: 5/3/2024 14:09:00 ******/
CREATE DATABASE [Dataled]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TESTDT', FILENAME = N'D:\BAA\Databases\TESTDT.mdf' , SIZE = 2170880KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TESTDT_log', FILENAME = N'D:\BAA\Databases\TESTDT_log.ldf' , SIZE = 878845952KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Dataled] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dataled].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dataled] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dataled] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dataled] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dataled] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dataled] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dataled] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dataled] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dataled] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dataled] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dataled] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dataled] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dataled] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dataled] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dataled] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dataled] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dataled] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dataled] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dataled] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dataled] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dataled] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dataled] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dataled] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dataled] SET RECOVERY FULL 
GO
ALTER DATABASE [Dataled] SET  MULTI_USER 
GO
ALTER DATABASE [Dataled] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dataled] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dataled] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dataled] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dataled] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dataled] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dataled', N'ON'
GO
ALTER DATABASE [Dataled] SET QUERY_STORE = ON
GO
ALTER DATABASE [Dataled] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Dataled]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bk_led]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bk_led](
	[id_led] [int] NOT NULL,
	[adds] [nvarchar](50) NULL,
	[addsread] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bk_list]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bk_list](
	[id_led] [int] NOT NULL,
	[id_room] [int] NOT NULL,
	[name_led] [nvarchar](100) NULL,
	[min_temp] [float] NOT NULL,
	[max_temp] [float] NOT NULL,
	[min_humi] [float] NOT NULL,
	[max_humi] [float] NOT NULL,
	[note] [text] NULL,
	[change] [bit] NULL,
	[addsread] [nvarchar](50) NULL,
	[adds] [nvarchar](50) NULL,
	[plc] [int] NULL,
	[offset_temp] [float] NULL,
	[offset_humi] [float] NULL,
	[deltaH] [float] NULL,
	[deltaT] [float] NULL,
	[timeoff] [float] NULL,
	[enstatus] [float] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BK_List_room]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BK_List_room](
	[id_room] [int] NOT NULL,
	[name_room] [nvarchar](512) NULL,
	[list_user] [nvarchar](512) NULL,
	[floor] [int] NULL,
	[note] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data_Now]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_Now](
	[id_led] [int] NULL,
	[Time0] [datetime] NOT NULL,
	[Temp] [float] NOT NULL,
	[Humi] [float] NOT NULL,
	[alarm] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmalarm]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmalarm](
	[id] [int] NULL,
	[ten] [nvarchar](512) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[List_Led]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_Led](
	[id_led] [int] NOT NULL,
	[id_room] [int] NOT NULL,
	[name_led] [nvarchar](100) NULL,
	[min_temp] [float] NOT NULL,
	[max_temp] [float] NOT NULL,
	[min_humi] [float] NOT NULL,
	[max_humi] [float] NOT NULL,
	[note] [text] NULL,
	[change] [bit] NULL,
	[addsread] [nvarchar](50) NULL,
	[adds] [nvarchar](50) NULL,
	[plc] [int] NULL,
	[offset_temp] [float] NULL,
	[offset_humi] [float] NULL,
	[deltaH] [float] NULL,
	[deltaT] [float] NULL,
	[timeoff] [float] NULL,
	[enstatus] [float] NOT NULL,
	[csstop] [float] NULL,
	[cssleft] [float] NULL,
 CONSTRAINT [PK_List_Led] PRIMARY KEY CLUSTERED 
(
	[id_led] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[List_Room]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_Room](
	[id_room] [int] NOT NULL,
	[name_room] [nvarchar](512) NULL,
	[list_user] [nvarchar](512) NULL,
	[floor] [int] NULL,
	[note] [text] NULL,
 CONSTRAINT [PK_List_Room] PRIMARY KEY CLUSTERED 
(
	[id_room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[options]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[options](
	[cname] [nvarchar](50) NULL,
	[value_otp] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_plc]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_plc](
	[id_plc] [int] NOT NULL,
	[name_plc] [nvarchar](50) NULL,
	[status_now] [bit] NOT NULL,
	[alarm] [bit] NOT NULL,
 CONSTRAINT [PK_Status_plc] PRIMARY KEY CLUSTERED 
(
	[id_plc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalDatum]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalDatum](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[id_led] [int] NOT NULL,
	[Time0] [datetime] NOT NULL,
	[Temp] [float] NOT NULL,
	[Humi] [float] NOT NULL,
	[min_temp] [float] NOT NULL,
	[max_temp] [float] NOT NULL,
	[min_humi] [float] NOT NULL,
	[max_humi] [float] NOT NULL,
	[alarm] [nvarchar](10) NULL,
	[note] [nvarchar](max) NULL,
	[old_Temp] [float] NULL,
	[old_humi] [float] NULL,
 CONSTRAINT [PK_DATASLEDDB] PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalDatum_Bk]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalDatum_Bk](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[id_led] [int] NOT NULL,
	[Time0] [datetime] NOT NULL,
	[Temp] [float] NOT NULL,
	[Humi] [float] NOT NULL,
	[min_temp] [float] NOT NULL,
	[max_temp] [float] NOT NULL,
	[min_humi] [float] NOT NULL,
	[max_humi] [float] NOT NULL,
	[alarm] [nvarchar](10) NULL,
	[note] [nvarchar](max) NULL,
	[old_Temp] [float] NULL,
	[old_humi] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[fs_getdate]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
This query text was retrieved from showplan XML, and may be truncated.
*/

create proc [dbo].[fs_getdate] 
	@email nvarchar(128),
	@date datetime
AS
BEGIN

select a.id_led INTO #infoled from List_Led a join List_Room b on a.id_room=b.id_room where CHARINDEX(@email,b.list_user)>0
select id_log,id_led,Temp,Humi,Time0,alarm INTO #data_led from TotalDatum where Time0 >= @date

select * from #data_led a join #infoled b on a.id_led=b.id_led where   alarm not in ('','0') ORDER BY a.id_led ASC, id_log DESC

END
GO
/****** Object:  StoredProcedure [dbo].[fs_load]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[fs_load]
	@top int,
	@id_led int
as
begin
	SELECT * INTO #Tem from TotalDatum where id_led=@id_led and Time0 between  (GETDATE()-2) and GETDATE()
	SELECT max(id_log) as id_log into #log from #Tem group by LEFT( CONVERT(varchar, GETDATE(), 108),5)
	Select a.* from #Tem a join #log b on a.id_log=b.id_log
end

GO
/****** Object:  StoredProcedure [dbo].[fs_loaddtfisrt]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[fs_loaddtfisrt]
	@id_led int
as
begin
	SELECT * INTO #Tem from TotalDatum where id_led=@id_led and Time0 between DATEADD(minute,-130,GETDATE()) and GETDATE()
	SELECT max(id_log) as id_log into #log from #Tem group by LEFT( CONVERT(varchar, GETDATE(), 108),5)
	Select a.* from #Tem a join #log b on a.id_log=b.id_log
end

	
GO
/****** Object:  StoredProcedure [dbo].[fs96_ExportCSV]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[fs96_ExportCSV]
	@date datetime,
	@id_led int
AS
BEGIN
	SELECT * INTO #DT FROM TotalDatum where cast (Time0 as date)=@date and id_led=@id_led order by id_led
	alter table #DT alter column alarm nvarchar(512)
	alter table #DT drop column old_Temp
	alter table #DT drop column old_humi

	update #DT set alarm=b.ten from #DT a join dmalarm b on a.alarm=b.id

	select * from #DT
	drop table #DT
END
GO
/****** Object:  StoredProcedure [dbo].[fs96_getinfoLed]    Script Date: 5/3/2024 14:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[fs96_getinfoLed]
	@all int,
	@id_led int,
	@insrt int
as
begin

	IF @insrt=1
	BEGIN
		IF @all<>0
		begin
			SELECT b.id_led,GETDATE() as time0,c.Temp,c.Humi,b.min_temp,b.max_temp,b.min_humi,b.max_humi,cast('10' as nvarchar(10)) as alarm,'' as note INTO #rep FROM  List_Led b  JOIN Data_Now c on b.id_led=c.id_led where b.plc=@all 
			IF (SELECT COUNT(1) FROM #rep) >0
			BEGIN
				INSERT INTO TotalDatum SELECT *,Temp,Humi FROM #rep

			END
			drop table #rep

		end
		else
		begin
			SELECT b.id_led,GETDATE() as time0,c.Temp,c.Humi,b.min_temp,b.max_temp,b.min_humi,b.max_humi,cast('9' as nvarchar(10)) as alarm,'' as note INTO #rep_led FROM  List_Led b  JOIN Data_Now c on b.id_led=c.id_led where c.id_led=@id_led 
			IF (SELECT COUNT(1) FROM #rep_led) >0
			BEGIN
				INSERT INTO TotalDatum SELECT *,Temp,Humi FROM #rep_led
		
			END
			drop table #rep_led
		end
	END
	ELSE
	BEGIN
	IF @all<>0
		begin

			UPDATE Data_Now set alarm=10,Time0=GETDATE() from Data_Now a join List_Led b on a.id_led=b.id_led where b.plc=@all
			--SELECT b.id_led,GETDATE() as time0,c.Temp,c.Humi,b.min_temp,b.max_temp,b.min_humi,b.max_humi,cast('10' as nvarchar(10)) as alarm,'' as note INTO #rep FROM  List_Led b  JOIN Data_Now c on b.id_led=c.id_led where b.plc=@all 
			--IF (SELECT COUNT(1) FROM #rep) >0
			--BEGIN
			--	INSERT INTO TotalDatum SELECT *,Temp,Humi FROM #rep

			--END
			--drop table #rep

		end
		else
		begin
			UPDATE Data_Now set alarm=9,Time0=GETDATE() where id_led=@id_led
		end

	END
end
  --EXEC fs96_getinfoLed 3,0
GO
USE [master]
GO
ALTER DATABASE [Dataled] SET  READ_WRITE 
GO
