USE [master]
GO
/****** Object:  Database [Banking]    Script Date: 05/09/2024 04:57:28 ******/
CREATE DATABASE [Banking] ON  PRIMARY 
( NAME = N'Banking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Banking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Banking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Banking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Banking] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banking] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Banking] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Banking] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Banking] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Banking] SET ARITHABORT OFF
GO
ALTER DATABASE [Banking] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Banking] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Banking] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Banking] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Banking] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Banking] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Banking] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Banking] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Banking] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Banking] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Banking] SET  DISABLE_BROKER
GO
ALTER DATABASE [Banking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Banking] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Banking] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Banking] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Banking] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Banking] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Banking] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Banking] SET  READ_WRITE
GO
ALTER DATABASE [Banking] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Banking] SET  MULTI_USER
GO
ALTER DATABASE [Banking] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Banking] SET DB_CHAINING OFF
GO
USE [Banking]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/09/2024 04:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [CreatedDate], [LastLoginDate]) VALUES (1, N'hamdi12345', N'#Yafa@1983', N'hamdi_yafa@hotmail.com', CAST(0x0000B13B0018BD3C AS DateTime), CAST(0x0000B16400F1A3B5 AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [CreatedDate], [LastLoginDate]) VALUES (9, N'Admin', N'admin123', N'admin@hotmail.com', CAST(0x0000B13B004B0A9B AS DateTime), CAST(0x0000B164016405D8 AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [CreatedDate], [LastLoginDate]) VALUES (10, N'Fadi1234', N'12345678', N'Fadi1234@hotmail.com', CAST(0x0000B16400EE99E5 AS DateTime), CAST(0x0000B16400F19A2F AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [CreatedDate], [LastLoginDate]) VALUES (14, N'Mike123', N'12345678', N'Mike1234@hotmail.com', CAST(0x0000B1640161864F AS DateTime), CAST(0x0000B16401787107 AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserActivation]    Script Date: 05/09/2024 04:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivation](
	[UserId] [int] NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserActivation] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipts]    Script Date: 05/09/2024 04:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipts](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[TransactionType] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Receipts] ON
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (1, 1, N'Deposit', CAST(0x0000B12E0023D2FB AS DateTime), CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (2, 1, N'Deposit', CAST(0x0000B12E0023D956 AS DateTime), CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (3, 1, N'Deposit', CAST(0x0000B12E00248E01 AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (4, 1, N'Withdraw', CAST(0x0000B12E0026186F AS DateTime), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (5, 1, N'Deposit', CAST(0x0000B12E00263158 AS DateTime), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (6, 4, N'Deposit', CAST(0x0000B12E00265C52 AS DateTime), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (7, 3, N'Withdraw', CAST(0x0000B12E002F1E96 AS DateTime), CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (8, 3, N'Deposit', CAST(0x0000B12E003093D3 AS DateTime), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (9, 3, N'Deposit', CAST(0x0000B12E0031A976 AS DateTime), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (10, 1, N'Deposit', CAST(0x0000B12E014A79F6 AS DateTime), CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (11, 2, N'Withdraw', CAST(0x0000B12E014D1A6E AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (12, 2, N'Deposit', CAST(0x0000B12E014DD473 AS DateTime), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (13, 1, N'Deposit', CAST(0x0000B13B0057D101 AS DateTime), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (14, 1, N'Withdraw', CAST(0x0000B13B0057DA4A AS DateTime), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (15, 2, N'Withdraw', CAST(0x0000B13B0057E03C AS DateTime), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (16, 6, N'Deposit', CAST(0x0000B16401218B44 AS DateTime), CAST(700.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (17, 7, N'Deposit', CAST(0x0000B164012B87FC AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (18, 9, N'Deposit', CAST(0x0000B164012B9F20 AS DateTime), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (19, 9, N'Withdraw', CAST(0x0000B164012C32D9 AS DateTime), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (20, 9, N'Withdraw', CAST(0x0000B164012C418B AS DateTime), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (21, 9, N'Withdraw', CAST(0x0000B164012C5CD7 AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (22, 7, N'Deposit', CAST(0x0000B1640134B61F AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (23, 9, N'Deposit', CAST(0x0000B1640134C1E3 AS DateTime), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (24, 7, N'Withdraw', CAST(0x0000B1640134D860 AS DateTime), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (25, 2, N'Withdraw', CAST(0x0000B1640135874F AS DateTime), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (26, 2, N'Withdraw', CAST(0x0000B16401358D5E AS DateTime), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (27, 7, N'Withdraw', CAST(0x0000B16401359F87 AS DateTime), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (28, 9, N'Withdraw', CAST(0x0000B1640137612C AS DateTime), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (29, 7, N'Deposit', CAST(0x0000B16401376C93 AS DateTime), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (30, 2, N'Deposit', CAST(0x0000B1640137A3EC AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (31, 2, N'Deposit', CAST(0x0000B1640137EB84 AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (32, 3, N'Deposit', CAST(0x0000B1640137FA62 AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (33, 7, N'Withdraw', CAST(0x0000B1640138CE4F AS DateTime), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (34, 9, N'Deposit', CAST(0x0000B1640138E5EF AS DateTime), CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (35, 10, N'Deposit', CAST(0x0000B16401633308 AS DateTime), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (36, 11, N'Withdraw', CAST(0x0000B164016352AD AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (37, 10, N'Withdraw', CAST(0x0000B16401738BB2 AS DateTime), CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (38, 10, N'Deposit', CAST(0x0000B16401739E05 AS DateTime), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Receipts] ([ReceiptID], [AccountID], [TransactionType], [TransactionDate], [Amount]) VALUES (39, 10, N'Withdraw', CAST(0x0000B1640179C1A7 AS DateTime), CAST(3100.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Receipts] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 05/09/2024 04:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (1, N'Hamdi', N'Yaseen', N'Amman', N'0786263324', N'hamdi12345', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (2, N'Hamdi', N'Yaseen', N'Amman', N'0786263324', N'hamdi12345', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (3, N'Hamdi', N'Yaseen', N'Amman', N'0786263324', N'hamdi12345', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (4, N'Hamdi', N'Yaseen', N'Amman', N'0786263324', N'hamdi12345', N'hamdi_yafa@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (5, N'Hamdi', N'Yaseen', N'Amman', N'0786263324', N'Ahmad39', N'hamdi_yafa@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (6, N'Salem', N'Al mahseri', N'Lincoln', N'07424570982', N'Ahmad60', N'hamdi_yafa@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (7, N'Hamdi', N'Yaseen', N'Amman', N'00962786263324', N'hamdi12345', N'hamdi_yafa@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (8, N'Fadi', N'Fadi', N'Al batha''a street', N'0786263324', N'Fadi1234', N'fadi123@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (13, N'Mike', N'John Betson', N'Lincoln,UK', N'07862623435', N'Mike123', N'Mike123@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber], [Username], [Email]) VALUES (14, N'Mike', N'John', N'London,UK', N'0786263324', N'Mike123', N'Mike123@hotmail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[Bank]    Script Date: 05/09/2024 04:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[BankID] [int] NOT NULL,
	[BankName] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[PhoneNumber] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Bank] ([BankID], [BankName], [Address], [PhoneNumber]) VALUES (1, N'HSBC', N'UK', N'03457404404')
/****** Object:  Table [dbo].[Account]    Script Date: 05/09/2024 04:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[BankID] [int] NULL,
	[AccountType] [varchar](50) NULL,
	[Balance] [decimal](18, 2) NULL,
 CONSTRAINT [PK__Account__349DA5860CBAE877] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON
INSERT [dbo].[Account] ([AccountID], [CustomerID], [BankID], [AccountType], [Balance]) VALUES (4, 7, 1, N'Personal', CAST(1950.00 AS Decimal(18, 2)))
INSERT [dbo].[Account] ([AccountID], [CustomerID], [BankID], [AccountType], [Balance]) VALUES (10, 13, 1, N'Personal', CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[Account] ([AccountID], [CustomerID], [BankID], [AccountType], [Balance]) VALUES (11, 14, 1, N'Business', CAST(500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Account] OFF
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCustomer]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(50),
    @Address NVARCHAR(100),
    @PhoneNumber NVARCHAR(15),
    @Username NVARCHAR(50),
    @CustomerID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
 DECLARE @ErrorMessage VARCHAR(255);
    -- Check if the username already exists
    --IF EXISTS (SELECT 1 FROM Customer WHERE Username = @Username)
   -- BEGIN
      -- set @ErrorMessage='Username already exists.';
      --  RETURN;
   -- END;

    -- Insert into Customer table
    INSERT INTO Customer (FirstName, LastName,Email, [Address], PhoneNumber, Username)
    VALUES (@FirstName, @LastName,@Email,@Address, @PhoneNumber, @Username)
    set @CustomerID = SCOPE_IDENTITY()
    -- Output success message
    --PRINT 'Customer inserted successfully. CustomerID: ' + CAST(@CustomerID AS NVARCHAR(10));
   Return @CustomerID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_User]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Insert_User 'Mudassar2', '12345', 'mudassar@aspsnippets.com'
CREATE PROCEDURE [dbo].[Insert_User]
	@Username NVARCHAR(20),
	@Password NVARCHAR(20),
	@Email NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT UserId FROM Users WHERE Username = @Username)
	BEGIN
		SELECT -1 -- Username exists.
	END
	ELSE IF EXISTS(SELECT UserId FROM Users WHERE Email = @Email)
	BEGIN
		SELECT -2 -- Email exists.
	END
	ELSE
	BEGIN
		INSERT INTO [Users]
			   ([Username]
			   ,[Password]
			   ,[Email]
			   ,[CreatedDate])
		VALUES
			   (@Username
			   ,@Password
			   ,@Email
			   ,GETDATE())
		
		SELECT SCOPE_IDENTITY() -- UserId			   
     END
END
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionHistoryWithFilters]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTransactionHistoryWithFilters]
  
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL,
    @TransactionType VARCHAR(50) = NULL,
    @MinAmount DECIMAL(18, 2) = NULL,
    @MaxAmount DECIMAL(18, 2) = NULL
   
AS
BEGIN
    SET NOCOUNT ON;
     Declare @ErrorMessage varchar(255);
    -- Initialize error message
    SET @ErrorMessage = NULL;

     SELECT * FROM Receipts
    WHERE (@StartDate IS NULL OR TransactionDate >= @StartDate)
        AND (@EndDate IS NULL OR TransactionDate <= @EndDate)
        AND (@TransactionType IS NULL OR TransactionType = @TransactionType)
        AND (@MinAmount IS NULL OR Amount >= @MinAmount)
        AND (@MaxAmount IS NULL OR Amount <= @MaxAmount);
   
END;
GO
/****** Object:  StoredProcedure [dbo].[Validate_User]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[Validate_User]
	@Username NVARCHAR(20),
	@Password NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @UserId INT, @LastLoginDate DATETIME
	
	SELECT @UserId = UserId, @LastLoginDate = LastLoginDate 
	FROM Users WHERE Username = @Username AND [Password] = @Password
	
	IF @UserId IS NOT NULL
	BEGIN
		IF NOT EXISTS(SELECT UserId FROM UserActivation WHERE UserId = @UserId)
		BEGIN
			UPDATE Users
			SET LastLoginDate =  GETDATE()
			WHERE UserId = @UserId
			SELECT @UserId [UserId] -- User Valid
		END
		ELSE
		BEGIN
			SELECT -2 -- User not activated.
		END
	END
	ELSE
	BEGIN
		SELECT -1 -- User invalid.
	END
END
GO
/****** Object:  StoredProcedure [dbo].[WithdrawCashWithRealTimeUpdate]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WithdrawCashWithRealTimeUpdate]
    @AccountID INT,
    @Amount DECIMAL(18, 2),
    @ErrorMessage VARCHAR(255)OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

   SET @ErrorMessage = NULL;
    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @AccountID)
    BEGIN
         SET @ErrorMessage ='Account does not exist.';
        RETURN;
    END;

    -- Check if sufficient balance is available
    DECLARE @CurrentBalance DECIMAL(18, 2);
    SELECT @CurrentBalance = Balance FROM Account WHERE AccountID = @AccountID;

    IF @CurrentBalance < @Amount
    BEGIN
         SET @ErrorMessage ='Insufficient balance.';
        RETURN;
    END;

    -- Update the balance
    UPDATE Account
    SET Balance = Balance - @Amount
    WHERE AccountID = @AccountID;
    
    
    -- Generate receipt
    DECLARE @ReceiptID INT;
    INSERT INTO Receipts (AccountID, TransactionType, Amount, TransactionDate)
    VALUES (@AccountID, 'Withdraw', @Amount, GETDATE());
    SET @ReceiptID = SCOPE_IDENTITY();

    -- Output success message
    PRINT 'Withdrawal successful. Updated balance: ' + CAST((@CurrentBalance - @Amount) AS VARCHAR(20));
END;
GO
/****** Object:  StoredProcedure [dbo].[TransferFundsWithinSameBank]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransferFundsWithinSameBank]
    @SourceAccountID INT,
    @DestinationAccountID INT,
    @Amount DECIMAL(18, 2),
    @ErrorMessage VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Initialize error message
    SET @ErrorMessage = NULL;

    --Check if source and destination accounts exist
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @SourceAccountID)
    BEGIN
        SET @ErrorMessage = 'Source account does not exist.';
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @DestinationAccountID)
    BEGIN
        SET @ErrorMessage = 'Destination account does not exist.';
        RETURN;
    END;

    -- Check if source account has sufficient balance
    DECLARE @SourceBalance DECIMAL(18, 2);
    SELECT @SourceBalance = Balance FROM Account WHERE AccountID = @SourceAccountID;

    IF @SourceBalance < @Amount
    BEGIN
        SET @ErrorMessage = 'Insufficient balance in the source account.';
        RETURN;
    END;

    -- Update source and destination account balances
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Account
        SET Balance = Balance - @Amount
        WHERE AccountID = @SourceAccountID;

        UPDATE Account
        SET Balance = Balance + @Amount
        WHERE AccountID = @DestinationAccountID;

        COMMIT TRANSACTION;

        SET @ErrorMessage = 'Funds transferred successfully.';
         RETURN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @ErrorMessage = 'An error occurred while transferring funds.';
         RETURN;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAccountByManagers]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetCustomerAccountByManagers]
   
AS
BEGIN
    SET NOCOUNT ON;
    
    

  SELECT     Customer.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address, Customer.PhoneNumber, Customer.Username, Customer.Email, Account.AccountID, 
                      Account.CustomerID AS Expr1, Account.AccountType, Account.Balance
FROM         Account INNER JOIN
                      Customer ON Account.CustomerID = Customer.CustomerID
                     
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAccountById]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetCustomerAccountById]
   @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

  SELECT     Customer.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address, Customer.PhoneNumber, Customer.Username, Customer.Email, Account.AccountID, 
                      Account.CustomerID AS Expr1, Account.AccountType, Account.Balance
FROM         Account INNER JOIN
                      Customer ON Account.CustomerID = Customer.CustomerID
                      
                      where Customer.CustomerID=@CustomerID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAccount]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomerAccount]
   @Username NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    

  SELECT     Customer.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address, Customer.PhoneNumber, Customer.Username, Customer.Email, Account.AccountID, 
                      Account.CustomerID AS Expr1, Account.AccountType, Account.Balance
FROM         Account INNER JOIN
                      Customer ON Account.CustomerID = Customer.CustomerID
                      where Customer.Username=@Username;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditAccountDetails]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditAccountDetails]
    @AccountID INT,
    @NewAccountType VARCHAR(50),
    @NewFirstName VARCHAR(50),
    @NewLastName VARCHAR(50),
    @NewAddress VARCHAR(100),
    @NewPhoneNumber VARCHAR(15),
    @NewEmail VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update account type
    UPDATE Account
    SET AccountType = @NewAccountType
    WHERE AccountID = @AccountID;

    -- Update customer information if provided
    IF (@NewFirstName IS NOT NULL AND @NewLastName IS NOT NULL AND @NewAddress IS NOT NULL AND @NewPhoneNumber IS NOT NULL AND @NewEmail IS NOT NULL)
    BEGIN
        UPDATE Customer
        SET FirstName = @NewFirstName,
            LastName = @NewLastName,
            Address = @NewAddress,
            PhoneNumber = @NewPhoneNumber,
            Email=@NewEmail
        WHERE CustomerID = (SELECT CustomerID FROM Account WHERE AccountID = @AccountID);
    END

    PRINT 'Account details updated successfully.';
END;
GO
/****** Object:  StoredProcedure [dbo].[DepositCashWithReceipt]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DepositCashWithReceipt]
    @AccountID INT,
    @Amount DECIMAL(18, 2)
    
AS
BEGIN
    SET NOCOUNT ON;
    declare @ErrorMessage VARCHAR(255);
    SET @ErrorMessage = NULL;
    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @AccountID)
    BEGIN
        SET @ErrorMessage = 'Account does not exist.';
        RETURN;
    END

    -- Update the balance
    UPDATE Account
    SET Balance = Balance + @Amount
    WHERE AccountID = @AccountID;

    -- Generate receipt
    DECLARE @ReceiptID INT;
    INSERT INTO Receipts (AccountID, TransactionType, Amount, TransactionDate)
    VALUES (@AccountID, 'Deposit', @Amount, GETDATE());
    SET @ReceiptID = SCOPE_IDENTITY();

    -- Output receipt information
    SELECT 'Receipt generated successfully. Receipt ID: ' + CAST(@ReceiptID AS VARCHAR(10)) AS ReceiptInfo;
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateNewAccount]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewAccount]
    @CustomerID INT,
    @BankID INT,
    @AccountType VARCHAR(50),
    @InitialBalance DECIMAL(18, 2)
  
AS
BEGIN
    SET NOCOUNT ON;
   DECLARE @ErrorMessage VARCHAR(255);
   SET @ErrorMessage = NULL;
    -- Check if CustomerID and BankID exist
    IF NOT EXISTS (SELECT 1 FROM Customer WHERE CustomerID = @CustomerID)
    BEGIN
        SET @ErrorMessage ='Customer does not exist.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Bank WHERE BankID = @BankID)
    BEGIN
       SET @ErrorMessage ='Bank does not exist.';
        RETURN;
    END

    -- Insert new account
    INSERT INTO Account (CustomerID, BankID, AccountType, Balance)
    VALUES (@CustomerID, @BankID, @AccountType, @InitialBalance);

    -- Output success message
    PRINT 'New account created successfully.';
END;
GO
/****** Object:  StoredProcedure [dbo].[CloseAccount]    Script Date: 05/09/2024 04:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CloseAccount]
    @AccountID INT,
     @ErrorMessage VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
SET @ErrorMessage = NULL;
    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @AccountID)
    BEGIN
       SET @ErrorMessage = 'Account does not exist.';
        RETURN;
    END

    -- Delete the account
    DELETE FROM Account WHERE AccountID = @AccountID;

    SET @ErrorMessage = 'Account closed successfully.';
END
GO
/****** Object:  ForeignKey [FK__Account__BankID__0F975522]    Script Date: 05/09/2024 04:57:29 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__BankID__0F975522] FOREIGN KEY([BankID])
REFERENCES [dbo].[Bank] ([BankID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__BankID__0F975522]
GO
