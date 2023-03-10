USE [master]
GO
/****** Object:  Database [Taxi]    Script Date: 15.12.2022 12:21:13 ******/
CREATE DATABASE [Taxi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Taxi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Taxi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Taxi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Taxi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Taxi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Taxi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Taxi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Taxi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Taxi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Taxi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Taxi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Taxi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Taxi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Taxi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Taxi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Taxi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Taxi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Taxi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Taxi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Taxi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Taxi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Taxi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Taxi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Taxi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Taxi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Taxi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Taxi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Taxi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Taxi] SET RECOVERY FULL 
GO
ALTER DATABASE [Taxi] SET  MULTI_USER 
GO
ALTER DATABASE [Taxi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Taxi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Taxi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Taxi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Taxi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Taxi', N'ON'
GO
ALTER DATABASE [Taxi] SET QUERY_STORE = OFF
GO
USE [Taxi]
GO
/****** Object:  Table [dbo].[автомобили водителей]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[автомобили водителей](
	[код_автомобиля] [int] NOT NULL,
	[марка] [varchar](max) NULL,
	[госномер] [int] NULL,
	[цвет] [nvarchar](50) NULL,
 CONSTRAINT [PK_автомобили водителей] PRIMARY KEY CLUSTERED 
(
	[код_автомобиля] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[данные работе с заказом]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[данные работе с заказом](
	[код_данных_о_работе] [int] NOT NULL,
	[принятые] [int] NULL,
	[фиксация_исполнения] [int] NULL,
	[фиксация_претензий] [int] NULL,
 CONSTRAINT [PK_данные работе с заказом] PRIMARY KEY CLUSTERED 
(
	[код_данных_о_работе] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[диспетчер]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[диспетчер](
	[код_диспетчера] [int] NOT NULL,
	[фамилия] [nvarchar](50) NULL,
	[имя] [nvarchar](50) NULL,
	[отчество] [nvarchar](50) NULL,
	[Код_смены] [int] NULL,
 CONSTRAINT [PK_диспетчер] PRIMARY KEY CLUSTERED 
(
	[код_диспетчера] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[заказ]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[заказ](
	[код_карточка_заказа] [int] NOT NULL,
	[Код_Заказа] [int] NULL,
	[Код_Категории] [int] NULL,
	[Код_Данных_о_работе] [int] NULL,
	[Код_Карточка_Сотрудника] [int] NULL,
 CONSTRAINT [PK_заказ] PRIMARY KEY CLUSTERED 
(
	[код_карточка_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[карточка сотрудника]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[карточка сотрудника](
	[код_карточка_сотрудника] [int] NOT NULL,
	[фотрография] [int] NULL,
	[трудовой_договор] [int] NOT NULL,
	[фамилия] [nvarchar](50) NULL,
	[имя] [nvarchar](50) NULL,
	[отчество] [nvarchar](50) NULL,
	[код_сотрудника] [int] NULL,
	[Код_Автомобиля] [int] NULL,
 CONSTRAINT [PK_карточка сотрудника] PRIMARY KEY CLUSTERED 
(
	[код_карточка_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[карточказаказа]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[карточказаказа](
	[код_заказа] [int] NOT NULL,
	[телефон] [int] NULL,
	[имя] [nvarchar](50) NULL,
	[дата] [date] NULL,
	[время] [int] NULL,
	[время_ожидания] [int] NULL,
	[место_отправления] [nvarchar](50) NULL,
	[место_прибытияя] [nvarchar](50) NULL,
	[стоимость_заказа] [int] NULL,
 CONSTRAINT [PK_карточказаказа] PRIMARY KEY CLUSTERED 
(
	[код_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[категории]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[категории](
	[код_категории] [int] NOT NULL,
	[выполнены] [int] NULL,
	[исполняются] [int] NULL,
	[неисполняются] [int] NULL,
 CONSTRAINT [PK_категории] PRIMARY KEY CLUSTERED 
(
	[код_категории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[клиент]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[клиент](
	[код_клиента] [int] NOT NULL,
	[имя] [nvarchar](50) NULL,
	[фамилия] [nvarchar](50) NULL,
	[отчество] [nvarchar](50) NULL,
 CONSTRAINT [PK_клиент] PRIMARY KEY CLUSTERED 
(
	[код_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[отчёт]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[отчёт](
	[код_отчета] [int] NOT NULL,
	[Код_Смены] [int] NULL,
	[Код_Клиента] [int] NULL,
 CONSTRAINT [PK_отчёт] PRIMARY KEY CLUSTERED 
(
	[код_отчета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[смена]    Script Date: 15.12.2022 12:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[смена](
	[код_смены] [int] NOT NULL,
	[фотография_смены] [int] NULL,
	[Карточка_Заказа] [int] NULL,
	[Код_Диспетчера] [int] NULL,
 CONSTRAINT [PK_смена] PRIMARY KEY CLUSTERED 
(
	[код_смены] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[автомобили водителей] ([код_автомобиля], [марка], [госномер], [цвет]) VALUES (3, N'Немо', 324, N'Серо-буро-малиновый')
INSERT [dbo].[автомобили водителей] ([код_автомобиля], [марка], [госномер], [цвет]) VALUES (5, N'Жига', 228, N'Крутой')
INSERT [dbo].[автомобили водителей] ([код_автомобиля], [марка], [госномер], [цвет]) VALUES (23, N'мажда', 896, N'красный')
INSERT [dbo].[автомобили водителей] ([код_автомобиля], [марка], [госномер], [цвет]) VALUES (32, N'Запорожец', 1945, N'Победный')
INSERT [dbo].[автомобили водителей] ([код_автомобиля], [марка], [госномер], [цвет]) VALUES (34, N'Самурай', 2000, N'Белый')
INSERT [dbo].[автомобили водителей] ([код_автомобиля], [марка], [госномер], [цвет]) VALUES (43, N'ЗИЛ', 2345, N'Черный')
GO
INSERT [dbo].[данные работе с заказом] ([код_данных_о_работе], [принятые], [фиксация_исполнения], [фиксация_претензий]) VALUES (2, 5, 2, 5)
INSERT [dbo].[данные работе с заказом] ([код_данных_о_работе], [принятые], [фиксация_исполнения], [фиксация_претензий]) VALUES (5, 2, 7, 2)
INSERT [dbo].[данные работе с заказом] ([код_данных_о_работе], [принятые], [фиксация_исполнения], [фиксация_претензий]) VALUES (41, 4242, 1441, 41)
INSERT [dbo].[данные работе с заказом] ([код_данных_о_работе], [принятые], [фиксация_исполнения], [фиксация_претензий]) VALUES (56, 737, 235, 74)
INSERT [dbo].[данные работе с заказом] ([код_данных_о_работе], [принятые], [фиксация_исполнения], [фиксация_претензий]) VALUES (234, 45, 67, 12)
INSERT [dbo].[данные работе с заказом] ([код_данных_о_работе], [принятые], [фиксация_исполнения], [фиксация_претензий]) VALUES (436, 416, 65, 7)
INSERT [dbo].[данные работе с заказом] ([код_данных_о_работе], [принятые], [фиксация_исполнения], [фиксация_претензий]) VALUES (673, 2345, 325, 1)
GO
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (1, N'Лампа', N'Сергей', N'Петрович', 1)
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (2, N'Мазь', N'Дмитрий', N'Тарасович', 2)
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (3, N'Самогон', N'Олег', N'Николаевич', 1)
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (4, N'Ананас', N'Андрей                                            ', N'Алексеевич', 2)
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (5, N'Холодец', N'Шомба', N'Буйевич', 1)
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (6, N'Кривожойкина', N'Ульбина', N'Гусева', 2)
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (7, N'Пихта ', N'Андрей', N'Володевич', 1)
INSERT [dbo].[диспетчер] ([код_диспетчера], [фамилия], [имя], [отчество], [Код_смены]) VALUES (8, N'Губка', N'Борис', N'Иванович', 2)
GO
INSERT [dbo].[заказ] ([код_карточка_заказа], [Код_Заказа], [Код_Категории], [Код_Данных_о_работе], [Код_Карточка_Сотрудника]) VALUES (5, 2, 2, 2, 1)
INSERT [dbo].[заказ] ([код_карточка_заказа], [Код_Заказа], [Код_Категории], [Код_Данных_о_работе], [Код_Карточка_Сотрудника]) VALUES (6, 3, 3, 5, 2)
INSERT [dbo].[заказ] ([код_карточка_заказа], [Код_Заказа], [Код_Категории], [Код_Данных_о_работе], [Код_Карточка_Сотрудника]) VALUES (7, 5, 2, 673, 5)
GO
INSERT [dbo].[карточка сотрудника] ([код_карточка_сотрудника], [фотрография], [трудовой_договор], [фамилия], [имя], [отчество], [код_сотрудника], [Код_Автомобиля]) VALUES (1, 1, 244, N'Сергеев', N'Руслан', N'Константинович', 1, 23)
INSERT [dbo].[карточка сотрудника] ([код_карточка_сотрудника], [фотрография], [трудовой_договор], [фамилия], [имя], [отчество], [код_сотрудника], [Код_Автомобиля]) VALUES (2, 3, 6245, N'Дмитриев', N'Абдул', N'Максимович', 2, 3)
INSERT [dbo].[карточка сотрудника] ([код_карточка_сотрудника], [фотрография], [трудовой_договор], [фамилия], [имя], [отчество], [код_сотрудника], [Код_Автомобиля]) VALUES (3, 4, 6723, N'Ефремов', N'Джамшут', N'Дмитриевич', 3, 5)
INSERT [dbo].[карточка сотрудника] ([код_карточка_сотрудника], [фотрография], [трудовой_договор], [фамилия], [имя], [отчество], [код_сотрудника], [Код_Автомобиля]) VALUES (4, 5, 1546, N'Терещенок', N'Джамшут', N'Евгеньевич', 4, 34)
GO
INSERT [dbo].[карточказаказа] ([код_заказа], [телефон], [имя], [дата], [время], [время_ожидания], [место_отправления], [место_прибытияя], [стоимость_заказа]) VALUES (1, 246364357, N'Роман', CAST(N'2022-12-22' AS Date), 10, 2, N'Ленинградская_улица', N'Бултийская', 200)
INSERT [dbo].[карточказаказа] ([код_заказа], [телефон], [имя], [дата], [время], [время_ожидания], [место_отправления], [место_прибытияя], [стоимость_заказа]) VALUES (2, 856856984, N'Тимофей', CAST(N'2022-11-01' AS Date), 4, 5, N'Чклаловмк', N'Парк', 400)
INSERT [dbo].[карточказаказа] ([код_заказа], [телефон], [имя], [дата], [время], [время_ожидания], [место_отправления], [место_прибытияя], [стоимость_заказа]) VALUES (3, 352794572, N'Евгений', CAST(N'2022-10-30' AS Date), 5, 5, N'Жуковская', N'Победа', 345)
INSERT [dbo].[карточказаказа] ([код_заказа], [телефон], [имя], [дата], [время], [время_ожидания], [место_отправления], [место_прибытияя], [стоимость_заказа]) VALUES (4, 834514638, N'Илья', CAST(N'2022-10-24' AS Date), 4, 7, N'Сталинская', N'Рабочие', 414)
INSERT [dbo].[карточказаказа] ([код_заказа], [телефон], [имя], [дата], [время], [время_ожидания], [место_отправления], [место_прибытияя], [стоимость_заказа]) VALUES (5, 783836932, N'Никита', CAST(N'2022-02-24' AS Date), 5, 6, N'Рабочие', N'Жуковская', 412)
GO
INSERT [dbo].[категории] ([код_категории], [выполнены], [исполняются], [неисполняются]) VALUES (1, 12, 3, 0)
INSERT [dbo].[категории] ([код_категории], [выполнены], [исполняются], [неисполняются]) VALUES (2, 43, 2, 4)
INSERT [dbo].[категории] ([код_категории], [выполнены], [исполняются], [неисполняются]) VALUES (3, 634, 0, 5)
INSERT [dbo].[категории] ([код_категории], [выполнены], [исполняются], [неисполняются]) VALUES (67, 2, 2, 2)
GO
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (1, N'Аркадий', N'Паравозов', N'Бобавич')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (2, N'Михаил', N'Дожуров', N'Ромбавич')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (3, N'Бандит', N'Горький', N'Романович')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (4, N'Тарас', N'Бульба', N'Михайлович')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (5, N'Зоро', N'Трепещенок', N'Евгеньевич')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (6, N'Жизнь', N'Мусорская', N'Зоровна')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (7, N'Нога', N'Старообрядова', N'Бандитовна')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (8, N'Максим', N'Чёрт', N'Дмитриевич')
INSERT [dbo].[клиент] ([код_клиента], [имя], [фамилия], [отчество]) VALUES (9, N'Дон', N'Эрон', N'Дон')
GO
INSERT [dbo].[отчёт] ([код_отчета], [Код_Смены], [Код_Клиента]) VALUES (1, 1, 2)
INSERT [dbo].[отчёт] ([код_отчета], [Код_Смены], [Код_Клиента]) VALUES (2, 2, 1)
INSERT [dbo].[отчёт] ([код_отчета], [Код_Смены], [Код_Клиента]) VALUES (3, 3, 4)
INSERT [dbo].[отчёт] ([код_отчета], [Код_Смены], [Код_Клиента]) VALUES (4, 2, 5)
INSERT [dbo].[отчёт] ([код_отчета], [Код_Смены], [Код_Клиента]) VALUES (5, 1, 6)
GO
INSERT [dbo].[смена] ([код_смены], [фотография_смены], [Карточка_Заказа], [Код_Диспетчера]) VALUES (1, 2, 5, 2)
INSERT [dbo].[смена] ([код_смены], [фотография_смены], [Карточка_Заказа], [Код_Диспетчера]) VALUES (2, 2, 6, 4)
INSERT [dbo].[смена] ([код_смены], [фотография_смены], [Карточка_Заказа], [Код_Диспетчера]) VALUES (3, 6, 7, 5)
GO
ALTER TABLE [dbo].[заказ]  WITH CHECK ADD  CONSTRAINT [FK_заказ_данные работе с заказом] FOREIGN KEY([Код_Данных_о_работе])
REFERENCES [dbo].[данные работе с заказом] ([код_данных_о_работе])
GO
ALTER TABLE [dbo].[заказ] CHECK CONSTRAINT [FK_заказ_данные работе с заказом]
GO
ALTER TABLE [dbo].[заказ]  WITH CHECK ADD  CONSTRAINT [FK_заказ_карточказаказа] FOREIGN KEY([Код_Заказа])
REFERENCES [dbo].[карточказаказа] ([код_заказа])
GO
ALTER TABLE [dbo].[заказ] CHECK CONSTRAINT [FK_заказ_карточказаказа]
GO
ALTER TABLE [dbo].[заказ]  WITH CHECK ADD  CONSTRAINT [FK_заказ_категории] FOREIGN KEY([Код_Категории])
REFERENCES [dbo].[категории] ([код_категории])
GO
ALTER TABLE [dbo].[заказ] CHECK CONSTRAINT [FK_заказ_категории]
GO
ALTER TABLE [dbo].[карточка сотрудника]  WITH CHECK ADD  CONSTRAINT [FK_карточка сотрудника_автомобили водителей] FOREIGN KEY([Код_Автомобиля])
REFERENCES [dbo].[автомобили водителей] ([код_автомобиля])
GO
ALTER TABLE [dbo].[карточка сотрудника] CHECK CONSTRAINT [FK_карточка сотрудника_автомобили водителей]
GO
ALTER TABLE [dbo].[отчёт]  WITH CHECK ADD  CONSTRAINT [FK_отчёт_клиент] FOREIGN KEY([Код_Клиента])
REFERENCES [dbo].[клиент] ([код_клиента])
GO
ALTER TABLE [dbo].[отчёт] CHECK CONSTRAINT [FK_отчёт_клиент]
GO
ALTER TABLE [dbo].[отчёт]  WITH CHECK ADD  CONSTRAINT [FK_отчёт_смена] FOREIGN KEY([Код_Смены])
REFERENCES [dbo].[смена] ([код_смены])
GO
ALTER TABLE [dbo].[отчёт] CHECK CONSTRAINT [FK_отчёт_смена]
GO
ALTER TABLE [dbo].[смена]  WITH CHECK ADD  CONSTRAINT [FK_смена_диспетчер] FOREIGN KEY([Код_Диспетчера])
REFERENCES [dbo].[диспетчер] ([код_диспетчера])
GO
ALTER TABLE [dbo].[смена] CHECK CONSTRAINT [FK_смена_диспетчер]
GO
ALTER TABLE [dbo].[смена]  WITH CHECK ADD  CONSTRAINT [FK_смена_заказ] FOREIGN KEY([Карточка_Заказа])
REFERENCES [dbo].[заказ] ([код_карточка_заказа])
GO
ALTER TABLE [dbo].[смена] CHECK CONSTRAINT [FK_смена_заказ]
GO
USE [master]
GO
ALTER DATABASE [Taxi] SET  READ_WRITE 
GO
