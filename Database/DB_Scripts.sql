USE [KingsHillMarina]
GO
/****** Object:  User [ikoomson]    Script Date: 24/09/2024 14:41:58 ******/
CREATE USER [ikoomson] FOR LOGIN [ikoomson] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ikoomson]
GO
/****** Object:  Table [dbo].[BoatDetails]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Length] [float] NOT NULL,
	[MakeId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Berth] [varchar](50) NOT NULL,
	[Pier] [char](1) NOT NULL,
	[ChargeId] [int] NOT NULL,
	[DateBerthed] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[DateDeactivated] [datetime] NULL,
 CONSTRAINT [PK_BoatDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoatMake]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatMake](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BoatMake] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoatOwner]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatOwner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[Telephone] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BoatOwner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoatType]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BoatType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Charge]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](5, 2) NOT NULL,
	[VAT] [int] NOT NULL,
 CONSTRAINT [PK_Charge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Details] [varchar](8000) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BoatDetails] ON 
GO
INSERT [dbo].[BoatDetails] ([Id], [OwnerId], [Name], [Length], [MakeId], [TypeId], [Berth], [Pier], [ChargeId], [DateBerthed], [Active], [DateDeactivated]) VALUES (2, 2, N'Sunflower', 67.88, 3, 8, N'Berth  11', N'G', 1, CAST(N'2024-07-02T11:41:54.023' AS DateTime), 1, NULL)
GO
INSERT [dbo].[BoatDetails] ([Id], [OwnerId], [Name], [Length], [MakeId], [TypeId], [Berth], [Pier], [ChargeId], [DateBerthed], [Active], [DateDeactivated]) VALUES (3, 2, N'Dreamweaver', 55.35, 2, 2, N'Berth 4', N'O', 1, CAST(N'2024-08-02T11:49:10.193' AS DateTime), 1, NULL)
GO
INSERT [dbo].[BoatDetails] ([Id], [OwnerId], [Name], [Length], [MakeId], [TypeId], [Berth], [Pier], [ChargeId], [DateBerthed], [Active], [DateDeactivated]) VALUES (4, 3, N'Morning Star', 62.85, 5, 2, N'Berth 7', N'Q', 1, CAST(N'2024-06-02T11:52:38.827' AS DateTime), 1, NULL)
GO
INSERT [dbo].[BoatDetails] ([Id], [OwnerId], [Name], [Length], [MakeId], [TypeId], [Berth], [Pier], [ChargeId], [DateBerthed], [Active], [DateDeactivated]) VALUES (5, 4, N'Joy Rider', 34.22, 7, 8, N'Berth 8', N'J', 1, CAST(N'2024-09-03T20:58:21.247' AS DateTime), 1, NULL)
GO
INSERT [dbo].[BoatDetails] ([Id], [OwnerId], [Name], [Length], [MakeId], [TypeId], [Berth], [Pier], [ChargeId], [DateBerthed], [Active], [DateDeactivated]) VALUES (6, 5, N'Dragon Fly', 45.75, 9, 6, N'Berth 6', N'J', 1, CAST(N'2024-09-04T12:54:23.623' AS DateTime), 1, NULL)
GO
INSERT [dbo].[BoatDetails] ([Id], [OwnerId], [Name], [Length], [MakeId], [TypeId], [Berth], [Pier], [ChargeId], [DateBerthed], [Active], [DateDeactivated]) VALUES (7, 7, N'Dragon Fly', 60.75, 7, 4, N'Berth 8', N'H', 1, CAST(N'2024-09-04T12:57:11.613' AS DateTime), 1, NULL)
GO
INSERT [dbo].[BoatDetails] ([Id], [OwnerId], [Name], [Length], [MakeId], [TypeId], [Berth], [Pier], [ChargeId], [DateBerthed], [Active], [DateDeactivated]) VALUES (8, 9, N'Morning Glory', 56.85, 10, 9, N'Test Berth 9', N'N', 1, CAST(N'2024-09-06T12:49:16.667' AS DateTime), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[BoatDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[BoatMake] ON 
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (1, N'Beneteau')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (2, N'Sunseeker')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (3, N'Jeanneau')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (4, N'Fairline Yachts')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (5, N'Sealine')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (6, N'Moody Yachts')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (7, N'Orkney')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (8, N'Oyster Yachts')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (9, N'Broom')
GO
INSERT [dbo].[BoatMake] ([Id], [Name]) VALUES (10, N'Test Make')
GO
SET IDENTITY_INSERT [dbo].[BoatMake] OFF
GO
SET IDENTITY_INSERT [dbo].[BoatOwner] ON 
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (2, N'Isaac', N'Koomson', N'110 Bloxhall Road Leyton E10 7BX', N'07738093441', N'isaackoomson@hotmail.com')
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (3, N'Daddy', N'Moffey', N'10 Church  Rao Camberwell E5 8PY', N'07918146552', N'daddymof@gmail.com')
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (4, N'Ike', N'Tagoe', N'18 Beckway Street Walworth SE17 2DG', N'66688000022', N'ike.tagoe@yahoo.co.uk')
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (5, N'Eliza', N'Koomson', N'20 East Street Walworth London SE17 4RT', N'222333666', N'eliza.koomson@gmail.com')
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (6, N'Eliza', N'Koomson', N'56 East Street Walworth London SE17 5RT', N'44446668', N'elizakoomson@gmail.com')
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (7, N'Nana Yaa', N'Koomson', N'56 East Street Walworth London SE17 5RT', N'44446668', N'elizakoomson@gmail.com')
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (8, N'Barbara', N'Addison', N'35 Dunton Road Bermondsey London SE5 7TY', N'222244466', N'baddison@gmail.com')
GO
INSERT [dbo].[BoatOwner] ([Id], [FirstName], [LastName], [Address], [Telephone], [Email]) VALUES (9, N'Barbara', N'Addison', N'35 Dunton Road Bermondsey London SE5 7TY', N'444422222', N'baddison@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[BoatOwner] OFF
GO
SET IDENTITY_INSERT [dbo].[BoatType] ON 
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (1, N'Bowrider')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (2, N'Fishing')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (3, N'Jet')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (4, N'Cuddy Cabin')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (5, N'Dory')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (6, N'Sedan Bridge')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (7, N'Catamarans')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (8, N'Runabouts')
GO
INSERT [dbo].[BoatType] ([Id], [Name]) VALUES (9, N'Test Type')
GO
SET IDENTITY_INSERT [dbo].[BoatType] OFF
GO
SET IDENTITY_INSERT [dbo].[Charge] ON 
GO
INSERT [dbo].[Charge] ([Id], [Amount], [VAT]) VALUES (1, CAST(51.85 AS Decimal(5, 2)), 20)
GO
SET IDENTITY_INSERT [dbo].[Charge] OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON 
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (1, N'Error Message: Message: Invalid object name ''Make''.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at KingsHillMarina.Repositories.LookupsRepository.GetLookups(Lookups lookupsTable) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\LookupsRepository.cs:line 46
', CAST(N'2024-09-03T10:29:16.757' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (2, N'Error Message: Message: Invalid object name ''Type''.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at KingsHillMarina.Repositories.LookupsRepository.GetLookups(Lookups lookupsTable) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\LookupsRepository.cs:line 46
', CAST(N'2024-09-03T10:29:16.780' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (3, N'Error Message: Message: Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.<QueryImpl>d__62`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at KingsHillMarina.Repositories.BoatDetailsRepository.GetById(Int32 id) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\BoatDetailsRepository.cs:line 110
Inner Exception
Message: The wait operation timed out
Stack Trace: 
', CAST(N'2024-09-04T12:08:36.930' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (4, N'Error Message: Message: Procedure or function ins_up_InsertOrUpdateBoatDetails has too many arguments specified.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Dapper.SqlMapper.ExecuteCommand(IDbConnection cnn, CommandDefinition& command, Action`2 paramReader)
   at Dapper.SqlMapper.ExecuteImpl(IDbConnection cnn, CommandDefinition& command)
   at Dapper.SqlMapper.Execute(IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Nullable`1 commandTimeout, Nullable`1 commandType)
   at KingsHillMarina.Repositories.BoatDetailsRepository.Save(IBoatDetails boatDetails) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\BoatDetailsRepository.cs:line 159
', CAST(N'2024-09-06T11:39:34.080' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (5, N'Error Message: Message: Procedure or function ins_up_InsertOrUpdateBoatDetails has too many arguments specified.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Dapper.SqlMapper.ExecuteCommand(IDbConnection cnn, CommandDefinition& command, Action`2 paramReader)
   at Dapper.SqlMapper.ExecuteImpl(IDbConnection cnn, CommandDefinition& command)
   at Dapper.SqlMapper.Execute(IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Nullable`1 commandTimeout, Nullable`1 commandType)
   at KingsHillMarina.Repositories.BoatDetailsRepository.Save(IBoatDetails boatDetails) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\BoatDetailsRepository.cs:line 159
', CAST(N'2024-09-06T11:56:04.200' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (6, N'Error Message: Message: Procedure or function ins_up_InsertOrUpdateBoatDetails has too many arguments specified.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Dapper.SqlMapper.ExecuteCommand(IDbConnection cnn, CommandDefinition& command, Action`2 paramReader)
   at Dapper.SqlMapper.ExecuteImpl(IDbConnection cnn, CommandDefinition& command)
   at Dapper.SqlMapper.Execute(IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Nullable`1 commandTimeout, Nullable`1 commandType)
   at KingsHillMarina.Repositories.BoatDetailsRepository.Save(IBoatDetails boatDetails) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\BoatDetailsRepository.cs:line 159
', CAST(N'2024-09-06T11:56:14.640' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (7, N'Error Message: Message: Procedure or function ins_up_InsertOrUpdateBoatDetails has too many arguments specified.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Dapper.SqlMapper.ExecuteCommand(IDbConnection cnn, CommandDefinition& command, Action`2 paramReader)
   at Dapper.SqlMapper.ExecuteImpl(IDbConnection cnn, CommandDefinition& command)
   at Dapper.SqlMapper.Execute(IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Nullable`1 commandTimeout, Nullable`1 commandType)
   at KingsHillMarina.Repositories.BoatDetailsRepository.Save(IBoatDetails boatDetails) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\BoatDetailsRepository.cs:line 159
', CAST(N'2024-09-06T11:56:21.010' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [Details], [DateAdded]) VALUES (8, N'Error Message: Message: Procedure or function ins_up_InsertOrUpdateBoatDetails has too many arguments specified.
Stack Trace:    at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Dapper.SqlMapper.ExecuteCommand(IDbConnection cnn, CommandDefinition& command, Action`2 paramReader)
   at Dapper.SqlMapper.ExecuteImpl(IDbConnection cnn, CommandDefinition& command)
   at Dapper.SqlMapper.Execute(IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Nullable`1 commandTimeout, Nullable`1 commandType)
   at KingsHillMarina.Repositories.BoatDetailsRepository.Save(IBoatDetails boatDetails) in D:\Mof\Interviews Technical Questions\Keystone - 28-08-2024\Code\KingsHillMarina\KingsHillMarina.Repositories\BoatDetailsRepository.cs:line 159
', CAST(N'2024-09-06T11:56:31.630' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
ALTER TABLE [dbo].[BoatDetails] ADD  CONSTRAINT [DF_BoatDetails_DateAdded]  DEFAULT (getdate()) FOR [DateBerthed]
GO
ALTER TABLE [dbo].[BoatDetails] ADD  CONSTRAINT [DF_BoatDetails_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[BoatDetails]  WITH CHECK ADD  CONSTRAINT [FK_BoatDetails_BoatMake] FOREIGN KEY([MakeId])
REFERENCES [dbo].[BoatMake] ([Id])
GO
ALTER TABLE [dbo].[BoatDetails] CHECK CONSTRAINT [FK_BoatDetails_BoatMake]
GO
ALTER TABLE [dbo].[BoatDetails]  WITH CHECK ADD  CONSTRAINT [FK_BoatDetails_BoatOwner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[BoatOwner] ([Id])
GO
ALTER TABLE [dbo].[BoatDetails] CHECK CONSTRAINT [FK_BoatDetails_BoatOwner]
GO
ALTER TABLE [dbo].[BoatDetails]  WITH CHECK ADD  CONSTRAINT [FK_BoatDetails_BoatType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[BoatType] ([Id])
GO
ALTER TABLE [dbo].[BoatDetails] CHECK CONSTRAINT [FK_BoatDetails_BoatType]
GO
ALTER TABLE [dbo].[BoatDetails]  WITH CHECK ADD  CONSTRAINT [FK_BoatDetails_Charge] FOREIGN KEY([ChargeId])
REFERENCES [dbo].[Charge] ([Id])
GO
ALTER TABLE [dbo].[BoatDetails] CHECK CONSTRAINT [FK_BoatDetails_Charge]
GO
/****** Object:  StoredProcedure [dbo].[del_DeactivateBoatDetails]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[del_DeactivateBoatDetails]
	@Id int
AS
BEGIN TRY

	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE [dbo].[BoatDetails]
	SET [Active] = 0,
    [DateDeactivated] = CURRENT_TIMESTAMP
	WHERE Id = @Id
		
END TRY
BEGIN CATCH
    SET @errorMsg = 'Could not deactivate boat details: ' + ERROR_MESSAGE()
    RAISERROR(@errorMsg, 16, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ins_InsertLog]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_InsertLog]
	-- Add the parameters for the stored procedure here
	@Details VARCHAR(8000)
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
	BEGIN TRY
	    INSERT INTO [dbo].[Log] ([Details])
	    SELECT @Details 
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not insert into log table: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END
GO
/****** Object:  StoredProcedure [dbo].[ins_up_InsertOrUpdateBoatDetails]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ins_up_InsertOrUpdateBoatDetails]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@OwnerFirstName VARCHAR(50),
	@OwnerLastName VARCHAR(50),
	@OwnerAddress VARCHAR(150),
	@OwnerTelephone VARCHAR(30),
	@OwnerEmail VARCHAR(50),
	@Name VARCHAR(100),
	@Length FLOAT,
	@MakeId INT,
	@TypeId INT,
	@Berth VARCHAR(50),
	@Pier CHAR(1)
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	DECLARE @OwnerId INT
	DECLARE @ChargeId INT

	

	BEGIN TRY

	 BEGIN TRANSACTION
	
	   SELECT TOP 1 @ChargeId = Id FROM [dbo].[Charge]     --- Use just the firts row from the Charge table

		/**** Check if the owner already exists **/

		SELECT @OwnerId = Id FROM [dbo].[BoatOwner]
		WHERE [FirstName] = @OwnerFirstName
		AND [LastName] = @OwnerLastName
		AND [Telephone] = @OwnerTelephone  
		AND [Email] = @OwnerEmail 
		  
			IF @OwnerId IS NULL
			   BEGIN
				 INSERT INTO [dbo].[BoatOwner](
				  [FirstName],
				  [LastName],
				  [Address],
				  [Telephone],
				  [Email]
				 )
				  SELECT
					@OwnerFirstName,
					@OwnerLastName,
					@OwnerAddress,
					@OwnerTelephone,
					@OwnerEmail
	
				  -- Get Owner Id
				  SET @OwnerId = SCOPE_IDENTITY()

			   END
			   ELSE
				 BEGIN
					UPDATE [dbo].[BoatOwner]
					SET [FirstName] = @OwnerFirstName,
						[LastName] = @OwnerLastName,
						[Address] = @OwnerAddress,
						[Telephone] = @OwnerTelephone,
						[Email] = @OwnerEmail
						WHERE Id = @OwnerId 
				 END
       
       /******************************************************/

		    IF @Id  = 0
 			    BEGIN 	
			
				   INSERT INTO [dbo].[BoatDetails](
					[OwnerId],
					[Name],
                    [Length],
                    [MakeId],
                    [TypeId],
                    [Berth],
                    [Pier],
                    [ChargeId]
				   )
				   SELECT 
				     @OwnerId,
				     @Name,
					 @Length,
					 @MakeId,
					 @TypeId,
					 @Berth,
					 @Pier,
					 @ChargeId
					 WHERE NOT EXISTS (SELECT NULL FROM  [dbo].[BoatDetails]  WHERE [Berth]  = LTRIM(RTRIM(@Berth)) AND [Pier]  =  LTRIM(RTRIM(@Pier)) AND [Active] = 1)	-- Pier and Berth Availability
	         END
 	   ELSE 
	     BEGIN
	        UPDATE [dbo].[BoatDetails]  
	        SET [OwnerId] = @OwnerId,
			     [Name] = @Name,
                [Length] = @Length,
                [MakeId] = @MakeId,
                [TypeId] =  @TypeId,
                [Berth] = @Berth,
                [Pier] = @Pier,
				[ChargeId] = @ChargeId
	        WHERE Id = @Id
	     END 
	   
     COMMIT TRANSACTION
	 
  END TRY
  BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @errorMsg = 'Could not insert Or update Boat Details: ' + ERROR_MESSAGE()
		RAISERROR(@errorMsg, 16, 1)
  END CATCH
		
