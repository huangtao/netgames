USE [QPGameUserDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[AccountsInfo]	ADD	
	 [C_IDNO] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [C_ADDRESS] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [C_EMAIL] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [C_PROTECTQUES] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [C_PROTECTANSW] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [C_BOXPASSWORD] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [OlePassWord] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [IsCheckPassWord] [bit] NOT NULL CONSTRAINT [DF_AccountsInfo_IsCheckPassWord]  DEFAULT ((1)),
	 [IsBoxPassWord] [bit] NULL CONSTRAINT [DF_AccountsInfo_IsBoxPassWord]  DEFAULT ((1)),
	 [PassWordCode] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [LoginKick] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [UserCode] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	 [Del] [int] NULL,
	 [yy] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_yy]  DEFAULT ((0)),
	 [LoginDateTime] [datetime] NULL CONSTRAINT [DF_AccountsInfo_LoginDateTime]  DEFAULT (getdate()+(8)),
	 [YYCar] [int] NULL CONSTRAINT [DF_AccountsInfo_YYCar]  DEFAULT ((0))
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Cls_Log]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cls_Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Game] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ClsDate] [datetime] NULL CONSTRAINT [DF_Cls_Log_ClsDate]  DEFAULT (getdate()),
	[Score] [int] NULL CONSTRAINT [DF_Cls_Log_Score]  DEFAULT ((100000)),
 CONSTRAINT [PK_Cls_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PassWordList]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PassWordList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Email] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Passw] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Passd] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Code] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Adder] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[TelMail] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Txt] [nvarchar](800) COLLATE Chinese_PRC_CI_AS NULL,
	[IsCut] [int] NULL CONSTRAINT [DF_PassWordList_IsCut]  DEFAULT ((0)),
	[SSDate] [datetime] NULL CONSTRAINT [DF_PassWordList_SSDate]  DEFAULT (getdate()),
	[PassWord] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[PassWord2] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_PassWordList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END