END

GO
/****** Object:  StoredProcedure [dbo].[ins_up_InsertOrUpdateBoatMake]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ins_up_InsertOrUpdateBoatMake]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
    @Name VARCHAR(50)
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
		
	BEGIN TRY
		 
	   IF @Id = 0 
	     BEGIN
	        INSERT INTO [dbo].[BoatMake]([Name])
	        SELECT @Name
			WHERE NOT EXISTS (SELECT NULL FROM [dbo].[BoatMake] WHERE [Name] = @Name)-- check for duplicate entry
	     END
	   ELSE 
	     BEGIN
	       
	        UPDATE [dbo].[BoatMake]
	        SET [Name] = @Name
		    WHERE Id = @Id
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update boat make: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO
/****** Object:  StoredProcedure [dbo].[ins_up_InsertOrUpdateBoatType]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ins_up_InsertOrUpdateBoatType]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
    @Name VARCHAR(50)
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
		
	BEGIN TRY
		 
	   IF @Id = 0 
	     BEGIN
	        INSERT INTO [dbo].[BoatType]([Name])
	        SELECT @Name
			WHERE NOT EXISTS (SELECT NULL FROM [dbo].[BoatType] WHERE [Name] = @Name)-- check for duplicate entry
	     END
	   ELSE 
	     BEGIN
	       
	        UPDATE [dbo].[BoatType]
	        SET [Name] = @Name
		    WHERE Id = @Id
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update boat type: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO
/****** Object:  StoredProcedure [dbo].[sel_GetBoatDetails]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sel_GetBoatDetails]
	-- Add the parameters for the stored procedure here
	@Id INT = NULL
   AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY

	  WITH BoatDetails AS (
	   SELECT 
	    bd.Id,
		bd.[Name],
        bd.[Length],
		bm.[Name] 'Make',
        bd.[MakeId],
	    bt.[Name] 'Type',
        bd.[TypeId],
        bd.[Berth],
        bd.[Pier],
        bo.[FirstName] 'OwnerFirstName',
        bo.[LastName] 'OwnerLastName',
        bo.[Address] 'OwnerAddress',
        bo.[Telephone] 'OwnerTelephone',
        bo.[Email] 'OwnerEmail',
		bd.[Active],
		bd.[DateBerthed],
		CAST( ROUND( bd.[Length] * c.[Amount] * (MONTH(getdate()) - MONTH(bd.DateBerthed)) * (1 + c.[VAT]/100) , 2)  AS  NUMERIC(36,2)) 'Charge' -- plus VAT c.[VAT]/100%. Why charge per month and not per day?
       FROM [dbo].[BoatDetails] bd
	   INNER JOIN [dbo].[BoatOwner] bo
	   ON bd.OwnerId = bo.Id
	    INNER JOIN [dbo].[BoatMake] bm
	   ON bd.MakeId = bm.Id
	   INNER JOIN [dbo].[BoatType] bt
	   ON bd.TypeId = bt.Id
	   INNER JOIN [dbo].[Charge] c
	   ON bd.ChargeId = c.Id
	   WHERE bd.[Active] = 1
	  
   )

   SELECT BoatDetails.* INTO #TempTable FROM BoatDetails

   IF @Id IS NULL
     BEGIN
	   SELECT TOP 500 * FROM #TempTable   ORDER BY  [Name]
	 END
   ELSE
	   BEGIN
	     SELECT * FROM #TempTable where Id = @Id
	   END

     DROP TABLE #TempTable ;
	   
	   
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get boat details: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END
GO
/****** Object:  StoredProcedure [dbo].[sel_GetCharge]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sel_GetCharge]
	-- Add the parameters for the stored procedure here
   AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	   SELECT * FROM   [dbo].[Charge] WHERE Id = 1
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get charge: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END
GO
/****** Object:  StoredProcedure [dbo].[sel_GetLookup]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sel_GetLookup]
	-- Add the parameters for the stored procedure here
	@TableName VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @str_SQL VARCHAR(5000)

 SET  @str_SQL  = 'SELECT Id, Name FROM ' + @TableName + '  ORDER BY  Name'

EXEC(@str_SQL)

END
GO
/****** Object:  StoredProcedure [dbo].[up_UpdateCharge]    Script Date: 24/09/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateCharge]
	-- Add the parameters for the stored procedure here
    @Id INT = 1,
    @Amount FLOAT,
	@VAT INT
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
		
	BEGIN TRY
	
	        UPDATE [dbo].[Charge] 
	        SET [Amount]  = @Amount,
            [VAT] = @VAT
		    WHERE Id = @Id
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not update charge: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO
