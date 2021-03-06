USE [master]
GO
/****** Object:  Database [InventryxDB]    Script Date: 02/28/2018 23:58:21 ******/
CREATE DATABASE [InventryxDB] ON  PRIMARY 
( NAME = N'InventryxDB_Data', FILENAME = N'D:\SqlServer2008\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\InventryxDB.mdf' , SIZE = 6848KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'InventryxDB_Log', FILENAME = N'D:\SqlServer2008\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\InventryxDB_1.ldf' , SIZE = 7616KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [InventryxDB] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventryxDB].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [InventryxDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [InventryxDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [InventryxDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [InventryxDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [InventryxDB] SET ARITHABORT OFF
GO
ALTER DATABASE [InventryxDB] SET AUTO_CLOSE ON
GO
ALTER DATABASE [InventryxDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [InventryxDB] SET AUTO_SHRINK ON
GO
ALTER DATABASE [InventryxDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [InventryxDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [InventryxDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [InventryxDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [InventryxDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [InventryxDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [InventryxDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [InventryxDB] SET  ENABLE_BROKER
GO
ALTER DATABASE [InventryxDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [InventryxDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [InventryxDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [InventryxDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [InventryxDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [InventryxDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [InventryxDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [InventryxDB] SET  READ_WRITE
GO
ALTER DATABASE [InventryxDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [InventryxDB] SET  MULTI_USER
GO
ALTER DATABASE [InventryxDB] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [InventryxDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'InventryxDB', N'ON'
GO
USE [InventryxDB]
GO
/****** Object:  Table [dbo].[MstOption]    Script Date: 02/28/2018 23:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstOption](
	[OptionID] [varchar](12) NOT NULL,
	[OptionName] [varchar](60) NOT NULL,
	[ParentID] [varchar](10) NULL,
	[LeafTag] [varchar](1) NOT NULL,
	[AssemblyName] [varchar](60) NULL,
	[ProgName] [varchar](60) NULL,
	[ActiveTag] [varchar](1) NOT NULL,
	[SortOptionID] [varchar](12) NOT NULL,
	[UserTypeID] [varchar](1) NOT NULL,
	[ImageIndex] [int] NOT NULL,
	[PageURL] [ntext] NULL,
 CONSTRAINT [PK_MstOption] PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_MstOption_OptionName] UNIQUE NONCLUSTERED 
(
	[OptionName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_MstOption_SortOptionID] UNIQUE NONCLUSTERED 
(
	[SortOptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'00', N'Main Menu', NULL, N'N', NULL, NULL, N'Y', N'00', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'01', N'Masters', N'00', N'N', NULL, NULL, N'Y', N'01', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0101', N'Department', N'01', N'Y', NULL, NULL, N'Y', N'0101', N'N', 0, N'~/Masters/Department.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0102', N'Stock Point', N'01', N'Y', NULL, NULL, N'Y', N'0102', N'N', 0, N'~/Masters/StockPoint.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0103', N'Manufacture', N'01', N'Y', NULL, NULL, N'Y', N'0103', N'N', 0, N'~/Masters/Manufacturer.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0110', N'-Sep0110', N'01', N'S', NULL, NULL, N'Y', N'0110', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0111', N'Product Group', N'01', N'Y', NULL, NULL, N'Y', N'0111', N'N', 0, N'~/Masters/ProductGroup.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0112', N'Product', N'01', N'Y', NULL, NULL, N'Y', N'0112', N'N', 0, N'~/Masters/Product.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0113', N'Product Opening Stock', N'01', N'Y', NULL, NULL, N'N', N'0113', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0114', N'Product Rate  ', N'01', N'Y', NULL, NULL, N'Y', N'0114', N'N', 0, N'~/Masters/ProductRate.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0120', N'-Sep0120', N'01', N'S', NULL, NULL, N'Y', N'0120', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0121', N'Supplier', N'01', N'Y', NULL, NULL, N'Y', N'0121', N'N', 0, N'~/Masters/Supplier.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0122', N'Supplier Rate', N'01', N'Y', NULL, NULL, N'Y', N'0122', N'N', 0, N'~/Masters/SupplierRate.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0123', N'Customer', N'01', N'Y', NULL, NULL, N'Y', N'0123', N'N', 0, N'~/Masters/Customer.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0130', N'-Sep0130', N'01', N'S', NULL, NULL, N'Y', N'0130', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0131', N'Service Item', N'01', N'Y', NULL, NULL, N'Y', N'0131', N'N', 0, N'~/Masters/ServiceItem.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0132', N'Labour Category', N'01', N'Y', NULL, NULL, N'Y', N'0132', N'N', 0, N'~/Masters/LabourCategory.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'03', N'Purchase', N'00', N'N', NULL, NULL, N'Y', N'03', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0301', N'Indent', N'03', N'Y', NULL, NULL, N'N', N'0301', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0302', N'Purchase Order', N'03', N'Y', NULL, NULL, N'Y', N'0302', N'N', 0, N'~/Transactions/PurchaseOrder.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0303', N'Goods Receipt Note', N'03', N'Y', NULL, NULL, N'Y', N'0303', N'N', 0, N'~/Transactions/GoodsReceiptNoList.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0304', N'Purchase Return', N'03', N'Y', NULL, NULL, N'Y', N'0304', N'N', 0, N'~/Transactions/PurchaseReturnList.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0305', N'Purchase Invoice', N'03', N'Y', NULL, NULL, N'Y', N'0305', N'N', 0, N'~/Transactions/PurchaseInvoice.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0306', N'Purchase Payment', N'03', N'Y', NULL, NULL, N'N', N'0306', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'04', N'Sales', N'00', N'N', NULL, NULL, N'Y', N'04', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0401', N'Proforma Invoice', N'04', N'Y', NULL, NULL, N'Y', N'0401', N'N', 0, N'~/Transactions/ProformaInvoice.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0402', N'Delivery Note', N'04', N'Y', NULL, NULL, N'Y', N'0402', N'N', 0, N'~/Transactions/DeliveryNoteList.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0403', N'Sales Invoice', N'04', N'Y', NULL, NULL, N'Y', N'0403', N'N', 0, N'~/Transactions/SalesInvoiceList.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0404', N'Sales Return', N'04', N'Y', NULL, NULL, N'Y', N'0404', N'N', 0, N'~/Transactions/SalesReturnList.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0405', N'Customer Receipt', N'04', N'Y', NULL, NULL, N'N', N'0405', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'05', N'Service', N'00', N'N', NULL, NULL, N'Y', N'05', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0501', N'Job Work Details', N'05', N'Y', NULL, NULL, N'Y', N'0501', N'N', 0, N'~/Transactions/JobDetails.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0502', N'Job Product Issue', N'05', N'Y', NULL, NULL, N'Y', N'0502', N'N', 0, N'~/Transactions/JobProductIssue.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0503', N'Service Invoice', N'05', N'Y', NULL, NULL, N'Y', N'0503', N'N', 0, N'~/Transactions/ServiceInvoice.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'06', N'Stock', N'00', N'N', NULL, NULL, N'Y', N'06', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0601', N'Stock Transfer', N'06', N'Y', NULL, NULL, N'Y', N'0601', N'N', 0, N'~/Transactions/StockTransfer.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'0602', N'Stock Adjustment', N'06', N'Y', NULL, NULL, N'Y', N'0602', N'N', 0, N'~/Transactions/StockAdjustment.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'10', N'Reports', N'00', N'N', NULL, NULL, N'Y', N'10', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'1001', N'Purchase Reports', N'10', N'N', NULL, NULL, N'N', N'1001', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'100101', N'Purchase Register', N'1001', N'N', NULL, NULL, N'N', N'100101', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'10010101', N'Date Wise Register', N'100101', N'Y', NULL, NULL, N'N', N'10010101', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'10010102', N'Supplier Wise Register', N'100101', N'Y', NULL, NULL, N'N', N'10010102', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'100102', N'Purchase Payment Report', N'1001', N'Y', NULL, NULL, N'N', N'100102', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'1002', N'Sales Reports', N'10', N'N', NULL, NULL, N'N', N'1002', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'100201', N'Sales Register', N'1002', N'Y', NULL, NULL, N'N', N'100201', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'1003', N'Stock Reports', N'10', N'N', NULL, NULL, N'N', N'1003', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'90', N'Administration', N'00', N'N', NULL, NULL, N'Y', N'90', N'S', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9002', N'User', N'90', N'Y', NULL, NULL, N'Y', N'9002', N'A', 4, N'~/Masters/UserList.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9003', N'User Access', N'90', N'Y', NULL, NULL, N'Y', N'9003', N'S', 5, N'~/Masters/AccessRightMaster.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9004', N'-sep9004', N'90', N'S', NULL, NULL, N'Y', N'9004', N'A', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9005', N'Company', N'90', N'Y', NULL, NULL, N'Y', N'9005', N'A', 1, N'~/Masters/Company.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9006', N'Branch', N'90', N'Y', NULL, NULL, N'Y', N'9006', N'A', 2, N'~/Masters/Branch.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9007', N'Financial Year', N'90', N'Y', NULL, NULL, N'Y', N'9007', N'A', 3, N'~/Masters/FinYearList.aspx')
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9010', N'-sep9010', N'90', N'S', NULL, NULL, N'Y', N'9010', N'A', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9011', N'Location Setup', N'90', N'Y', NULL, NULL, N'Y', N'9011', N'A', 6, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'92', N'Tools', N'00', N'N', NULL, NULL, N'Y', N'92', N'N', 0, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'9201', N'Change Password', N'92', N'Y', NULL, NULL, N'Y', N'9201', N'N', 7, NULL)
INSERT [dbo].[MstOption] ([OptionID], [OptionName], [ParentID], [LeafTag], [AssemblyName], [ProgName], [ActiveTag], [SortOptionID], [UserTypeID], [ImageIndex], [PageURL]) VALUES (N'94', N'Help', N'00', N'N', NULL, NULL, N'Y', N'94', N'N', 0, NULL)
/****** Object:  StoredProcedure [dbo].[MstOption_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstOption_Select] 
		(
		@OptionId as varchar(12)
		)
AS
Begin
	SELECT 	OptionID, OptionName, ParentID, LeafTag, AssemblyName, ProgName, 
		ActiveTag, SortOptionID, UserTypeID, ImageIndex
	FROM    MstOption
	Where 	OptionId = @OptionId
End
GO
/****** Object:  StoredProcedure [dbo].[MstMenu_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip-- 9/04/2007
CREATE PROCEDURE [dbo].[MstMenu_Select]
As 
 
Begin
/*
	Select 	OptionID,OptionName,isnull(ParentID,0) as ParentID,  len(OptionID) as MenuLevel
	from 	MstOption 
	Where 	ActiveTag='Y' 
	and 	OptionID<>'00'
	and	LeafTag = 'N'
	Order By SortOptionID ASC

	Select 	OptionID,OptionName,isnull(ParentID,0) as ParentID, len(OptionID) as MenuLevel
	from 	MstOption 
	Where 	ActiveTag='Y' 
	and 	OptionID<>'00'
	and	LeafTag = 'Y'
	Order By SortOptionID ASC
*/

	Select OptionID,OptionName,isnull(ParentID,0) as ParentID,PageURL from MstOption Where ActiveTag='Y' and 
	OptionID<>'00' and leafTag<>'S' Order By SortOptionID ASC

End
GO
/****** Object:  Table [dbo].[MstUserAccess]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstUserAccess](
	[UserID] [varchar](12) NOT NULL,
	[OptionID] [varchar](12) NOT NULL,
	[AccessTag] [varchar](1) NOT NULL,
	[UpdateTag] [varchar](1) NOT NULL,
	[InsertTag] [varchar](1) NOT NULL,
	[DeleteTag] [varchar](1) NOT NULL,
 CONSTRAINT [PK_MstUserAccess] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[OptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'01', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0101', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0102', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0103', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0110', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0111', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0112', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0113', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0114', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0120', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0121', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0122', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0123', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0130', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0131', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0132', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'03', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0301', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0302', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0303', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0304', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0305', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0306', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'04', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0401', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0402', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0403', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0404', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0405', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'05', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0501', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0502', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0503', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'06', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0601', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'0602', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'10', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'1001', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'100101', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'10010101', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'10010102', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'100102', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'1002', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'100201', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'1003', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'90', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9002', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9003', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9004', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9005', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9006', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9007', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9010', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9011', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'92', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'9201', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'ADMIN', N'94', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'01', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0101', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0102', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0103', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0110', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0111', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0112', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0113', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0114', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0120', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0121', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0122', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0123', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0130', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0131', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0132', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'03', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0301', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0302', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0303', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0304', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0305', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0306', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'04', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0401', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0402', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0403', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0404', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0405', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'05', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0501', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0502', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0503', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'06', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0601', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'0602', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'10', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'1001', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'100101', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'10010101', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'10010102', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'100102', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'1002', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'100201', N'Y', N'Y', N'Y', N'Y')
GO
print 'Processed 100 total records'
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'1003', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'90', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9002', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9003', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9004', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9005', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9006', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9007', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9010', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9011', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'92', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'9201', N'Y', N'Y', N'Y', N'Y')
INSERT [dbo].[MstUserAccess] ([UserID], [OptionID], [AccessTag], [UpdateTag], [InsertTag], [DeleteTag]) VALUES (N'SUPADMIN', N'94', N'Y', N'Y', N'Y', N'Y')
/****** Object:  StoredProcedure [dbo].[MstUserRightsInfo_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip-- 9/04/2007
CREATE PROCEDURE [dbo].[MstUserRightsInfo_Select](@UserID  varchar(12) = null)
As 
 
Begin

	SELECT MstOption.OptionID,  
	isnull(MstUserAccess.AccessTag,'N') as AccessTag, isnull(MstUserAccess.UpdateTag,'N') as UpdateTag,
	 isnull(MstUserAccess.InsertTag,'N') as InsertTag, isnull(MstUserAccess.DeleteTag,'N') as DeleteTag
	FROM  MstOption INNER JOIN
	MstUserAccess ON MstOption.OptionID = MstUserAccess.OptionID
	where MstUserAccess.UserID=@UserID and MstOption.LeafTag='Y' and MstOption.ActiveTag='Y'
	order by MstOption.SortOptionID ASC
  
End
GO
/****** Object:  StoredProcedure [dbo].[MstUserAccessForMenu_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE Procedure [dbo].[MstUserAccessForMenu_Select] 
		(
		@UserID  varchar(12) = null
		)
AS
BEGIN
	
	-- Select User Access option except super administrator 
        	Select  		a.UserID, a.OptionID, b.OptionName, a.AccessTag,  a.InsertTag, a.UpdateTag, a.DeleteTag, b.LeafTag, b.ParentID, b.ProgName, upper(b.OptionName) As OptionNameInCaps, b.AssemblyName, b.ImageIndex
        	From    		mstUserAccess a, mstOption b
	where		a.OptionID = b.OptionID
	and		a.UserID <> 'SUPADMIN'
	and		a.OptionID <> '00'
	and		a.UserID like isnull(@UserID,'%')	
	and		b.ActiveTag = 'Y'	
        	order by 	a.UserID, b.sortOptionID
END
GO
/****** Object:  StoredProcedure [dbo].[MstUserAccess_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE Procedure [dbo].[MstUserAccess_Select] 
(
	@UserID varchar(12)
)
AS
BEGIN
	
	-- Select User Access option except super administrator 
        	Select  		a.UserID, a.OptionID, b.OptionName, replicate('&nbsp;&nbsp; ',((Len(a.OptionID) - 1) * 4)) + b.OptionName as TreeOptionName,  a.AccessTag,  a.InsertTag, a.UpdateTag, a.DeleteTag, b.LeafTag
        	From    		mstUserAccess a, mstOption b
	where		a.OptionID = b.OptionID
	and		a.UserID <> 'SUPADMIN'
	and		a.OptionID <> '00'
	and		b.ActiveTag = 'Y'	
	and		b.LeafTag <> 'S'
	and 		UserID=@UserID
        	order by 	b.sortOptionID
END
GO
/****** Object:  StoredProcedure [dbo].[MstRights_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 17/05/2007
CREATE PROCEDURE [dbo].[MstRights_Select]
(
	@UserID  varchar(12) = null
)
As 
 
Begin
	SELECT MstOption.OptionID,MstOption.OptionName,MstUserAccess.AccessTag,
	MstUserAccess.UpdateTag,MstUserAccess.InsertTag, MstUserAccess.DeleteTag,MstUserAccess.UserID
	FROM MstOption LEFT OUTER JOIN
	MstUserAccess ON MstOption.OptionID = MstUserAccess.OptionID
	WHERE     (MstOption.LeafTag = 'Y') AND (MstOption.ActiveTag = 'Y') AND (MstUserAccess.UserID=@UserID)
	ORDER BY MstOption.SortOptionID
End
GO
/****** Object:  Table [dbo].[MstUser]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstUser](
	[UserID] [varchar](12) NOT NULL,
	[UserName] [varchar](40) NOT NULL,
	[UserPWD] [varchar](200) NOT NULL,
	[UserTypeID] [varchar](1) NOT NULL,
	[DisableTag] [varchar](1) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstUser] ([UserID], [UserName], [UserPWD], [UserTypeID], [DisableTag], [CompanyID], [BranchID]) VALUES (N'ADMIN', N'Administrator', N'Admin', N'A', N'N', N'01', N'001')
INSERT [dbo].[MstUser] ([UserID], [UserName], [UserPWD], [UserTypeID], [DisableTag], [CompanyID], [BranchID]) VALUES (N'SUPADMIN', N'Super Administrator', N'SUPADMIN', N'A', N'N', N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstUserPwd_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip --18/05/2007
CREATE PROCEDURE [dbo].[MstUserPwd_Select]
(
	@UserID  varchar(12) = null
)
As 
 
Begin
	Select UserPWD
	From MstUser 
	Where UserID=@UserID
End
GO
/****** Object:  StoredProcedure [dbo].[MstUserLoad_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--Created By : Tridip Bhattacharjee

CREATE PROCEDURE [dbo].[MstUserLoad_Select]
As

	Begin
		 Select userid,username From mstUser
	End
GO
/****** Object:  StoredProcedure [dbo].[MstUserCheckCredential_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip-- 9/04/2007
CREATE PROCEDURE [dbo].[MstUserCheckCredential_Select](
@UserID  varchar(12) = null,
@PWD  varchar(200) = null
)
As 
 
Begin
	Declare @intCntr as int
	Declare @strYN as varchar(1)
	set @intCntr = 0
	
	Select 	@intCntr = count(*) 
	From 	MstUser
	Where 	UserID=@UserID and UserPWD=@PWD


	if @intCntr = 0 
	begin
		set @strYN = 'N'
	end
	else
	Begin	
		set @strYN = 'Y'
	End		
	select 	@strYN as result
  
End
GO
/****** Object:  Table [dbo].[UserLogIN]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLogIN](
	[UserID] [varchar](12) NOT NULL,
	[LoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLogIN] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MstUserLoginCheck_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUserLoginCheck_Select](@UserID  varchar(12) = null)
As 
 
Begin
	Declare @intCntr as int
	Declare @strYN as varchar(1)
	-- Check whether same user logged in ot not
	set @intCntr = 0
	
	Select 	@intCntr = count(*) 
	From 	UserLogIN
	Where 	UserID like isnull(@UserID,'%')	
	if @intCntr = 0 
	begin
		set @strYN = 'N'
	end
	else
	Begin	
		set @strYN = 'Y'
	End		
	select 	@strYN
  
End
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLog](
	[LogDate] [datetime] NOT NULL,
	[LogUser] [varchar](12) NOT NULL,
	[LogMessage] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D011F9333 AS DateTime), N'admin', N'Insert Product Group Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D011FA40B AS DateTime), N'admin', N'Insert Product Group Data0100100002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012989F3 AS DateTime), N'admin', N'Insert Product Group Data0100100003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D0129D0AA AS DateTime), N'admin', N'Insert Product0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012AB567 AS DateTime), N'admin', N'Insert Product0100100002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012AE0C3 AS DateTime), N'admin', N'Insert Product0100100003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012B2190 AS DateTime), N'admin', N'Insert Product0100100004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012BD747 AS DateTime), N'admin', N'Insert Product0100100005')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012BFF77 AS DateTime), N'admin', N'Insert Product0100100006')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012C2BFB AS DateTime), N'admin', N'Insert Product Group Data0100100004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012C3C63 AS DateTime), N'admin', N'Modified Product Group Data0100100004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012D9FEC AS DateTime), N'admin', N'Insert Product0100100007')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D012DC8B7 AS DateTime), N'admin', N'Insert Product0100100008')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D01300F99 AS DateTime), N'admin', N'Insert Product0100100009')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D01386C1A AS DateTime), N'admin', N'Insert Supplier Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D01388CDC AS DateTime), N'admin', N'Insert Stock Point Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D0138B8EA AS DateTime), N'admin', N'Insert Stock Point Data0100100002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D0138CD33 AS DateTime), N'admin', N'Insert Stock Point Data0100100003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D0138E385 AS DateTime), N'admin', N'Insert Stock Point Data0100100004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996D0139BA2D AS DateTime), N'admin', N'Insert Customer Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E00E4B4D1 AS DateTime), N'admin', N'Insert Branch 002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E00E4E33B AS DateTime), N'admin', N'Insert Branch 003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E00E5C570 AS DateTime), N'admin', N'Insert Stock Point Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E00E5E8AB AS DateTime), N'admin', N'Insert Department Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E00E5F837 AS DateTime), N'admin', N'Insert Department Data0100100002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E0108A178 AS DateTime), N'admin', N'Insert Product Rate Data010010000000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E010F4046 AS DateTime), N'admin', N'Insert Product Rate Data0100100000000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E010FB2B7 AS DateTime), N'admin', N'Insert Supplier Rate Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E010FC2BD AS DateTime), N'admin', N'Insert Supplier Rate Data0100100002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E010FF1D5 AS DateTime), N'admin', N'Insert Purchase Order010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E01105EC8 AS DateTime), N'admin', N'Insert Goods Receipt Note010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E0110C195 AS DateTime), N'admin', N'Insert Goods Receipt Note010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E01112557 AS DateTime), N'admin', N'Insert Pruchase Invoice010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E0113E71F AS DateTime), N'admin', N'Insert Proforma Invoice010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E01141DAF AS DateTime), N'admin', N'Insert Delivery Note010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E0114383C AS DateTime), N'admin', N'Insert Sales Invoice010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000996E01316CF6 AS DateTime), N'admin', N'Insert Proforma Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974011ADC97 AS DateTime), N'Admin', N'Insert Labour Category Data0100100001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974011ADCF9 AS DateTime), N'Admin', N'Insert Labour Category Data0100100002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974011AE9FA AS DateTime), N'Admin', N'Insert Labour Category Data0100100003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974011B33E0 AS DateTime), N'Admin', N'Insert Job Details010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974011BA1C2 AS DateTime), N'Admin', N'Insert Service Item Data0100100003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974012FCEE3 AS DateTime), N'Admin', N'Insert Product Rate Data0100100000000003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974012FD924 AS DateTime), N'Admin', N'Insert Product Rate Data0100100000000004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974012FE340 AS DateTime), N'Admin', N'Insert Product Rate Data0100100000000005')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974012FF228 AS DateTime), N'Admin', N'Insert Product Rate Data0100100000000006')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974012FFDF2 AS DateTime), N'Admin', N'Insert Product Rate Data0100100000000007')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009974013008D7 AS DateTime), N'Admin', N'Insert Product Rate Data0100100000000008')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009975011C6A0A AS DateTime), N'admin', N'Insert Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997601293A5F AS DateTime), N'admin', N'Update Purchase Order010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009976012E20AA AS DateTime), N'admin', N'Update Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x00009976012E67A2 AS DateTime), N'admin', N'Update Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099760131D093 AS DateTime), N'admin', N'Update Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997601322741 AS DateTime), N'admin', N'Update Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997601353E11 AS DateTime), N'admin', N'Update Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997601358555 AS DateTime), N'admin', N'Update Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997601359917 AS DateTime), N'admin', N'Cancel Job010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099760135D72A AS DateTime), N'admin', N'Cancel Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997B00D9FAC8 AS DateTime), N'admin', N'Update Service Invoice010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997C00C11A8A AS DateTime), N'admin', N'Insert Purchase Order010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997C00C1641C AS DateTime), N'admin', N'Update Pruchase Invoice010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997C01341E01 AS DateTime), N'admin', N'Insert Stock Adjustment Details')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997C0134385B AS DateTime), N'admin', N'Insert Stock Adjustment Details')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997C0134C562 AS DateTime), N'admin', N'Insert Stock Adjustment Details')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997C013A7627 AS DateTime), N'admin', N'Insert Stock Adjustment Details')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000997C013A86F2 AS DateTime), N'admin', N'Insert Stock Adjustment Details')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000998F00D08D7D AS DateTime), N'admin', N'Insert Purchase Order010011478000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999101099D2B AS DateTime), N'admin', N'Cancel StockAdjustment010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999101198DB5 AS DateTime), N'admin', N'Cancel StockAdjustment010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999101199025 AS DateTime), N'admin', N'Cancel StockAdjustment010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999200BE6B5D AS DateTime), N'ADMIN', N'Insert Purchase Order010017777000003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999200C345F8 AS DateTime), N'ADMIN', N'Cancel Purchase Orde010017777000003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999300E7E33B AS DateTime), N'admin', N'Update Stock Adjustment010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999300E88254 AS DateTime), N'admin', N'Update Stock Adjustment010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999300EDD022 AS DateTime), N'admin', N'Update Stock Adjustment010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999300EE0DAC AS DateTime), N'admin', N'Update Stock Adjustment010017777000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099930109C6C9 AS DateTime), N'admin', N'Update Stock Adjustment010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999700DC4D20 AS DateTime), N'admin', N'Insert Delivery Note010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999700F6BEEB AS DateTime), N'admin', N'Cancel StockTransfer010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x0000999700F7EF5E AS DateTime), N'admin', N'Cancel StockTransfer010017777000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A201030475 AS DateTime), N'admin', N'Insert Goods Receipt Note010017777000003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A201032529 AS DateTime), N'admin', N'Update Goods Receipt Note010017777000003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A2013466A0 AS DateTime), N'admin', N'Insert Department Data0100100003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A50108C227 AS DateTime), N'admin', N'Insert Department Data0100100004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A5010933F9 AS DateTime), N'admin', N'Modified Department Data0100100004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A5010944BF AS DateTime), N'admin', N'Deleted Department Data0100100004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A5010BC7FE AS DateTime), N'admin', N'Insert Purchase Order010010607000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A5010DB6C3 AS DateTime), N'admin', N'Insert Proforma Invoice010010607000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A5010F9E80 AS DateTime), N'admin', N'Insert Stock Point Data0100100002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A6013516D4 AS DateTime), N'admin', N'Insert Goods Receipt Note010010607000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A60136518D AS DateTime), N'admin', N'Update Goods Receipt Note010010607000001')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A701068D1C AS DateTime), N'admin', N'Insert Purchase Order010010607000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A70106C8C4 AS DateTime), N'admin', N'Insert Purchase Order010010607000003')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A701070796 AS DateTime), N'admin', N'Insert Goods Receipt Note010010607000002')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A7010B7DA7 AS DateTime), N'admin', N'Insert Purchase Order010010607000004')
INSERT [dbo].[UserLog] ([LogDate], [LogUser], [LogMessage]) VALUES (CAST(0x000099A7010BC3E9 AS DateTime), N'admin', N'Insert Goods Receipt Note010010607000003')
/****** Object:  StoredProcedure [dbo].[UserLog_Insert]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE Procedure [dbo].[UserLog_Insert]
( 
	@LogDate datetime,
	@LogUser varchar(12),
	@LogMessage varchar(200)
)
As
BEGIN
	/* This procedure calling from all insert, update and delete procedure */
	Declare @intCntr as int
	-- Checking Reference Key	
	set @intCntr = 0
	
	select  @intcntr = count(UserID)
	from    MstUser
	where   (UserID = @LogUser)
	
	if @intcntr = 0
	begin
	        select 'Invalid User'
	        return
	end
	-- Insert User log data	
	Insert into UserLog
	(LogDate, LogUser, LogMessage)
	Values
	(@LogDate, @LogUser, @LogMessage)
END
GO
/****** Object:  StoredProcedure [dbo].[MstUserPwd_Update]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUserPwd_Update]
		(
		@UserID as varchar(12) ,
		@UserPWD as varchar(200),
		@CompanyId as varchar(2),
		@BranchId as varchar(3),
		@LogUserId as varchar(12) 
		)
  As 
 
Begin
   
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Select Reference Key
	select  @intcntr = count(UserID)
	from   MstUser
	where   (UserID=@UserID)
	
	if @intcntr = 0
	begin
	        select 'Error : Invalid User'
	        return
	end
	BEGIN TRANSACTION
	
	-- Change Password	
	Update 	MstUser 
	set 	UserPWD  = @UserPWD
	where	UserID = @UserID

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Change Password User ' + @UserID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserId, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select @UserID
  
END
GO
/****** Object:  StoredProcedure [dbo].[MstUserLogIN_Insert]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUserLogIN_Insert]
		(
		@UserID  varchar(12) = null
		)
As 
 
Begin
	Declare @intCntr as int
	Declare @CurDateTime as datetime
	Declare @intError as int
	DEclare @LogMsg as varchar(200)
	set @intCntr = 0
	BEGIN TRANSACTION
	-- Insert User log in after user logged into the system
	Insert UserLogIN (UserID, LogINDate)
	values (@UserID, @CurDateTime)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End 
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Login User '
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @UserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select '*Data saved successfully, UserID - ' + @UserID
End
GO
/****** Object:  StoredProcedure [dbo].[MstUserLogIN_Delete]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUserLogIN_Delete]
		(
		@UserID  varchar(12) = null
		)
As 
 
Begin
	Declare @intCntr as int
	Declare @CurDateTime as datetime
	Declare @intError as int
	DEclare @LogMsg as varchar(200)
	set @intCntr = 0
	BEGIN TRANSACTION
	--Delete User Log in after log out
	delete from UserLogIN 
	Where UserID = @UserID
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End 
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Logout User '
	set @CurDateTime = getdate()	
	Exec UserLog_Insert  @CurDateTime, @UserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select '*Data deleted successfully, UserID - ' + @UserID
End
GO
/****** Object:  StoredProcedure [dbo].[MstUserAccess_Update]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUserAccess_Update]
		(
		@UserID 	as varchar(12) ,
		@UserAccessRec   as ntext,
		@CompanyId 	as varchar(2),
		@BranchId 	as varchar(3),
		@LogUserId 	as varchar(12) 
		)
As 
 
Begin
   
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @intDoc as int
	
	Declare @intError as integer
	--Prepare input values as an XML documnet
	exec sp_xml_preparedocument @intDoc OUTPUT, @UserAccessRec
	-- Create Cursor from XML Table
	Declare curUserAccess Cursor For
		Select OptionID,  AccessTag, InsertTag, UpdateTag, DeleteTag
		from OPENXML (@intdoc, '/NewDataSet/MstUserAccess', 1)
		with (	OptionID 	varchar(12),
		        	AccessTag	varchar(1),
		        	InsertTag	varchar(1),
		        	UpdateTag	varchar(1),
		        	DeleteTag	varchar(1))
	-- Declare Variables for insert Detail Record 
	Declare	@OptionID 	varchar(12)
	Declare	@AccessTag	varchar(1)
	Declare	@InsertTag	varchar(1)
	Declare	@UpdateTag	varchar(1)
	Declare	@DeleteTag	varchar(1)
	
	BEGIN TRANSACTION
	-- open cursor, read values one by one row and insert into Detail Table
	open curUserAccess
	fetch next from curUserAccess into @OptionID, @AccessTag, @InsertTag, @UpdateTag, @DeleteTag
	While (@@Fetch_status <> - 1)
	Begin
		Update 	MstUserAccess
		Set	AccessTag = @AccessTag,
			InsertTag = @InsertTag,
			UpdateTag = @UpdateTag,
			DeleteTag = @DeleteTag
		Where	UserID = @UserID
		and  	OptionID = @OptionID
		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
		fetch next from curUserAccess into @OptionID, @AccessTag, @InsertTag, @UpdateTag, @DeleteTag
	end 
	-- close cursor
	close curUserAccess
	deallocate curUserAccess
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update User Access ' + @UserID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select '*Data Updated successfully'
   
END
GO
/****** Object:  StoredProcedure [dbo].[MstRights_Update]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/*

-- Author : Tridip -- 17/05/2007
<NewDataSet>
	<RightsDetail>
		<OptionID>0101</OptionID>
		<AccessTag>Y</AccessTag>
		<InsertTag>Y</InsertTag>
		<UpdateTag>Y</UpdateTag>
		<DeleteTag>Y</DeleteTag>
	</RightsDetail>
</NewDataSet>

*/


CREATE PROCEDURE [dbo].[MstRights_Update]
(
	@UserID	as varchar(12),
	@DetailXml	as NTEXT
)

As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	Declare @XMLFormat Int
	Declare @OptionID as Varchar(12)
	Declare @AccessTag  as varchar(1)
	Declare @UpdateTag  as varchar(1)
	Declare @InsertTag  as varchar(1)
	Declare @DeleteTag  as varchar(1)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	

	Select  @intCntr = count(*)
	from   	MstUser
	where   (UserID = @UserID)

	if @intcntr  <= 0
	begin
		select 'Error : Invalid user id'
		return
	end
	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select OptionID,AccessTag,UpdateTag,InsertTag,DeleteTag
	From Openxml (@XMLFormat, '/NewDataSet/RightsDetail', 2)
	With (
			OptionID Varchar(12),
			AccessTag Varchar(1),
			UpdateTag Varchar(1),
			InsertTag Varchar(1),
			DeleteTag Varchar(1)
	     )


	BEGIN TRANSACTION   


	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @OptionID,@AccessTag,@UpdateTag,@InsertTag,@DeleteTag

	While (@@Fetch_Status=0)
	Begin

		select  @intcntr = count(*)
		from   	MstOption
		where   (OptionID = @OptionID)

		if @intcntr  <= 0
		begin
				select 'Error : Invalid Option id'
			return
		end

		Update MstUserAccess 	
		Set AccessTag=@AccessTag,
		UpdateTag=@UpdateTag,
		InsertTag=@InsertTag,
		DeleteTag=@DeleteTag
		Where UserID=@UserID And OptionID=@OptionID

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @OptionID,@AccessTag,@UpdateTag,@InsertTag,@DeleteTag
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update MstUser Access' + @UserID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @UserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @UserID
  
 END
GO
/****** Object:  Table [dbo].[TrnProformaInvoiceHdr]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnProformaInvoiceHdr](
	[ProformaInvNo] [varchar](15) NOT NULL,
	[ProformaInvDate] [datetime] NOT NULL,
	[CustomerID] [varchar](10) NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[ConfirmationTag] [varchar](1) NOT NULL,
	[Remarks] [varchar](200) NULL,
	[ProductTotal] [decimal](18, 2) NOT NULL,
	[VatRate] [decimal](18, 2) NOT NULL,
	[VatAmt] [decimal](18, 2) NULL,
	[ProformaInvAmt] [decimal](18, 2) NOT NULL,
	[ProformaInvStatus] [varchar](3) NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnProformaInvoiceHdr] PRIMARY KEY CLUSTERED 
(
	[ProformaInvNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnProformaInvoiceHdr] ([ProformaInvNo], [ProformaInvDate], [CustomerID], [DeliveryDate], [ConfirmationTag], [Remarks], [ProductTotal], [VatRate], [VatAmt], [ProformaInvAmt], [ProformaInvStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000001', CAST(0x000099C200000000 AS DateTime), N'0100100001', CAST(0x000099C200000000 AS DateTime), N'0', N'', CAST(20.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'NUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnProformaInvoiceHdr] ([ProformaInvNo], [ProformaInvDate], [CustomerID], [DeliveryDate], [ConfirmationTag], [Remarks], [ProductTotal], [VatRate], [VatAmt], [ProformaInvAmt], [ProformaInvStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'0100100001', CAST(0x0000996E00000000 AS DateTime), N'0', N'zvzxvzxvzxv', CAST(2200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2200.00 AS Decimal(18, 2)), N'UTL', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnProformaInvoiceHdr] ([ProformaInvNo], [ProformaInvDate], [CustomerID], [DeliveryDate], [ConfirmationTag], [Remarks], [ProductTotal], [VatRate], [VatAmt], [ProformaInvAmt], [ProformaInvStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', CAST(0x0000996E00000000 AS DateTime), N'0100100001', CAST(0x0000996E00000000 AS DateTime), N'0', N'aaaaaaaaa', CAST(1120.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(33.60 AS Decimal(18, 2)), CAST(1153.60 AS Decimal(18, 2)), N'NUT', NULL, NULL, N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnStockTransferProduct_Select]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TrnStockTransferProduct_Select]
(
	@ProductID	VARCHAR(5000),
	@CompanyID	VARCHAR(2),
	@BranchID	VARCHAR(3)
	
)
AS
	Declare @SQL Varchar(5000)
	Set @SQL=
		'SELECT     TrnStockInDtl.ProductID ,MstProduct.ProductName, MstProduct.ProductUOM ,sum(isnull(TrnStockInDtl.StockINQty,0) - isnull(TrnStockInDtl.UtilQty,0) ) as StockINQty  
		FROM         MstProduct INNER JOIN
	        TrnStockInDtl ON MstProduct.ProductID = TrnStockInDtl.ProductID 
		WHERE TrnStockInDtl.productid in ('+@ProductID + ') and TrnStockInDtl.CompanyID='+@CompanyID+' and
		TrnStockInDtl.BranchID='+@BranchID+' and (TrnStockInDtl.stockinqty-TrnStockInDtl.utilqty)>0
		group by MstProduct.ProductName,TrnStockInDtl.ProductID,MstProduct.ProductUOM'
 

	Exec(@SQL)
GO
/****** Object:  StoredProcedure [dbo].[TrnProformaInvoice_Delete]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

Developed By		: Indranil Roy

*/


CREATE PROCEDURE [dbo].[TrnProformaInvoice_Delete]
(
	@PurchaseOrderNo	 	as varchar(15),
	@LogUserId    	 		as varchar(12)
)
As 
/*Begin

	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	BEGIN TRANSACTION   

	Delete  from  TrnPurchaseOrderDtl Where PurchaseOrderNo=@PurchaseOrderNo
	Delete   from  TrnPurchaseOrderHdr Where PurchaseOrderNo=@PurchaseOrderNo
	

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Purchase Order' + @PurchaseOrderNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully. '+@PurchaseOrderNo
  
 END*/
GO
/****** Object:  Table [dbo].[MstFilterCondition]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstFilterCondition](
	[FilterID] [int] NOT NULL,
	[FilterDesc] [varchar](100) NOT NULL,
	[FilterConditionWithMC] [varchar](100) NULL,
	[FilterConditionWithoutMC] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (1, N'Exact Match', N'= ''<FilterCondition>'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'= ''<FilterCondition>''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (2, N'Match Any', N'Like ''%<FilterCondition>%'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'Like ''%<FilterCondition>%''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (3, N'Start With', N'Like ''<FilterCondition>%'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'Like ''<FilterCondition>%''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (4, N'End With', N'Like ''%<FilterCondition>'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'Like ''%<FilterCondition>''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (5, N'Greather Than', N'> ''<FilterCondition>'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'> ''<FilterCondition>''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (6, N'Less Than', N'< ''<FilterCondition>'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'< ''<FilterCondition>''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (7, N'Greather Than Equal To', N'>= ''<FilterCondition>'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'>= ''<FilterCondition>''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (8, N'Less Than Equal To', N'<= ''<FilterCondition>'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'<= ''<FilterCondition>''')
INSERT [dbo].[MstFilterCondition] ([FilterID], [FilterDesc], [FilterConditionWithMC], [FilterConditionWithoutMC]) VALUES (9, N'Not Equal', N'<> ''<FilterCondition>'' COLLATE SQL_Latin1_General_CP1_CS_AS', N'<> ''<FilterCondition>''')
/****** Object:  Table [dbo].[MstCompany]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstCompany](
	[CompanyID] [varchar](2) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[URL] [varchar](40) NULL,
	[RegNo] [varchar](40) NULL,
	[PFNo] [varchar](40) NULL,
	[ESINo] [varchar](40) NULL,
	[PANNo] [varchar](40) NULL,
	[CSTNo] [varchar](40) NULL,
	[LSTNo] [varchar](40) NULL,
	[ServTaxRegNo] [varchar](40) NULL,
	[ServTaxCode] [varchar](40) NULL,
	[ProfTaxECN] [varchar](40) NULL,
	[ProfTaxRCN] [varchar](40) NULL,
	[ITTanNo] [varchar](40) NULL,
	[VATNo] [varchar](40) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstCompany] ([CompanyID], [CompanyName], [URL], [RegNo], [PFNo], [ESINo], [PANNo], [CSTNo], [LSTNo], [ServTaxRegNo], [ServTaxCode], [ProfTaxECN], [ProfTaxRCN], [ITTanNo], [VATNo]) VALUES (N'00', N'Inventryx Basic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MstCompany] ([CompanyID], [CompanyName], [URL], [RegNo], [PFNo], [ESINo], [PANNo], [CSTNo], [LSTNo], [ServTaxRegNo], [ServTaxCode], [ProfTaxECN], [ProfTaxRCN], [ITTanNo], [VATNo]) VALUES (N'01', N'NNK Eletric Pvt. Ltd.', N'www.nnkconsulting.com.com', N'', N'212365', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL)
/****** Object:  StoredProcedure [dbo].[AutoGenerateID]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE Procedure [dbo].[AutoGenerateID]
		(
		@TblName   varchar(50),
		@FldName   varchar(50),
		@FldWidth   int,
		@PrefixVal   varchar(20),
		@AutoID      varchar(30) Output
		)
AS
BEGIN
	declare @vFieldWidth   	varchar(6)
	declare @SQLString     	nvarchar(4000)
	declare @NewGenNo 	int
	declare @NewGenID      varchar(30)
	-- Build SQL String based on input table name and field name
	set @vFieldWidth = convert(varchar(6),@FldWidth)
	set @SQLString =  ' Declare curLastNo Cursor For '
	if @PrefixVal <> '' 
	begin
           		set @SQLString = @SQLString + 'Select max(convert(integer, substring(' + @FldName + ', len(''' + @PrefixVal +''') + 1  , ' + @vFieldWidth + ' -  len(''' + @PrefixVal + ''')))) + 1  As NewNo  '
		set @SQLString = @SQLString + ' from ' + @TblName + ' '
           		set @SQLString = @SQLString + ' Where substring('  + @FldName + ', 1, len(''' + @PrefixVal + ''')) = ''' + @PrefixVal + ''' '
	end
        	Else
	begin	
           		set @SQLString =  @SQLString + 'Select max(convert(integer, ' + @FldName + ')) + 1 AS NewNo from ' + @TblName + ' '
	end
	-- Execute SQL String	 
	exec (@SQLString) 
	-- Select New Number
	open curLastNo
	fetch next from curLastNo into @NewGenNo
	While (@@Fetch_status <> - 1)
	Begin
		fetch next from curLastNo into @NewGenNo
	end 
	close curLastNo
	deallocate curLastNo
	
	-- Set New Number
    	If IsNull(@newGenNo,0) = 0 
	begin	
           		set @NewGenID = @PrefixVal + Right('0000000001', @FldWidth - Len(@PrefixVal)) 
	end
        	Else
	begin            
		set @NewGenID = @PrefixVal + Right('0000000000' + ltrim(Str(@NewGenNo)), @FldWidth - Len(@PrefixVal)) 
	end
	select @AutoID = @NewGenID
END
GO
/****** Object:  Table [dbo].[MstState]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstState](
	[StateCode] [varchar](3) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MstState] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_MstState] UNIQUE NONCLUSTERED 
(
	[StateName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'002', N'Andaman & Nicobar Islands')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'003', N'Andhra Pradesh')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'001', N'Arunachal Pradesh')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'004', N'Assam')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'005', N'Bihar')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'006', N'Chandigarh')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'007', N'Chhatisgarh')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'008', N'Dadra & Nagar Haveli')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'009', N'Daman & Diu')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'010', N'Delhi')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'011', N'Goa')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'012', N'Gujarat')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'013', N'Haryana')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'014', N'Himachal Pradesh')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'015', N'Jammu & Kashmir ')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'016', N'Jharkhand')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'017', N'Karnataka')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'018', N'Kerala')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'019', N'Lakshadweep')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'020', N'Madhya Pradesh')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'021', N'Maharashtra')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'022', N'Manipur')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'023', N'Meghalaya')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'024', N'Mizoram')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'025', N'Nagaland')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'026', N'Orissa')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'027', N'Pondicherry')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'028', N'Punjab')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'029', N'Rajasthan')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'030', N'Sikkim')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'031', N'Tamil Nadu')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'032', N'Tripura')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'033', N'Uttar Pradesh')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'034', N'Uttaranchal')
INSERT [dbo].[MstState] ([StateCode], [StateName]) VALUES (N'035', N'West Bengal')
/****** Object:  Table [dbo].[MstUserType]    Script Date: 02/28/2018 23:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstUserType](
	[UserTypeID] [varchar](1) NOT NULL,
	[UserTypeName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_MstUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstUserType] ([UserTypeID], [UserTypeName]) VALUES (N'A', N'Administrator')
INSERT [dbo].[MstUserType] ([UserTypeID], [UserTypeName]) VALUES (N'N', N'Non Administrator')
INSERT [dbo].[MstUserType] ([UserTypeID], [UserTypeName]) VALUES (N'S', N'Sub Administrator')
/****** Object:  View [dbo].[vw_UserSelect]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserSelect]
AS
SELECT     dbo.MstUser.UserID, dbo.MstUser.UserName, dbo.MstUserType.UserTypeName, dbo.MstUserType.UserTypeID, dbo.MstUser.UserPWD, 
                      dbo.MstUser.DisableTag, dbo.MstUser.CompanyID, dbo.MstUser.BranchID
FROM         dbo.MstUser INNER JOIN
                      dbo.MstUserType ON dbo.MstUser.UserTypeID = dbo.MstUserType.UserTypeID
GO
/****** Object:  StoredProcedure [dbo].[MstUserFrontEnd_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 16/04/2007
CREATE PROCEDURE [dbo].[MstUserFrontEnd_Select]
(
	@UserID	 as varchar(12)
)
As 
BEGIN

	SELECT  MstUserType.UserTypeName,MstUser.UserID,MstUser.UserName,MstUser.UserPWD, 
	MstUser.UserTypeID,MstUser.DisableTag,MstUser.CompanyID,MstUser.BranchID
	FROM  MstUser INNER JOIN
	MstUserType ON MstUser.UserTypeID = MstUserType.UserTypeID
	Where UserID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[MstUserForUserAccess_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUserForUserAccess_Select]
(
@UserTypeID as varchar(1) = null
)
As 
 
Begin
	if @UserTypeID = null or @UserTypeID = 'A'
	begin
		-- For Administrator select all type of user
		Select a.UserID, a.UserName, a.UserTypeID, b.UserTypeName
		From MstUser a, MstUserType b
		Where a.UserTypeID = b.UserTypeID
		and a.UserID <> 'SUPADMIN'	
		Order by UserID
	end
	else 
	begin
		-- For Sub-Administrator select only Not Administrator
		Select a.UserID, a.UserName, a.UserTypeID, b.UserTypeName
		From MstUser a, MstUserType b
		Where a.UserTypeID = b.UserTypeID
		and a.UserID <> 'SUPADMIN'	
		and a.UserTypeID IN ('N')
		Order by UserID
	end
	
 END
GO
/****** Object:  StoredProcedure [dbo].[MstUser_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUser_Update]
		(
		@UserID as varchar(12) ,
		@UserName as varchar(40),
		@UserPWD as varchar(200),
		@UserTypeID as varchar(1),
		@DisableTag as varchar(1),
		@CompanyId as varchar(2),
		@BranchId as varchar(3),
		@LogUserId as varchar(12) 
		)
As 
 
Begin
   
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Select Reference Key
	select  @intcntr = count(UserTypeID)
	from   MstUserType
	where   (UserTypeID=@UserTypeID)
	
	if @intcntr = 0
	begin
	        select 'Error : Invalid User Type'
	        return
	end
	BEGIN TRANSACTION
	-- Update User	
	Update MstUser 
	set 	UserName = @UserName,
		UserPWD  = @UserPWD,
		UserTypeID = @UserTypeID,
		DisableTag = @DisableTag
	where	UserID = @UserID
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update User ' + @UserID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select @UserID
   
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstUser_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUser_Select]
		(
		@UserID  varchar(12) = null
		)
As 
 
Begin
	-- Select All Users except Super Administrator
	Select a.UserID, a.UserName, a.UserPWD, a.UserTypeID, b.UserTypeName,a.DisableTag
	From MstUser a, MstUserType b 
	Where a.UserTypeID = b.UserTypeID
	and 	a.UserID <> 'SUPADMIN'	
	and	a.UserID like isnull(@UserID,'%')	
	Order by a.UserID
  
End
GO
/****** Object:  StoredProcedure [dbo].[MstUser_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUser_Insert] 
		(
		@UserID 	as varchar(12) ,
		@UserName 	as varchar(40),
		@UserPWD 	as varchar(200),
		@UserTypeID 	as varchar(1),
		@DisableTag 	as varchar(1),
		@CompanyId 	as varchar(2),
		@BranchId 	as varchar(3),
		@LogUserId 	as varchar(12) 
		)
As 
 
Begin
   
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key/Unique violation	
	select  @intcntr = count(UserID)
	from   MstUser
	where   (UserID=@UserID)
	
	if @intcntr > 0
	begin
	        select 'Error : UserID Already Exists'
	        return
	end
	set @intCntr = 0
	-- Select Reference Key
	select  @intcntr = count(UserTypeID)
	from   MstUserType
	where   (UserTypeID=@UserTypeID)
	
	if @intcntr = 0
	begin
	        select 'Error : Invalid User Type'
	        return
	end
	set @intCntr = 0
	BEGIN TRANSACTION
	-- Insert User
	insert into MstUser 
	(UserId, UserName, UserPWD, UserTypeID, DisableTag, CompanyID, BranchID)
	values 
	(@UserId, @UserName, @UserPWD, @UserTypeID, @DisableTag, @CompanyID, @BranchID)	
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert User ' + @UserID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[PagingQuery]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PagingQuery] (
@Tables varchar(1000),
@PK varchar(100),
@Sort varchar(200) = NULL,
@PageNumber int = 1,
@PageSize int = 10,
@Fields varchar(1000) = '*',
@Filter varchar(1000) = NULL,
@Group varchar(1000) = NULL,
@ColOrder  varchar(4)=NULL
)

AS

DECLARE @strPageSize varchar(50)
DECLARE @strSkippedRows varchar(50)
DECLARE @strFilter varchar(1000)
DECLARE @strSimpleFilter varchar(1000)
DECLARE @strGroup varchar(1000)

/*Default Sorting*/
IF @Sort IS NULL OR @Sort = ''
        
        IF @PK<>''
            BEGIN
                SET @Sort = @PK
                SET @Sort = ' ORDER BY ' + @Sort + ' '
            END
        ELSE
            BEGIN
                SET @Sort = ' '
            END
ELSE
    SET @Sort = '  ORDER BY  ' + @Sort + '  ' + @ColOrder


/*Default Page Number*/
IF @PageNumber < 1
    SET @PageNumber = 1

/*Set paging variables.*/
SET @strPageSize = CONVERT(varchar(50), @PageSize)
SET @strSkippedRows = CONVERT(varchar(50), @PageSize * (@PageNumber - 1))

/*Set filter & group variables.*/
IF @Filter IS NOT NULL AND @Filter != ''
    BEGIN
        SET @strFilter = ' WHERE ' + @Filter + ' '
        SET @strSimpleFilter = ' AND ' + @Filter + ' '
    END
ELSE
    BEGIN
        SET @strSimpleFilter = ''
        SET @strFilter = ''
    END
IF @Group IS NOT NULL AND @Group != ''
    SET @strGroup = ' GROUP BY ' + @Group + ' '
ELSE
    SET @strGroup = ''


PRINT @ColOrder
-- This sql returns row count
EXEC ('SELECT count(*)  as CustRowCount FROM  ' + @Tables + '  ' + @strFilter + '  ' + @strGroup )

IF @PageNumber = 1  -- In this case we can execute a more efficient query with no subqueries.
    EXEC (
        'SELECT TOP ' + @strPageSize + ' ' + @Fields + ' FROM ' + @Tables +
            @strFilter + @strGroup + @Sort
)
ELSE  -- Execute a structure of subqueries that brings the correct page.
    EXEC (
        'SELECT ' + @Fields + ' FROM ' + @Tables + '  WHERE ' + @PK + ' IN ' + '
            (SELECT TOP ' + @strPageSize + ' ' + @PK + ' FROM ' + @Tables +
            ' WHERE ' + @PK + ' NOT IN
                (SELECT TOP ' + @strSkippedRows + ' ' + @PK + ' FROM ' + @Tables +
                    @strFilter + @strGroup + @Sort + ') ' +
            @strSimpleFilter +
            @strGroup +
            @Sort + ') ' +
            @strGroup +
            @Sort
)
GO
/****** Object:  Table [dbo].[MstSearchField]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstSearchField](
	[SearchFieldID] [int] IDENTITY(1,1) NOT NULL,
	[SearchFieldName] [varchar](50) NULL,
	[searchFieldDataType] [varchar](10) NULL,
	[SearchFieldDesc] [varchar](50) NOT NULL,
	[SearchFormName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MstSearchField] PRIMARY KEY CLUSTERED 
(
	[SearchFieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MstSearchField] ON
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (1, N'StockPointID', N'string', N'Stock Point ID', N'StockPoint')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (2, N'StockPointName', N'string', N'Stock Point Name', N'StockPoint')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (3, N'StockPointType', N'string', N'Stock Point Type', N'StockPoint')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (4, N'SupplierID', N'string', N'Supplier ID', N'Supplier')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (5, N'SupplierName', N'string', N'Supplier Name', N'Supplier')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (6, N'MobileNo', N'string', N'Mobile No', N'Supplier')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (7, N'Email', N'string', N'Email', N'Supplier')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (8, N'VATRegNo', N'string', N'VAT Registration No.', N'Supplier')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (9, N'VATRegDate', N'date', N'VAT Registration Date', N'Supplier')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (10, N'PANNo', N'string', N'PAN No.', N'Supplier')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (11, N'ProductGroupID', N'string', N'Product Group ID', N'ProductGroup')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (12, N'ProductGroupName', N'string', N'Product Group Name', N'ProductGroup')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (13, N'CustomerID', N'string', N'Customer ID', N'Customer')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (14, N'CustomerName', N'string', N'Customer Name', N'Customer')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (15, N'MobileNo', N'string', N'Mobile No.', N'Customer')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (16, N'PhoneNo', N'string', N'Phone No.', N'Customer')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (17, N'DepartmentID', N'string', N'Department ID', N'Department')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (18, N'DepartmentName', N'string', N'Department Name', N'Department')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (19, N'LabourCategoryID', N'string', N'Labour Category ID', N'LabourCategory')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (20, N'LabourCategoryName', N'string', N'Labour Category Name', N'LabourCategory')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (21, N'HourlyRate', N'number', N'Hourly Rate', N'LabourCategory')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (22, N'PurchaseOrderNo', N'string', N'Purchase Order No.', N'PurchaseOrder')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (23, N'PurchaseOrderDate', N'date', N'Purchase Order Date', N'PurchaseOrder')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (24, N'Dateofdelivery', N'date', N'Date of Delivery', N'PurchaseOrder')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (25, N'SupplierName', N'string', N'Supplier Name', N'PurchaseOrder')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (26, N'DepartmentID', N'string', N'Department ID', N'PurchaseOrder')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (27, N'ServiceItemID', N'string', N'Service Item ID', N'ServiceItem')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (28, N'ServiceItemName', N'string', N'Service Item Name', N'ServiceItem')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (29, N'ProductID', N'string', N'Product ID', N'Product')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (30, N'ProductName', N'string', N'Product Name', N'Product')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (31, N'ProductGroupID', N'string', N'Product Group ID', N'Product')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (32, N'ProductSpec', N'string', N'Product Specification', N'Product')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (33, N'ProductRateID', N'string', N'Product Rate ID', N'ProductRate')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (34, N'ProductID', N'string', N'Product ID', N'ProductRate')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (35, N'EffectiveDate', N'date', N'EffectiveDate', N'ProductRate')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (36, N'UnitSaleRate', N'number', N'UnitSaleRate', N'ProductRate')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (37, N'SupplierRateID', N'string', N'Supplier Rate ID', N'SupplierRate')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (38, N'SupplierName', N'string', N'Supplier Name', N'SupplierRate')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (39, N'ProductName', N'string', N'Product Name', N'SupplierRate')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (40, N'UserID', N'string', N'UserID', N'UserList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (41, N'UserName', N'string', N'UserName', N'UserList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (42, N'UserTypeName', N'string', N'UserTypeName', N'UserList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (43, N'UserPWD', N'string', N'UserPWD', N'UserList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (44, N'BranchID', N'string', N'Branch ID', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (45, N'BranchName', N'string', N'Branch Name', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (46, N'CompanyName', N'string', N'Company Name', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (47, N'Addr', N'string', N'Branch Address', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (49, N'PhoneNo', N'string', N'Phone No', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (50, N'FaxNo', N'string', N'Fax No', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (51, N'Email', N'string', N'Email', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (52, N'HOTag', N'string', N'Head Office Tag', N'Branch')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (53, N'FinYearID', N'string', N'Finalcial Year ID', N'FinYearList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (54, N'StartDate', N'date', N'Start Date', N'FinYearList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (55, N'EndDate', N'date', N'End Date', N'FinYearList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (56, N'CompanyID', N'string', N'Company ID', N'Company')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (57, N'CompanyName', N'string', N'Company Name', N'Company')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (58, N'PANNo', N'string', N'PAN Number', N'Company')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (59, N'RegNo', N'string', N'Registration Number', N'Company')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (60, N'VATNo', N'string', N'Vat Number', N'Company')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (61, N'URL', N'string', N'URL', N'Company')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (62, N'ProformaInvNo', N'string', N'Proforma Invoice Number', N'ProformaInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (63, N'ProformaInvDate', N'date', N'Proforma Invoice Date', N'ProformaInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (64, N'DeliveryDate', N'date', N'Invoice Delivery Date', N'ProformaInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (65, N'Customer', N'string', N'Customer Name', N'ProformaInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (66, N'ProformaInvAmt', N'number', N'Proforma Invoice Amount', N'ProformaInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (67, N'GRNNo', N'string', N'GRN No', N'GoodsReceiptNoList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (68, N'GRNDate', N'date', N'GRN Date', N'GoodsReceiptNoList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (69, N'PurchaseOrderNo', N'string', N'Purchase Order No', N'GoodsReceiptNoList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (70, N'SupplierName', N'string', N'Supplier Name', N'GoodsReceiptNoList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (71, N'StockPointName', N'string', N'StockPoint Name', N'GoodsReceiptNoList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (72, N'GRNStatus', N'string', N'GRN Status', N'GoodsReceiptNoList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (73, N'PurchaseInvNo', N'string', N'Purchase Invoice Number', N'PurchaseInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (74, N'PurchaseInvDate', N'date', N'Purchase Invoice Date', N'PurchaseInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (75, N'PurchaseOrderNo', N'string', N'Purchase Order Number', N'PurchaseInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (76, N'SupplierName', N'string', N'Supplier Name', N'PurchaseInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (77, N'SupInvDate', N'date', N'Supplier Invoice Date', N'PurchaseInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (78, N'PurchaseInvStatus', N'string', N'Purchase Invoice Status', N'PurchaseInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (79, N'PurchaseInvAmt', N'number', N'Purchase Invoice Amount', N'PurchaseInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (80, N'ManufacturerID', N'string', N'Manufacturer ID', N'Manufacturer')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (81, N'ManufacturerName', N'string', N'Manufacturer Name', N'Manufacturer')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (82, N'JobNo', N'string', N'Job Number', N'JobDetails')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (83, N'JobStartDate', N'date', N'Job Start Date', N'JobDetails')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (84, N'CustomerName', N'string', N'Customer Name', N'JobDetails')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (85, N'JobStatus', N'string', N'Job Status', N'JobDetails')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (86, N'LabWorkTotal', N'number', N'Labour Work Total', N'JobDetails')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (87, N'DeliveryNoteNo', N'string', N'Delivery Note No', N'DeliveryNoteList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (88, N'DeliveryNoteDate', N'date', N'Delivery Note Date', N'DeliveryNoteList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (89, N'CustomerName', N'string', N'Customer Name', N'DeliveryNoteList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (90, N'ProformaInvNo', N'string', N'Proforma Invoice No', N'DeliveryNoteList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (91, N'DespatchMode', N'string', N'Despatch Mode', N'DeliveryNoteList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (92, N'DeliveryNoteStatus', N'string', N'Status', N'DeliveryNoteList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (93, N'InvoiceNo', N'string', N'Sales Invoice No', N'SalesInvoiceList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (94, N'InvoiceDate', N'date', N'Invoice Date', N'SalesInvoiceList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (95, N'CustomerName', N'string', N'Customer Name', N'SalesInvoiceList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (96, N'InvoiceStatus', N'string', N'Invoice Status', N'SalesInvoiceList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (97, N'DeliveryNoteNo', N'string', N'Delivery Note No', N'PurchaseReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (98, N'DeliveryNoteDate', N'date', N'Delivery Note Date', N'PurchaseReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (99, N'CustomerName', N'string', N'Customer Name', N'PurchaseReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (100, N'DespatchMode', N'string', N'Despatch Mode', N'PurchaseReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (101, N'InvoiceStatus', N'string', N'Status', N'PurchaseReturnList')
GO
print 'Processed 100 total records'
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (104, N'InvoiceNo', N'string', N'Invoice Number', N'ServiceInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (105, N'InvoiceDate', N'date', N'Invoice Date', N'ServiceInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (106, N'CustomerName', N'string', N'Customer Name', N'ServiceInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (107, N'ProductTotalAmt', N'numeric', N'Product Total Amount', N'ServiceInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (108, N'InvoiceStatus', N'string', N'Invoice Status', N'ServiceInvoice')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (109, N'SalRetNo', N'string', N'Sale Return No', N'SalesReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (110, N'SaleRetDate', N'date', N'Sale Return Date', N'SalesReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (111, N'StockPointName', N'string', N'Stock Point Name', N'SalesReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (112, N'InvoiceNo', N'string', N'Invoice No', N'SalesReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (113, N'CustomerName', N'string', N'Customer Name', N'SalesReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (114, N'SalRetStatus', N'string', N'Sale Return Status', N'SalesReturnList')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (115, N'StockAdjustmentNo', N'string', N'Stock Adjustment No', N'StockAdjustment')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (116, N'StockAdjustmentDate', N'datetime', N'Stock Adjustment Date', N'StockAdjustment')
INSERT [dbo].[MstSearchField] ([SearchFieldID], [SearchFieldName], [searchFieldDataType], [SearchFieldDesc], [SearchFormName]) VALUES (117, N'ProductName', N'string', N'Product Name', N'StockAdjustment')
SET IDENTITY_INSERT [dbo].[MstSearchField] OFF
/****** Object:  StoredProcedure [dbo].[MstMonth_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstMonth_Select]
		(
		@CompanyID 	as varchar(2) ,
		@BranchID 	as varchar(3) ,
		@FinYearID 	as varchar(4) = null
		)
As 
 
Begin
	-- Select Month List   
	SELECT  '01' as MonthID, 'January' as MonthName
	Union	
	SELECT  '02' as MonthID, 'February' as MonthName
	Union 
	SELECT  '03' as MonthID, 'March' as MonthName
	Union 
	SELECT  '04' as MonthID, 'April' as MonthName
	Union 
	SELECT  '05' as MonthID, 'May' as MonthName
	Union 
	SELECT  '06' as MonthID, 'June' as MonthName
	Union
	SELECT  '07' as MonthID, 'July' as MonthName
	Union	
	SELECT  '08' as MonthID, 'August' as MonthName
	Union 
	SELECT  '09' as MonthID, 'September' as MonthName
	Union 
	SELECT  '10' as MonthID, 'October' as MonthName
	Union 
	SELECT  '11' as MonthID, 'November' as MonthName
	Union 
	SELECT  '12' as MonthID, 'December' as MonthName
	Order by 1
  
END
GO
/****** Object:  StoredProcedure [dbo].[MstFrmCompany_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MstFrmCompany_Select]

As


	Select	CompanyID,CompanyName
	From	MstCompany
	where companyid not in ('00')
GO
/****** Object:  StoredProcedure [dbo].[MstLoginCompany_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 21/05/2007
CREATE PROCEDURE [dbo].[MstLoginCompany_Select]
as
BEGIN
	SELECT CompanyID,CompanyName from MstCompany
	Where CompanyID<>'00'
END
GO
/****** Object:  StoredProcedure [dbo].[MstUserTypeFrontEnd_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 11/05/2007
CREATE PROCEDURE [dbo].[MstUserTypeFrontEnd_Select]
as
BEGIN
	SELECT * from MstUserType
END
GO
/****** Object:  StoredProcedure [dbo].[MstUserType_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstUserType_Select]
As 
 
Begin
   
	Select UserTypeID, UserTypeName
	from MstUserType
	Order by UserTypeName
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstState_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstState_Select]
As 
 
BEGIN
	Select  	StateCode,  StateName
	From 	MstState
	Order by StateName
 END
GO
/****** Object:  Table [dbo].[MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstBranch](
	[BranchID] [varchar](3) NOT NULL,
	[BranchName] [varchar](50) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[Addr] [varchar](200) NULL,
	[PhoneNo] [varchar](50) NULL,
	[FaxNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ContactPerson] [varchar](50) NULL,
	[HOTag] [varchar](3) NOT NULL,
	[City] [varchar](50) NULL,
	[Pin] [varchar](15) NULL,
	[MobileNo] [varchar](50) NULL,
	[PersonDesignation] [varchar](50) NULL,
 CONSTRAINT [PK_MstBranch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstBranch] ([BranchID], [BranchName], [CompanyID], [Addr], [PhoneNo], [FaxNo], [Email], [ContactPerson], [HOTag], [City], [Pin], [MobileNo], [PersonDesignation]) VALUES (N'000', N'Inventryx', N'00', N'Indranil''s Address', N'', N'', N'', N'', N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[MstBranch] ([BranchID], [BranchName], [CompanyID], [Addr], [PhoneNo], [FaxNo], [Email], [ContactPerson], [HOTag], [City], [Pin], [MobileNo], [PersonDesignation]) VALUES (N'001', N'Head Office', N'01', N'LONDON,UK', N'700055', N'700055', N'indra_me@rediffmail.com', N'Mr.A. Ray', N'Y', N'Kolkata', N'', N'', N'Executive Director And M.D')
INSERT [dbo].[MstBranch] ([BranchID], [BranchName], [CompanyID], [Addr], [PhoneNo], [FaxNo], [Email], [ContactPerson], [HOTag], [City], [Pin], [MobileNo], [PersonDesignation]) VALUES (N'002', N'Kolkata', N'01', N'15 A anil roy road.', N'', N'', N'', N'shamik roy', N'N', N'kolkata', N'7000015', N'', N'')
/****** Object:  StoredProcedure [dbo].[MstUserProfileInfo_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip-- 9/04/2007
CREATE PROCEDURE [dbo].[MstUserProfileInfo_Select](@UserID  varchar(12) = null)
As 
 
Begin
	SELECT     MstUser.UserName, MstUser.UserTypeID, MstUser.CompanyID, MstUser.BranchID, MstBranch.BranchName, 
	                      MstCompany.CompanyName
	FROM         MstUser INNER JOIN
	                      MstCompany ON MstUser.CompanyID = MstCompany.CompanyID INNER JOIN
	                      MstBranch ON MstUser.BranchID = MstBranch.BranchID
	WHERE     (MstUser.UserID = @UserID) AND (MstUser.DisableTag = 'N')

End
GO
/****** Object:  StoredProcedure [dbo].[MstCompany_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from mstState where StateCode='035'
select * from mstCompany where companyid='01'
MstCompany_Update @CompanyID='01',
		  @CompanyName='NNK Eletric Pvt. Ltd',
		  @URL='www.nnkconsulting.com.com',
		  @Addr='LONDON,UK',
		  @BranchState='035',
		  @ContactPerson='',
		  @PhoneNo='',
		  @FaxNo='',
		  @Email='',
		  @RegNo='',
		  @PFNo='21',
		  @ESINo='',
		  @PANNo='',
		  @CSTNo='',
		  @LSTNo='',
		  @VATNo='',
		  @ServTaxRegNo='',
		  @ServTaxCode='',
		  @ProfTaxECN='',
		  @ProfTaxRCN='',
	



*/

-- Author : Samik Nandi -- 29/03/2006
CREATE Procedure [dbo].[MstCompany_Update]
		(
		@CompanyID 			varchar(2),
		@CompanyName 		varchar(50),
		@Addr 				varchar(150),
		@City				Varchar(50),
		@Pin				Varchar(15),
		@ContactPerson 		varchar(40),
		@PersonDesignation	Varchar(50),
		@PhoneNo  			varchar(50),
		@FaxNo  			varchar(50),
		@Email 				varchar(50),
		
		@ServTaxRegNo 		varchar(40),
		@ServTaxCode 		varchar(40),
		@ProfTaxECN 		varchar(40),
		@ProfTaxRCN 		varchar(40),
		@ITTanNo 			varchar(40), 
		@VATNo 				varchar(40),

		@RegNo 				varchar(40),
		@PFNo 				varchar(40),
		@ESINo 				varchar(40),
		@PANNo 				varchar(40),
		@CSTNo 				varchar(40),
		@LSTNo 				varchar(40),
		@URL				varchar(50),

		@LogUserId 			varchar(12)
		)
As 
 
BEGIN
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	BEGIN TRANSACTION
	-- Update Company Details	
	Update MstCompany   
	Set CompanyName = @CompanyName,     
		URL = @URL,   
		RegNo = @RegNo,
		PFNo = @PFNo,   
		ESINo = @ESINo,   
		PANNo = @PANNo,  
		CSTNo = @CSTNo,   
		LSTNo = @LSTNo,
		ServTaxRegNo = @ServTaxRegNo,   
		ServTaxCode = @ServTaxCode,   
		ProfTaxECN = @ProfTaxECN,   
		ProfTaxRCN = @ProfTaxRCN,   
		ITTanNo = @ITTanNo,
		VATNo=@VATNo
	Where   CompanyId = @CompanyId	
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Update HeadOffice Details
	Update	MstBranch
	Set	Addr = @Addr,    
		PhoneNo = @PhoneNo,   
		FaxNo = @FaxNo,
		EMail = @EMail,
		City=@City,
		Pin=@Pin,
		PersonDesignation=@PersonDesignation,
		ContactPerson = @ContactPerson
	Where	HOTag = 'Y'
	and	CompanyID = @CompanyID
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	-- Inserting Values into Log Table
	Set @LogMsg= 'Update Company ' + @CompanyID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select @CompanyID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstCompany_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*

select * from mstCompany
select * from mstBranch
sp_help mstCompany
*/

-- Author : Samik Nandi -- 29/03/2006
CREATE Procedure [dbo].[MstCompany_Insert]

		@CompanyID 			varchar(2),
		@CompanyName 		varchar(50),
		@Addr 				varchar(150),
		@City				Varchar(50),
		@Pin				Varchar(15),
		@ContactPerson 		varchar(40),
		@PersonDesignation	Varchar(50),
		@PhoneNo  			varchar(50),
		@FaxNo  			varchar(50),
		@Email 				varchar(50),
		
		@ServTaxRegNo 		varchar(40),
		@ServTaxCode 		varchar(40),
		@ProfTaxECN 		varchar(40),
		@ProfTaxRCN 		varchar(40),
		@ITTanNo 			varchar(40), 
		@VATNo 				varchar(40),

		@RegNo 				varchar(40),
		@PFNo 				varchar(40),
		@ESINo 				varchar(40),
		@PANNo 				varchar(40),
		@CSTNo 				varchar(40),
		@LSTNo 				varchar(40),
		@URL				varchar(50),

		@LogUserId 			varchar(12)

As
 
BEGIN
	--Declare Variables
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @NewCompanyID as varchar(2)
	Declare @NewBranchID as varchar(3)
	Declare @NewServiceItemID as varchar(5)
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation
	select  @intcntr = count(CompanyId)
	from   MstCompany
	where   (CompanyName=@CompanyName)
	if @intcntr > 0
	begin
			select 'Company Already Exists'
	        return
	end
	-- Generating the New CompanyID, And Head office BranchID
	exec AutoGenerateID 'MstCompany' , 'CompanyID' , 2 ,  '' , @NewCompanyID output
	exec AutoGenerateID 'MstBranch' , 'BranchID' , 3 ,  '' , @NewBranchID output
	if isnull(@NewCompanyID , '') = ''
	begin
	        select 'Company ID is not generating'
	        return
	end
	if isnull(@NewBranchID ,'') = ''
	begin
	        select 'Head Office ID is not generating'
	        return
	end
	BEGIN TRANSACTION
	--Insert Company Details
	Insert into MstCompany
	(CompanyId,CompanyName,URL,RegNo,PFNo,ESINo,PANNo,CSTNo,LSTNo,VATNo,ServTaxRegNo,ServTaxCode,ProfTaxECN,ProfTaxRCN,ITTanNo)
	Values
	(@NewCompanyID,@CompanyName,@URL,@RegNo,@PFNo,@ESINo,@PANNo,@CSTNo,@LSTNo,@VATNo,@ServTaxRegNo,@ServTaxCode,@ProfTaxECN,@ProfTaxRCN,@ITTanNo)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Insert Company Head Office Details
	Insert into MstBranch
	(BranchID, BranchName,CompanyID,Addr,PhoneNo,FaxNo,Email,ContactPerson,HOTag,City,Pin,PersonDesignation)
	Values
	(@NewBranchID,'Head Office',@NewCompanyID,@Addr,@PhoneNo,@FaxNo,@Email,@ContactPerson,'Y',@City,@Pin,@PersonDesignation)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	
	-- inserting Values into Service Item Master
	exec AutoGenerateID 'MstServiceItemMaster' , 'ServiceItemID' , 5 ,  '' , @NewServiceItemID output
	DECLARE @ServiceItemID	varchar(10)
	SET @ServiceItemID=@NewCompanyID+@NewBranchID+@NewServiceItemID
	INSERT INTO MstServiceItemMaster (ServiceItemID,ServiceItemName,CompanyID,BranchID,ServiceType)
	VALUES  (@ServiceItemID,'Labour Work Charges',@NewCompanyID,@NewBranchID,'LWC')
	
	exec AutoGenerateID 'MstServiceItemMaster' , 'ServiceItemID' , 5 ,  '' , @NewServiceItemID output
	SET @ServiceItemID=@NewCompanyID+@NewBranchID+@NewServiceItemID
	INSERT INTO MstServiceItemMaster (ServiceItemID,ServiceItemName,CompanyID,BranchID,ServiceType)
	VALUES  (@NewServiceItemID,'Material Consumption',@NewCompanyID,@NewBranchID,'MCC')
													

	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Company ' + @NewCompanyID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select @NewCompanyID
END
GO
/****** Object:  StoredProcedure [dbo].[MstCompany_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE Procedure [dbo].[MstCompany_Delete]
		(	  
		@CompanyId varchar(2),
		@LogUserId as varchar(12) 
		)
As 
 
BEGIN
	-- Declare Variavles
	Declare @logMsg 	as Varchar(200)
	Declare @curDateTime 	as datetime
	Declare @intError 	as integer
	
    	BEGIN TRANSACTION
	
	-- Delete Records (Related Branch)
	Delete from  MstBranch   
	Where   CompanyID = @CompanyID	
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Delete Records (Company)	
	Delete from  MstCompany   
	Where   CompanyID = @CompanyID			
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Delete Company ' + @CompanyID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	
	select '*Data Deleted successfully'-- + @CompanyID
END
GO
/****** Object:  StoredProcedure [dbo].[MstBranch_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


select * from mstcompany where companyid='01'

select * from mstBranch
select * from mstState
select * from mstCompany

select  count(CompanyID)
from    MstCompany
where   CompanyID  ='01'

objArr.Add(this.txtBranchID.Text.Trim());
objArr.Add(this.txtBranchName.Text.Trim());
objArr.Add(this.ddCompany.SelectedValue.Trim());
objArr.Add(this.txtBranchAddress.Text.Trim());
objArr.Add(this.txtCity.Text.Trim());
objArr.Add(this.txtPin.Text.Trim());
objArr.Add(this.txtContactPerson.Text.Trim());
objArr.Add(this.txtPersonDesignation.Text.Trim());
objArr.Add(this.txtMobileNo.Text.Trim());
objArr.Add(this.txtPhoneNo.Text.Trim());
objArr.Add(this.txtFaxNo.Text.Trim());
objArr.Add(this.txtEmail.Text.Trim());
*/


-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstBranch_Update]
(
		@BranchID 			as varchar(3), 
		@BranchName			as varchar(50),
		@CompanyID 			as varchar(2), 
		@Addr  				as varchar(200), 
		@City				as Varchar(50),
		@Pin				as Varchar(15),
		@ContactPerson		as Varchar(50),
		@PersonDesignation	as Varchar(50),
		@MobileNo			as Varchar(50),
		@PhoneNo  			as varchar(50) , 
		@FaxNo  			as varchar(50)  , 
		@Email  			as varchar(50)  ,  
		
		@LogUserId 			as varchar(12)
)
As
 
Begin
   
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Relation key
	select  @intcntr = count(CompanyID)
	from	MstCompany
	where   ( CompanyID  = @CompanyID )
	
	if @intcntr = 0
	begin
	        select 'Invalid Company'
	        return
	end
	
	BEGIN TRANSACTION
	--Update Branch
	update 	MstBranch
	set	BranchName = @BranchName,
		CompanyID = @CompanyID,
		Addr = @Addr,
		PhoneNo = @PhoneNo,
		FaxNo = @FaxNo,
		Email = @Email,
		ContactPerson = @ContactPerson,
		PersonDesignation=@PersonDesignation,
		City=@City,
		Pin=@Pin,
		MobileNo=@MobileNo
	Where	BranchID = @BranchID		
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End 
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update Branch ' + @BranchID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	--select '*Data Updated successfully, Branch ID - ' + @BranchID
	Select @BranchID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstBranch_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from mstBranch

MstBranch_Insert 

	@BranchID='', 
	@BranchName='m',
	@CompanyID='01', 
	@Addr='', 
	@BranchState='', 
	@PhoneNo='', 
	@FaxNo='', 
	@Email='',  
	@ContactPerson='m', 
	@HOTag='Y',
	@LogUserId='tridip'

*/

-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstBranch_Insert] 
	(
		@BranchID 			as varchar(3), 
		@BranchName			as varchar(50),
		@CompanyID 			as varchar(2), 
		@Addr  				as varchar(200), 
		@City				as Varchar(50),
		@Pin				as Varchar(15),
		@ContactPerson		as Varchar(50),
		@PersonDesignation	as Varchar(50),
		@MobileNo			as Varchar(50),
		@PhoneNo  			as varchar(50) , 
		@FaxNo  			as varchar(50)  , 
		@Email  			as varchar(50)  ,  
		
		@LogUserId 			as varchar(12)
	)
As

Begin
   
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @NewBranchID as varchar(3) 
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(BranchID)    
	from   MstBranch
	where   ( CompanyID  = @CompanyID  and  BranchName = @BranchName  )


	
	
	if @intcntr > 0
	begin
	        select 'Branch Already Exists' 
	        return
	end

	-- Checking the Relation key
	set @intCntr = 0
	select  @intcntr = count(CompanyID)    
	from   MstCompany
	where   ( CompanyID  = @CompanyID )
	
	--print @intcntr

	if @intcntr = 0
	begin
	        select 'Invalid Company' 
	        return
	end
	-- Auto Generate New Branch ID
	exec  AutoGenerateID 'MstBranch' , 'BranchID' , 3 , '' , @NewBranchID output
	if isnull(@NewBranchID , '') = ''
	begin
	        select 'Branch ID is not generating'             
	        return
	end
	

	BEGIN TRANSACTION
	
	-- Insert New Branch
	Insert into MstBranch
	(BranchID,CompanyID,BranchName,Addr,PhoneNo,FaxNo,Email,ContactPerson,HOTag,City,Pin,MobileNo,PersonDesignation)
	values
	(@NewBranchID,@CompanyID,@BranchName,@Addr,@PhoneNo,@FaxNo,@Email,@ContactPerson,'N',@City,@Pin,@MobileNo,@PersonDesignation)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Branch ' + @NewBranchID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION

	--select '*Data saved successfully, BranchID - ' + @NewBranchID
	Select @NewBranchID
 END
GO
/****** Object:  StoredProcedure [dbo].[MstBranch_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
/*

select * from mstBranch

delete from mstBranch where branchid='001'

sp_help mstBranch

MstBranch_Delete @BranchId='000',@LogUserId='tridip'

*/

CREATE PROCEDURE [dbo].[MstBranch_Delete]

	@BranchId varchar(3),
	@LogUserId as varchar(12)

As

BEGIN
	Declare @logMsg as Varchar(200)
	Declare @curDateTime as datetime
	--Declare @intError as integer

    BEGIN TRANSACTION
		-- Delete Branch
		Delete from MstBranch
		Where BranchID = @BranchID

		--select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return @intError End

		-- Inserting Values into Log Table
		Set @LogMsg= 'Delete Branch ' + @BranchID
		Set @CurDateTime = getdate()
		Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
		--select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
		If @@Error<>0
		Begin
			Rollback Transaction T
			Return @@Error
		End
	COMMIT TRANSACTION
		
	select '*Data Deleted successfully'
  
 END
GO
/****** Object:  StoredProcedure [dbo].[TrnProformaInvoice_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from TrnProformaInvoiceHdr
*/


CREATE procedure [dbo].[TrnProformaInvoice_Cancel]

	@ProformaInvNo				Varchar(15),
	@CancelDate					Varchar(10),
	@CancelReason				Varchar(200),
	@CompanyID					Varchar(2),
	@BranchID					Varchar(3),
	@FinYearID					Varchar(4)


As

	Begin Transaction T
		
		Update		TrnProformaInvoiceHdr
		Set			CancelDate=Convert(DateTime,@CancelDate,103),
					CancelReason=@CancelReason,
					ProformaInvStatus='CAN'
		Where		ProformaInvNo=@ProformaInvNo
		And			CompanyID=@CompanyID
		And			BranchID=@BranchID
		And			FinYearID=@FinYearID

	If @@Error <> 0
	Begin
		Rollback Transaction T
	End
	Else
	Begin
			Commit Transaction T
	End

	Select @ProformaInvNo
GO
/****** Object:  StoredProcedure [dbo].[TrnProformaInvNo_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tridip Bhattacharjee  
CREATE procedure [dbo].[TrnProformaInvNo_Select]  
(
	@CompanyID varchar(2),
	@BranchID varchar(3),
	@FinYearID varchar(4)
)
As  
  
 Begin  
  Select ProformaInvNo From TrnProformaInvoiceHdr Where ProformaInvStatus in ('NUT','PUT')  
  and CompanyID=@CompanyID and BranchID=@BranchID and FinYearID=@FinYearID
 End
GO
/****** Object:  StoredProcedure [dbo].[SelectSearchingTables_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from MstSearchField
*/

CREATE procedure [dbo].[SelectSearchingTables_Select]

	@Condition Varchar(2),
	@PageName Varchar(20)

As



	If @Condition='SF'
		Select	SearchFieldID,SearchFieldDesc 
		From	MstSearchField
		Where	SearchFormName=@PageName
	Else
		Select FilterID,FilterDesc From MstFilterCondition
GO
/****** Object:  StoredProcedure [dbo].[SearchWithXML_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


*/

CREATE procedure [dbo].[SearchWithXML_Select]
(
	@XMLFormatAsString NText,
	@FormName Varchar(30) = null
)
As

	Declare 	@XMLFormat Int
	Declare 	@SearchFieldID Varchar(50)
	Declare	@FilterConditionID Varchar(50)
	Declare	@ConditionData Varchar(50)
	Declare	@MatchCase Varchar(1)

	Declare 	@FieldName Varchar(100)
	Declare 	@FieldDataType Varchar(10)
	--Declare 	@ConditionDataDate datetime
	Declare	@ConditionExpressionWithMC Varchar(100)
	Declare	@ConditionExpressionWithoutMC Varchar(100)	

	Declare 	@WhereClauseExpression Varchar(2000)
	Declare 	@Where Varchar(6)
	Declare 	@Count Int

	Set @FieldName=''
	Set @ConditionExpressionWithMC=''
	Set @ConditionExpressionWithoutMC=''
	Set @Where='Where '
	Set @Count=0

	--Prepare input values as an XML documnet
	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @XMLFormatAsString

	-- Create Cursor from XML Table

	Declare SearchXML
	Cursor For
	Select SearchField,FilterCondition,ConditionData,MatchCase
	From Openxml (@XMLFormat, '/NewDataSet/Search', 2)
	With 
		(
			SearchField Varchar(50),
			FilterCondition Varchar(50),
			ConditionData Varchar(50),
			MatchCase Varchar(1)
		)

	-- open cursor, read values one by one row and insert into Detail Table

	Set @WhereClauseExpression=''
	Open SearchXML
	Fetch Next From SearchXML Into @SearchFieldID,@FilterConditionID,@ConditionData,@MatchCase

	While (@@Fetch_Status=0)
		Begin
			
			Select	@FieldName=SearchFieldName,@FieldDataType=SearchFieldDataType
			From	MstSearchField
			Where	SearchFieldID=@SearchFieldID
		
			IF @FieldDataType = 'date'
			Begin

				IF ISDate(@ConditionData)=1
				Begin
					Set @FieldName = 'Convert(varchar,' + @FieldName + ',112)'
					Set @ConditionData= Convert(varchar,Convert(datetime,@ConditionData,103),112)

					Select	@ConditionExpressionWithMC=Replace(FilterConditionWithMC, '<FilterCondition>',@ConditionData),
						@ConditionExpressionWithoutMC=Replace(FilterConditionWithoutMC, '<FilterCondition>',@ConditionData)
					From	MstFilterCondition
					Where	FilterID=@FilterConditionID
				End
				Else
				Begin
					Select 'Error : Invalid Date'
					Return
				End
			End
			Else
			Begin
				Select	@ConditionExpressionWithMC=Replace(FilterConditionWithMC, '<FilterCondition>',@ConditionData),
					@ConditionExpressionWithoutMC=Replace(FilterConditionWithoutMC, '<FilterCondition>',@ConditionData)
				From	MstFilterCondition
				Where	FilterID=@FilterConditionID
			End
	
			If @Count=1
			Begin
				Set @Where=''
			End
		
			If @MatchCase=1
			Begin
				Set @WhereClauseExpression=@Where+@WhereClauseExpression+@FieldName+' '+@ConditionExpressionWithMC+' '+' And '
			End
			Else
			Begin
				Set @WhereClauseExpression=@Where+@WhereClauseExpression+@FieldName+' '+@ConditionExpressionWithoutMC+' '+' And '
			End
			
			Fetch Next From SearchXML Into @SearchFieldID,@FilterConditionID,@ConditionData,@MatchCase

			Set @Count=@Count+1
		End
	

	Set @WhereClauseExpression=@WhereClauseExpression+'1=1'

	Select @WhereClauseExpression

	Close SearchXML
	Deallocate SearchXML
GO
/****** Object:  Table [dbo].[TrnProformaInvoiceDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnProformaInvoiceDtl](
	[ProformaInvDtlID] [varchar](18) NOT NULL,
	[ProformaInvNo] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[ProductRate] [decimal](18, 2) NOT NULL,
	[ProductQty] [decimal](18, 3) NOT NULL,
	[ProductAmt] [decimal](18, 2) NOT NULL,
	[UtilQty] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnProformaInvoiceDtl] PRIMARY KEY CLUSTERED 
(
	[ProformaInvDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnProformaInvoiceDtl] UNIQUE NONCLUSTERED 
(
	[ProformaInvNo] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnProformaInvoiceDtl] ([ProformaInvDtlID], [ProformaInvNo], [ProductID], [ProductRate], [ProductQty], [ProductAmt], [UtilQty]) VALUES (N'010010607000001001', N'010010607000001', N'0100100002', CAST(2.00 AS Decimal(18, 2)), CAST(5.000 AS Decimal(18, 3)), CAST(10.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnProformaInvoiceDtl] ([ProformaInvDtlID], [ProformaInvNo], [ProductID], [ProductRate], [ProductQty], [ProductAmt], [UtilQty]) VALUES (N'010010607000001002', N'010010607000001', N'0100100003', CAST(2.00 AS Decimal(18, 2)), CAST(5.000 AS Decimal(18, 3)), CAST(10.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnProformaInvoiceDtl] ([ProformaInvDtlID], [ProformaInvNo], [ProductID], [ProductRate], [ProductQty], [ProductAmt], [UtilQty]) VALUES (N'010017777000001001', N'010017777000001', N'0100100004', CAST(1100.00 AS Decimal(18, 2)), CAST(2.000 AS Decimal(18, 3)), CAST(2200.00 AS Decimal(18, 2)), CAST(2.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnProformaInvoiceDtl] ([ProformaInvDtlID], [ProformaInvNo], [ProductID], [ProductRate], [ProductQty], [ProductAmt], [UtilQty]) VALUES (N'010017777000002001', N'010017777000002', N'0100100004', CAST(1120.00 AS Decimal(18, 2)), CAST(1.000 AS Decimal(18, 3)), CAST(1120.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
/****** Object:  View [dbo].[vw_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MstCompany]
AS
SELECT     dbo.MstCompany.CompanyID, dbo.MstCompany.CompanyName, dbo.MstCompany.PANNo, dbo.MstCompany.RegNo, dbo.MstCompany.VATNo, 
                      dbo.MstCompany.URL
FROM         dbo.MstCompany INNER JOIN
                      dbo.MstBranch ON dbo.MstCompany.CompanyID = dbo.MstBranch.CompanyID AND dbo.MstBranch.HOTag = 'Y'
WHERE     (dbo.MstCompany.CompanyID <> '00')
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
         Begin Table = "MstCompany"
            Begin Extent = 
               Top = 10
               Left = 362
               Bottom = 118
               Right = 514
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "MstBranch"
            Begin Extent = 
               Top = 96
               Left = 132
               Bottom = 204
               Right = 301
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 2025
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MstCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MstCompany'
GO
/****** Object:  View [dbo].[vw_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MstBranch]
AS
SELECT     dbo.MstBranch.BranchID, dbo.MstBranch.BranchName, dbo.MstCompany.CompanyName, dbo.MstBranch.Addr, dbo.MstBranch.PhoneNo, 
                      dbo.MstBranch.FaxNo, dbo.MstBranch.Email, dbo.MstBranch.ContactPerson, dbo.MstBranch.HOTag, dbo.MstBranch.City, dbo.MstBranch.Pin, 
                      dbo.MstBranch.MobileNo, dbo.MstBranch.PersonDesignation
FROM         dbo.MstBranch INNER JOIN
                      dbo.MstCompany ON dbo.MstBranch.CompanyID = dbo.MstCompany.CompanyID AND dbo.MstBranch.BranchID <> '000'
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
         Begin Table = "MstBranch"
            Begin Extent = 
               Top = 20
               Left = 388
               Bottom = 128
               Right = 539
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MstCompany"
            Begin Extent = 
               Top = 106
               Left = 635
               Bottom = 214
               Right = 787
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MstBranch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MstBranch'
GO
/****** Object:  Table [dbo].[MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstFinYear](
	[FinYearID] [varchar](4) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstFinYear] PRIMARY KEY CLUSTERED 
(
	[FinYearID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstFinYear] ([FinYearID], [StartDate], [EndDate], [CompanyID], [BranchID]) VALUES (N'0607', CAST(0x0000979600000000 AS DateTime), CAST(0x0000990200000000 AS DateTime), N'00', N'000')
INSERT [dbo].[MstFinYear] ([FinYearID], [StartDate], [EndDate], [CompanyID], [BranchID]) VALUES (N'1478', CAST(0x0000962900000000 AS DateTime), CAST(0x0000979500000000 AS DateTime), N'01', N'001')
INSERT [dbo].[MstFinYear] ([FinYearID], [StartDate], [EndDate], [CompanyID], [BranchID]) VALUES (N'7777', CAST(0x0000990300000000 AS DateTime), CAST(0x00009A7000000000 AS DateTime), N'00', N'000')
/****** Object:  StoredProcedure [dbo].[MstFinYear_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstFinYear_Update]
		(
		@FinYearId as varchar(4),
		@StartDate as datetime,
		@EndDate as datetime,
		@CompanyId as varchar(2),
		@BranchId as varchar(3),
		@LogUserId as varchar(12)
		)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	-- Setting Counter to zero
	set @intCntr = 0
	-- Checking the Primary key violation	

	select  	@intcntr = count(FinYearID)
	from   	MstFinYear
	where   	((StartDate between @StartDate and @EndDate)
	or       	(EndDate between @StartDate and @EndDate))
	and	FinYearID <> @FinYearId

	IF @intcntr > 0
	begin
	        select 'Error : Financial Year Date Range Already Exists'
	        return
	END

	BEGIN TRANSACTION   
	--Update Financial Year
	Update MstFinYear 
	Set	StartDate = @StartDate,
		endDate = @EndDate
	Where	FinYearID = @FinYearId
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update Financial Year ' + @FinYearID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select @FinYearId
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstFinYear_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstFinYear_Insert] 
(
	@FinYearId 	as varchar(4),
	@StartDate 	as datetime,
	@EndDate 	as datetime,
	@CompanyId 	as varchar(2),
	@BranchId 	as varchar(3),
	@LogUserId 	as varchar(12)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  	@intcntr = count(FinYearID)
	from   	MstFinYear
	where   (FinYearID = @FinYearId)

	IF @intcntr > 0
	begin
	        select 'Error : Financial Year ID Already Exists'
	        return
	end

	set @intCntr1 = 0
	select  	@intcntr = count(FinYearID)
	from   	MstFinYear
	where   	(StartDate between @StartDate and @EndDate)
	or       	(EndDate between @StartDate and @EndDate)

	IF @intcntr + @intCntr1 > 0
	begin
	        select 'Error : Financial Date Range Already Exists'
	        return
	end

	BEGIN TRANSACTION   
	
	-- Insert Financial Year
	Insert Into MstFinYear 
	(FinYearID, StartDate, EndDate, CompanyId, BranchId )  
	values	
	(@FinYearId, Convert(Datetime,@StartDate,103), Convert(Datetime,@EndDate,103), @CompanyID,@BranchID)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Financial Year ' + @FinYearID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select @FinYearID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstFinYear_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstFinYear_Delete] 
		(
		@FinYearID as varchar(4),
		@LogUserId as varchar(12)
		)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	BEGIN TRANSACTION   
	
	-- Delete Financial Year
	Delete from MstFinYear
	Where	FinYearID = @FinYearID
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Delete Financial Year ' + @FinYearID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully'
  
 END
GO
/****** Object:  Table [dbo].[MstDepartment]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstDepartment](
	[DepartmentID] [varchar](10) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstDepartment] ([DepartmentID], [DepartmentName], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Senior Labour', N'01', N'001')
INSERT [dbo].[MstDepartment] ([DepartmentID], [DepartmentName], [CompanyID], [BranchID]) VALUES (N'0100100002', N'Jumior Labour', N'01', N'001')
INSERT [dbo].[MstDepartment] ([DepartmentID], [DepartmentName], [CompanyID], [BranchID]) VALUES (N'0100100003', N'Sales', N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstDepartment_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstDepartment_Update] 
(
	@DepartmentID	 as varchar(10),
	@DepartmentName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	BEGIN TRANSACTION   

	Update MstDepartment 
	Set DepartmentName=@DepartmentName
	Where DepartmentID=@DepartmentID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Department Data' + @DepartmentID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @DepartmentID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstDepartment_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstDepartment_Insert] 
(
	@DepartmentID	 as varchar(10),
	@DepartmentName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewDepartmentID as varchar(10)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(DepartmentID)
	from   	MstDepartment
	where   (DepartmentID = @DepartmentID)

	if @intcntr  > 0
	begin
	        select 'Department Already Exists'
	        return
	end

	BEGIN TRANSACTION   


	-- Auto Generate New Department ID
	set @AutoGenPrefix = 	@CompanyId + @BranchId
	exec  AutoGenerateID 'MstDepartment' , 'DepartmentID' , 10 , @AutoGenPrefix , @NewDepartmentID output     

	Insert Into MstDepartment 
	(DepartmentID,DepartmentName,CompanyId,BranchId)  
	values	
	(@NewDepartmentID, @DepartmentName, @CompanyId, @BranchId)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Department Data' + @NewDepartmentID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewDepartmentID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstDepartment_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstDepartment_Delete] 
(
	@DepartmentID	 as varchar(10),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	BEGIN TRANSACTION   

	Delete from  MstDepartment 
	Where DepartmentID=@DepartmentID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Department Data' + @DepartmentID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully.'
  
 END
GO
/****** Object:  Table [dbo].[MstLabourCategory]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstLabourCategory](
	[LabourCategoryID] [varchar](10) NOT NULL,
	[LabourCategoryName] [varchar](50) NOT NULL,
	[HourlyRate] [decimal](18, 2) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstLabourCategory] PRIMARY KEY CLUSTERED 
(
	[LabourCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstLabourCategory] ([LabourCategoryID], [LabourCategoryName], [HourlyRate], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Labour 1', CAST(15.50 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstLabourCategory] ([LabourCategoryID], [LabourCategoryName], [HourlyRate], [CompanyID], [BranchID]) VALUES (N'0100100002', N'Labour 1', CAST(15.50 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstLabourCategory] ([LabourCategoryID], [LabourCategoryName], [HourlyRate], [CompanyID], [BranchID]) VALUES (N'0100100003', N'Labour 2', CAST(1000.52 AS Decimal(18, 2)), N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstLabourCategory_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstLabourCategory_Update] 
(
	@LabourCategoryID	 as varchar(10),
	@LabourCategoryName  as  varchar(50) = null,
	@HourlyRate		as decimal(18,2),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	BEGIN TRANSACTION   

	Update MstLabourCategory 
	Set LabourCategoryName=@LabourCategoryName,
	HourlyRate = @HourlyRate
	Where LabourCategoryID=@LabourCategoryID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Labour Category Data' + @LabourCategoryID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @LabourCategoryID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstLabourCategory_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstLabourCategory_Insert] 
(
	@LabourCategoryID	 as varchar(10),
	@LabourCategoryName  as  varchar(50) = null,
	@HourlyRate		as decimal(18,2), 		
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewLabourCategoryID as varchar(10)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(LabourCategoryID)
	from   	MstLabourCategory
	where   (LabourCategoryID = @LabourCategoryID)

	if @intcntr  > 0
	begin
	        select 'Labour Category Already Exists'
	        return
	end

	BEGIN TRANSACTION   


	-- Auto Generate New LabourCategory ID
	set @AutoGenPrefix = 	@CompanyId + @BranchId
	exec  AutoGenerateID 'MstLabourCategory' , 'LabourCategoryID' , 10 , @AutoGenPrefix , @NewLabourCategoryID output     

	Insert Into MstLabourCategory 
	(LabourCategoryID,LabourCategoryName,HourlyRate,CompanyId,BranchId)  
	values	
	(@NewLabourCategoryID, @LabourCategoryName,@HourlyRate, @CompanyId, @BranchId)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Labour Category Data' + @NewLabourCategoryID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewLabourCategoryID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstLabourCategory_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstLabourCategory_Delete] 

		@LabourCategoryID	 as varchar(10),
		@LogUserId    	 as varchar(12),
		@CompanyId  	 as varchar(2),
		@BranchId        as varchar(3)

As 
 
Begin
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	BEGIN TRANSACTION   

	Delete from  MstLabourCategory 
	Where LabourCategoryID=@LabourCategoryID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Labour Category Data' + @LabourCategoryID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully.'
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstHOBranch_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 21/05/2007
CREATE PROCEDURE [dbo].[MstHOBranch_Select]
(
	@CompanyID varchar(2)
)
As 
 
BEGIN
	Select BranchID from mstbranch where companyID=@CompanyID and HoTag='Y'
END
GO
/****** Object:  StoredProcedure [dbo].[MstBranch_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006

/*

MstBranch_Select '','001','V'

select * from mstState where statecode='035'

select * from mstBranch where BranchID='001'
*/

CREATE PROCEDURE [dbo].[MstBranch_Select]
		(
		@CompanyID	Varchar(2)='',
		@BranchID	Varchar(3) ='',
		@Mode		Varchar(1)=''
		)
As 
 

	If @Mode = ''
	Begin
		-- Select all Branchs except than Head office and system default Branch
		Select 	a.BranchID, a.BranchName, a.CompanyID,a.Addr,
				a.PhoneNo, a.FaxNo,a.ContactPerson, a.Email, a.HOTag,
				a.City,a.Pin,a.MobileNo,a.PersonDesignation
		from 	MstBranch a--, MstCompany b, MstState c
		Where	a.BranchID=@BranchID
	End
	Else
	Begin
		Select 	a.BranchID, a.BranchName, b.CompanyName,a.Addr,a.Addr,
				a.PhoneNo, a.FaxNo, a.ContactPerson, a.Email, a.HOTag,
				a.City,a.Pin,a.MobileNo,a.PersonDesignation
		from 	MstBranch a, MstCompany b
		Where	a.BranchID=@BranchID
		And		a.companyID = b.CompanyID
	End



	/*a.BranchID <> '000'
	and	a.companyID = b.CompanyID
	and	a.BranchState = c.StateCode
	and	a.HOTag = 'N'
	and	a.CompanyID like isnull(@CompanyID,'%')
	Order by a.BranchID*/
GO
/****** Object:  StoredProcedure [dbo].[MstCompany_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from mstCompany

select * from mstBranch

MstCompany_Select '02'

*/

-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstCompany_Select]
	@CompanyID		Varchar(10)=''

As 
 
BEGIN

	Select  	a.CompanyID,   a.CompanyName,a.URL, b.Addr,
				b.PhoneNo,   b.FaxNo, b.Email, b.ContactPerson,
				a.RegNo,   a.PFNo, a.ESINo,   a.PANNo,  a.CSTNo,   a.LSTNo,
				a.VATNo ,  a.ServTaxRegNo,   a.ServTaxCode,   a.ProfTaxECN,
				a.ProfTaxRCN,   a.ITTanNo,b.City,b.Pin,b.PersonDesignation
	From 		MstCompany a, MstBranch  b
	where 		a.CompanyID <> '00'
	And	a.CompanyID = b.CompanyID
	And	b.HOTag = 'Y' And a.CompanyID=@CompanyID
	Order by a.CompanyID
 END
GO
/****** Object:  Table [dbo].[MstCustomer]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstCustomer](
	[CustomerID] [varchar](10) NOT NULL,
	[CustomerName] [varchar](100) NOT NULL,
	[BillingAddress] [varchar](200) NULL,
	[BillingCity] [varchar](50) NULL,
	[BillingPin] [varchar](15) NULL,
	[PhoneNo] [varchar](50) NULL,
	[FaxNo] [varchar](50) NULL,
	[URL] [varchar](50) NULL,
	[ShippingAddress] [varchar](200) NULL,
	[ShippingCity] [varchar](50) NULL,
	[ShippingPin] [varchar](15) NULL,
	[ContactPerson] [varchar](50) NULL,
	[PersonDesignation] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PANNo] [varchar](50) NULL,
	[Remarks] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstCustomer] ([CustomerID], [CustomerName], [BillingAddress], [BillingCity], [BillingPin], [PhoneNo], [FaxNo], [URL], [ShippingAddress], [ShippingCity], [ShippingPin], [ContactPerson], [PersonDesignation], [MobileNo], [Email], [PANNo], [Remarks], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Tridip Bhattacharya', N'7/4 kualalumpur.', N'kolkata', N'7220154', N'22611365', N'55552654', N'', N'7/4 kualalumpur.', N'kolkata', N'7220154', N'shamik', N'', N'9836321012', N'', N'', N'', N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstCustomer_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
Created By		: Indranil Roy
Creation Date	: 20.04.2007
Alteration Date	: N/A
Altered By		: N/A

select * from mstcustomer

sp_help mstcustomer

********************************************************************************************/


CREATE procedure [dbo].[MstCustomer_Update]

		@CustomerID			Varchar(10),
		@CustomerName		Varchar(100),
		@BillingAddress		Varchar(200),
		@BillingCity		Varchar(50),
		@BillingPin			Varchar(50),
		@PhoneNo			Varchar(50),
		@MobileNo			Varchar(50),
		@FaxNo				Varchar(50),
		@URL				Varchar(50),
		@Email				Varchar(50),

		@ContactPerson		Varchar(50),
		@PersonDesignation	Varchar(50),
		@ShippingAddress	Varchar(200),
		@ShippingCity		Varchar(50),
		@ShippingPin		Varchar(50),
		@PANNo				Varchar(50),
		@Remarks			Varchar(50),
		

		@LogUserID    		Varchar(12),
		@CompanyID			Varchar(2),
		@BranchID			Varchar(3)

As

		Declare		@logMsg Varchar(200)
		Declare		@CurDatetime DateTime
		Declare		@dt DateTime


		If @CustomerID <> '' And @CustomerName <> ''
		Begin
			Begin Transaction T
		
			Update	mstCustomer
			Set		CustomerName=@CustomerName,
					BillingAddress=@BillingAddress,
					BillingCity=@BillingCity,
					BillingPin=@BillingPin,
					ShippingAddress=@ShippingAddress,
					ShippingCity=@ShippingCity,
					ShippingPin=@ShippingPin,
					PhoneNo=@PhoneNo,
					URL=@URL,
					FaxNo=@FaxNo,
					ContactPerson=@ContactPerson,
					PersonDesignation=@PersonDesignation,
					MobileNo=@MobileNo,
					Email=@Email,
					PANNo=@PANNo,
					Remarks=@Remarks
			Where	CustomerID=@CustomerID

			-- Inserting Values into Log Table
			Set @LogMsg= 'Modified Customer Data' + @CustomerID
			Set @CurDateTime = GetDate()
			Exec UserLog_Insert @CurDateTime, @LogUserID, @LogMsg
	
			If @@Error <> 0
			Begin
				Rollback Transaction T
				Return @@Error
			End
			
			Commit Transaction T
	
			--Select '*Data Updated Successfully.'
			Select @CustomerID
		End
GO
/****** Object:  StoredProcedure [dbo].[MstCustomer_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
Created By		: Indranil Roy
Creation Date	: 25.04.2007
Alteration Date	: N/A
Altered By		: N/A

select * from mstcustomer

********************************************************************************************/


CREATE PROCEDURE [dbo].[MstCustomer_Insert]

		@CustomerID			Varchar(10),
		@CustomerName		Varchar(100),
		@BillingAddress		Varchar(200),
		@BillingCity		Varchar(50),
		@BillingPin			Varchar(50),
		@PhoneNo			Varchar(50),
		@MobileNo			Varchar(50),
		@FaxNo				Varchar(50),
		@URL				Varchar(50),
		@Email				Varchar(50),

		@ContactPerson		Varchar(50),
		@PersonDesignation	Varchar(50),
		@ShippingAddress	Varchar(50),
		@ShippingCity		Varchar(50),
		@ShippingPin		Varchar(50),
		@PANNo				Varchar(50),
		@Remarks			Varchar(50),
		
		@LogUserId    		Varchar(12),
		@CompanyID			Varchar(2),
		@BranchID			Varchar(3)

As

	Declare @AutoGenPrefix varchar(5)
	Declare @NewCustomerID as varchar(10)
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as DateTime



	-- Auto Generate New Stock point ID
	Set @AutoGenPrefix = @CompanyId + @BranchId
	Exec AutoGenerateID 'MstCustomer' , 'CustomerID' , 10 , @AutoGenPrefix , @NewCustomerID output

	
	If @CustomerName <> ''
	Begin

		Begin Transaction T

		Insert Into
		mstCustomer(CustomerID,CustomerName,BillingAddress,BillingCity,BillingPin,ShippingAddress,ShippingCity,
		ShippingPin,PhoneNo,URL,FaxNo,ContactPerson,PersonDesignation,MobileNo,Email,PANNo,Remarks,CompanyID,BranchID)
		Values (@NewCustomerID,@CustomerName,@BillingAddress,@BillingCity,@BillingPin,@ShippingAddress,@ShippingCity,
		@ShippingPin,@PhoneNo,@URL,@FaxNo,@ContactPerson,@PersonDesignation,@MobileNo,@Email,@PANNo,@Remarks,@CompanyID,@BranchID)
				


		-- Inserting Values into Log Table
		Set @LogMsg= 'Insert Customer Data' + @NewCustomerID
		Set @CurDateTime = Getdate()
		Exec UserLog_Insert @CurDateTime, @LogUserID, @LogMsg

		If @@Error<>0
		Begin
			Rollback Transaction T
			Return @@Error
		End

		Commit Transaction T

		--Select '*Data Saved Successfully.'
		Select @NewCustomerID
	End
GO
/****** Object:  StoredProcedure [dbo].[MstCustomer_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************

Created By			: Indranil
Creation Date		: 25.04.2007
Alteration Date		: N/A
Altered By			: N/A


select * from mstcustomer

MstCustomer_Delete '0000000001','tridip','00','000'

delete from mstcustomer where customerid='0000000001'

*****************************************************************************************/

CREATE procedure [dbo].[MstCustomer_Delete]

		@CustomerID		Varchar(10),

		@LogUserId		Varchar(12),
		@CompanyId		Varchar(2),
		@BranchId		Varchar(3)

As

		Declare @logMsg  Varchar(200)
		Declare @CurDatetime DateTime
	

		If @CustomerID <> ''
		Begin
			Begin Transaction T
		
			Delete	From mstCustomer Where 
			CustomerID=@CustomerID
	
			-- Inserting Values into Log Table
			Set @LogMsg= 'Deleted Customer Data' + @CustomerID
			Set @CurDateTime = GetDate()
			Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg

			If @@Error=0
				Commit Transaction T
			Else
			Begin
				Rollback Transaction T
				Return @@Error
			End
			Select '*Data Deleted Successfully.'
		End
GO
/****** Object:  StoredProcedure [dbo].[MstBranchWithOutHO_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MstBranchWithOutHO_Select]
		(
		@CompanyID as varchar(2),
		@BranchID as varchar(3) =null
		)
As 
 
Begin
	-- Select all Branchs except than Head office and system default Branch
	Select 	BranchID, BranchName 
	from 	MstBranch 
	Where	HOTag <> 'Y'
	and	CompanyID like isnull(@CompanyID,CompanyID)
	Order by BranchName
  
END
GO
/****** Object:  StoredProcedure [dbo].[MstBranchWithHO_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstBranchWithHO_Select]
		(
		@CompanyID as varchar(2),
		@BranchID as varchar(3) =null
		)
As 
 
Begin
	-- Select all Branchs except than Head office and system default Branch
	Select 	a.BranchID, a.BranchName 
	from 	MstBranch a
	Where	a.BranchID <> '000'
	and	a.CompanyID like isnull(@CompanyID,'%')
	Order by a.BranchName
  
END
GO
/****** Object:  StoredProcedure [dbo].[MstBranchHO_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstBranchHO_Select]
		(
		@CompanyID as varchar(2),
		@BranchID as varchar(3) =null
		)
As 
 
Begin
	-- Select all Branchs except than Head office and system default Branch
	Select 	a.BranchID, a.BranchName 
	from 	MstBranch a
	Where	a.BranchID <> '000'
	and	a.CompanyID like isnull(@CompanyID,'%')
	and 	a.HOTag = 'Y'
	Order by a.BranchName
  
END
GO
/****** Object:  StoredProcedure [dbo].[MstBranchForLogin_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstBranchForLogin_Select]
As 
 
Begin
   
	Select 	BranchID, BranchName, CompanyID, HOTag, Addr, PhoneNo, FaxNo
	from 	MstBranch
	Where	BranchID <> '000'
	Order by BranchName
  
END
GO
/****** Object:  Table [dbo].[MstServiceItem]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstServiceItem](
	[ServiceItemID] [varchar](10) NOT NULL,
	[ServiceItemName] [varchar](50) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[ServiceType] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstServiceItem] PRIMARY KEY CLUSTERED 
(
	[ServiceItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_MstServiceItem] ON [dbo].[MstServiceItem] 
(
	[ServiceItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[MstServiceItem] ([ServiceItemID], [ServiceItemName], [CompanyID], [BranchID], [ServiceType]) VALUES (N'0100100001', N'LabourWork Charges', N'01', N'001', N'LWC')
INSERT [dbo].[MstServiceItem] ([ServiceItemID], [ServiceItemName], [CompanyID], [BranchID], [ServiceType]) VALUES (N'0100100002', N'Material Consumption', N'01', N'001', N'MCC')
INSERT [dbo].[MstServiceItem] ([ServiceItemID], [ServiceItemName], [CompanyID], [BranchID], [ServiceType]) VALUES (N'0100100003', N'Misc. Services', N'01', N'001', N'OTH')
/****** Object:  StoredProcedure [dbo].[MstServiceItem_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstServiceItem_Update] 
(
	@ServiceItemID	 as varchar(10),
	@ServiceItemName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	BEGIN TRANSACTION   

	Declare @ServiceType as varchar(3)

	select @ServiceType=ServiceType from MstServiceItem where ServiceItemID=@ServiceItemID

	if(@ServiceType='LWC' or @ServiceType='MCC')
		select 'ERROR : This record can''t be edited'
		return

	Update MstServiceItem 
	Set ServiceItemName=@ServiceItemName
	Where ServiceItemID=@ServiceItemID

	

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Service Item Data' + @ServiceItemID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @ServiceItemID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstServiceItem_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstServiceItem_Insert] 
(
	@ServiceItemID	 as varchar(10),
	@ServiceItemName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewServiceItemID as varchar(10)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(ServiceItemID)
	from   	MstServiceItem
	where   (ServiceItemID = @ServiceItemID)

	if @intcntr  > 0
	begin
	        select 'Service Item Already Exists'
	        return
	end

	BEGIN TRANSACTION   


	-- Auto Generate New ServiceItem ID
	set @AutoGenPrefix = 	@CompanyId + @BranchId
	exec  AutoGenerateID 'MstServiceItem' , 'ServiceItemID' , 10 , @AutoGenPrefix , @NewServiceItemID output     

	Insert Into MstServiceItem 
	(ServiceItemID,ServiceItemName,CompanyId,BranchId,ServiceType)  
	values	
	(@NewServiceItemID, @ServiceItemName, @CompanyId, @BranchId,'OTH')
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Service Item Data' + @NewServiceItemID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select  @NewServiceItemID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstServiceItem_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstServiceItem_Delete] 
(
	@ServiceItemID	 as varchar(10),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @ServiceType as varchar(3)

	BEGIN TRANSACTION   

	SELECT @ServiceType=ServiceType from MstServiceItem where 	ServiceItemID=@ServiceItemID

	IF(@ServiceType='LWC' or @ServiceType='MCC')
		select 'This record cann''t be deleted.'
		Return

	Delete from  MstServiceItem 
	Where ServiceItemID=@ServiceItemID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Service Item Data' + @ServiceItemID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully.'
  
 END
GO
/****** Object:  Table [dbo].[MstProductGroup]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstProductGroup](
	[ProductGroupID] [varchar](10) NOT NULL,
	[ProductGroupName] [varchar](50) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstProductGroup] PRIMARY KEY CLUSTERED 
(
	[ProductGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstProductGroup] ([ProductGroupID], [ProductGroupName], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Cable', N'01', N'001')
INSERT [dbo].[MstProductGroup] ([ProductGroupID], [ProductGroupName], [CompanyID], [BranchID]) VALUES (N'0100100002', N'Light-Fitings', N'01', N'001')
INSERT [dbo].[MstProductGroup] ([ProductGroupID], [ProductGroupName], [CompanyID], [BranchID]) VALUES (N'0100100003', N'Fan', N'01', N'001')
INSERT [dbo].[MstProductGroup] ([ProductGroupID], [ProductGroupName], [CompanyID], [BranchID]) VALUES (N'0100100004', N'Switch-Fittings', N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstProductGroup_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstProductGroup_Update] 
(
	@ProductGroupID	 as varchar(10),
	@ProductGroupName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	BEGIN TRANSACTION   

	Update MstProductGroup 
	Set ProductGroupName=@ProductGroupName
	Where ProductGroupID=@ProductGroupID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Product Group Data' + @ProductGroupID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @ProductGroupID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstProductGroup_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstProductGroup_Insert] 
(
	@ProductGroupID	 as varchar(10),
	@ProductGroupName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewProductGroupID as varchar(10)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(ProductGroupID)
	from   	MstProductGroup
	where   (ProductGroupID = @ProductGroupID)

	if @intcntr  > 0
	begin
	        select 'Product Group Already Exists'
	        return
	end

	BEGIN TRANSACTION   


	-- Auto Generate New Product Group ID
	set @AutoGenPrefix = 	@CompanyId + @BranchId
	exec  AutoGenerateID 'MstProductGroup' , 'ProductGroupID' , 10 , @AutoGenPrefix , @NewProductGroupID output     

	Insert Into MstProductGroup 
	(ProductGroupID,ProductGroupName,CompanyId,BranchId)  
	values	
	(@NewProductGroupID, @ProductGroupName, @CompanyId, @BranchId)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Product Group Data' + @NewProductGroupID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewProductGroupID
  
 END
GO
/****** Object:  Table [dbo].[MstManufacturer]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstManufacturer](
	[ManufacturerID] [varchar](10) NOT NULL,
	[ManufacturerName] [varchar](50) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstManufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstManufacturer] ([ManufacturerID], [ManufacturerName], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Britania', N'01', N'001')
INSERT [dbo].[MstManufacturer] ([ManufacturerID], [ManufacturerName], [CompanyID], [BranchID]) VALUES (N'0100100002', N'hdbhdgfd', N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstManufacturer_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Arnab -- 15/06/2007
CREATE PROCEDURE [dbo].[MstManufacturer_Update] 
(
	@ManufacturerID	 as varchar(10),
	@ManufacturerName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	BEGIN TRANSACTION   

	Update MstManufacturer
	Set ManufacturerName=@ManufacturerName,
	CompanyId=@CompanyId,
	BranchId=@BranchId
	Where ManufacturerID=@ManufacturerID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Manufacturer Data' + @ManufacturerID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @ManufacturerID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstManufacturer_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Arnab -- 14/06/2007
CREATE PROCEDURE [dbo].[MstManufacturer_Insert]
(
	@ManufacturerID	 as varchar(10),
	@ManufacturerName  as  varchar(50) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewManufacturerID as varchar(10)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(ManufacturerID)
	from   	MstManufacturer
	where   (ManufacturerID = @ManufacturerID)

	if @intcntr  > 0
	begin
	        select 'Manufacturer Already Exists'
	        return
	end

	BEGIN TRANSACTION   


	-- Auto Generate New Stock point ID
	set @AutoGenPrefix = 	@CompanyId + @BranchId
	exec  AutoGenerateID 'MstManufacturer' , 'ManufacturerID' , 10 , @AutoGenPrefix , @NewManufacturerID output     

	Insert Into MstManufacturer
	(ManufacturerID,ManufacturerName,CompanyId,BranchId)  
	values	
	(@NewManufacturerID, @ManufacturerName,@CompanyId, @BranchId)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Stock Point Data' + @NewManufacturerID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewManufacturerID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstManufacturer_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Arnab -- 15/06/2007
CREATE PROCEDURE [dbo].[MstManufacturer_Delete] 
(
	@ManufacturerID	 as varchar(10),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	BEGIN TRANSACTION   

	Delete from  MstManufacturer
	Where ManufacturerID=@ManufacturerID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Stock Point Data' + @ManufacturerID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully. '+@ManufacturerID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstLoadBranch_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 21/05/2007
CREATE PROCEDURE [dbo].[MstLoadBranch_Select]
(
	@CompanyID varchar(2)
)
as
BEGIN
	Select BranchID,BranchName from MstBranch
	Where CompanyID=@CompanyID
END
GO
/****** Object:  Table [dbo].[MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstStockPoint](
	[StockPointID] [varchar](10) NOT NULL,
	[StockPointName] [varchar](50) NOT NULL,
	[StockPointType] [varchar](1) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_mstStockPoint] PRIMARY KEY CLUSTERED 
(
	[StockPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock Point ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstStockPoint', @level2type=N'COLUMN',@level2name=N'StockPointID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock Point Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstStockPoint', @level2type=N'COLUMN',@level2name=N'StockPointName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock Point Type (W=Warehouse, V=Van)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MstStockPoint', @level2type=N'COLUMN',@level2name=N'StockPointType'
GO
INSERT [dbo].[MstStockPoint] ([StockPointID], [StockPointName], [StockPointType], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Haldia', N'W', N'01', N'001')
INSERT [dbo].[MstStockPoint] ([StockPointID], [StockPointName], [StockPointType], [CompanyID], [BranchID]) VALUES (N'0100100002', N'Kolkata', N'W', N'01', N'001')
INSERT [dbo].[MstStockPoint] ([StockPointID], [StockPointName], [StockPointType], [CompanyID], [BranchID]) VALUES (N'0100100003', N'Kasba', N'V', N'01', N'001')
INSERT [dbo].[MstStockPoint] ([StockPointID], [StockPointName], [StockPointType], [CompanyID], [BranchID]) VALUES (N'0100100004', N'Ranigunje', N'W', N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstStockPoint_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 16/04/2007
CREATE PROCEDURE [dbo].[MstStockPoint_Update] 
(
	@StockPointID	 as varchar(10),
	@StockPointName  as  varchar(50) = null,
	@StockPointType  as  varchar(1) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	BEGIN TRANSACTION   

	Update MstStockPoint 
	Set StockPointName=@StockPointName,
	StockPointType=@StockPointType,
	CompanyId=@CompanyId,
	BranchId=@BranchId
	Where StockPointID=@StockPointID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Stock Point Data' + @StockPointID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @StockPointID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstStockPoint_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 16/04/2007
CREATE PROCEDURE [dbo].[MstStockPoint_Insert]
(
	@StockPointID	 as varchar(10),
	@StockPointName  as  varchar(50) = null,
	@StockPointType  as  varchar(1) = null,
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewStockPointID as varchar(10)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(StockPointID)
	from   	MstStockPoint
	where   (StockPointID = @StockPointID)

	if @intcntr  > 0
	begin
	        select 'Stock Point Already Exists'
	        return
	end

	BEGIN TRANSACTION   


	-- Auto Generate New Stock point ID
	set @AutoGenPrefix = 	@CompanyId + @BranchId
	exec  AutoGenerateID 'MstStockPoint' , 'StockPointID' , 10 , @AutoGenPrefix , @NewStockPointID output     

	Insert Into MstStockPoint 
	(StockPointID,StockPointName,StockPointType,CompanyId,BranchId)  
	values	
	(@NewStockPointID, @StockPointName, @StockPointType, @CompanyId, @BranchId)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Stock Point Data' + @NewStockPointID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewStockPointID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstStockPoint_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 16/04/2007
CREATE PROCEDURE [dbo].[MstStockPoint_Delete] 
(
	@StockPointID	 as varchar(10),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	BEGIN TRANSACTION   

	Delete from  MstStockPoint 
	Where StockPointID=@StockPointID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Stock Point Data' + @StockPointID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully. '+@StockPointID
  
 END
GO
/****** Object:  Table [dbo].[MstSupplier]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstSupplier](
	[SupplierID] [varchar](10) NOT NULL,
	[SupplierName] [varchar](100) NOT NULL,
	[SupplierAddress] [varchar](200) NULL,
	[SupplierCity] [varchar](50) NULL,
	[SupplierPin] [varchar](15) NULL,
	[PhoneNo] [varchar](50) NULL,
	[URL] [varchar](50) NULL,
	[FaxNo] [varchar](50) NULL,
	[ContactPerson] [varchar](50) NULL,
	[PersonDesignation] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[VATRegNo] [varchar](50) NULL,
	[VATRegDate] [datetime] NULL,
	[PANNo] [varchar](50) NULL,
	[Remarks] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstSupplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstSupplier] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierCity], [SupplierPin], [PhoneNo], [URL], [FaxNo], [ContactPerson], [PersonDesignation], [MobileNo], [Email], [VATRegNo], [VATRegDate], [PANNo], [Remarks], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Arnab Dutta', N'19/9 chatterjee hat.', N'howrah', N'700005', N'88965321', N'www.arnabd.com', N'7785412', N'tridip bhattarjee', N'p.a', N'988301265', N'tridip@yahoo.com', N'884122', CAST(0x0000996D00000000 AS DateTime), N'6652145', N'aaaaaaaaaaaa', N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstSupplier_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
Created By		: Indranil Roy
Creation Date	: 20.04.2007
Alteration Date	: N/A
Altered By		: N/A

select * from mstsupplier

delete from mstsupplier where supplierid='0000000009'

MstSupplier_Update  '0000000004',
					'Indranil Roy',
					'B',
					'Kolkata',
					'700055',
					'25744402',
					'25744402',
					'www.yahoo.com',

					'Indranil Roy',
					'Executive',
					'9836053412',
					'indra_me_roy@yahoo.co.in',
					'QWSWESD1254',
					'12/12/2007',
					'ASDFFR12545878',
					'Good',

					'tridip',
					'00',
					'000'

********************************************************************************************/


CREATE procedure [dbo].[MstSupplier_Update]

		@SupplierID			Varchar(10),
		@SupplierName		Varchar(100),
		@SupplierAddress		Varchar(200),
		@City				Varchar(50),
		@Pin				Varchar(15),
		@PhoneNo			Varchar(50),
		@FaxNo			Varchar(50),
		@URL				Varchar(50),
		@ContactPerson		Varchar(50),
		@PersonDesignation		Varchar(50),
		@MobileNo			Varchar(50),
		@Email			Varchar(50),
		@VATRegNo			Varchar(50),
		@VATRegDate		Varchar(10),
		@PANNo			Varchar(50),
		@Remarks			Varchar(200),
		@LogUserID    			Varchar(12),
		@CompanyID			Varchar(2),
		@BranchID			Varchar(3)

As

		Declare		@logMsg Varchar(200)
		Declare		@CurDatetime DateTime
		Declare		@dt DateTime


		If @SupplierID <> '' And @SupplierName <> ''
		Begin
			Begin Transaction T
		
			Update mstSupplier
			Set SupplierName=@SupplierName,
			SupplierAddress=@SupplierAddress,
			SupplierCity=@City,
			SupplierPin=@Pin,
			PhoneNo=@PhoneNo,
			FaxNo=@FaxNo,
			URL=@URL,
			
			ContactPerson=@ContactPerson,
			MobileNo=@MobileNo,
			PersonDesignation=@PersonDesignation,
			Email=@Email,
			VATRegNo=@VATRegNo,
			VATRegDate=Convert(DateTime,@VATRegDate,103),
			PANNo=@PANNo,
			Remarks=@Remarks,
			CompanyID=@CompanyID,
			BranchID=@BranchID
			Where SupplierID=@SupplierID

			-- Inserting Values into Log Table
			Set @LogMsg= 'Modified Supplier Data' + @SupplierID
			Set @CurDateTime = GetDate()
			Exec UserLog_Insert @CurDateTime, @LogUserID, @LogMsg
	
			If @@Error <> 0
			Begin
				Rollback Transaction T
				Return @@Error
			End
			
			Commit Transaction T
	
			--Select '*Data Updated Successfully.'
			Select @SupplierID
		End
GO
/****** Object:  StoredProcedure [dbo].[MstSupplier_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_help mstSupplier
/********************************************************************************************
Created By		: Indranil Roy
Creation Date	: 20.04.2007
Alteration Date	: N/A
Altered By		: N/A
sp_helptext MstSupplier_Select
select * from mstSupplier
MstSupplier_Insert  '',
					'Indranil Roy',
					'B',
					'Kolkata',
					'700055',
					'25744402',
					'25744402',
					'www.yahoo.com',

					'Indranil Roy',
					'Executive',
					'9836053412',
					'indra_me_roy@yahoo.co.in',
					'QWSWESD1254',
					'05/24/2007',
					'ASDFFR12545878',
					'Good',

					'tridip',
					'00',
					'000'
********************************************************************************************/


CREATE PROCEDURE [dbo].[MstSupplier_Insert]


		@SupplierID			Varchar(10),
		@SupplierName		Varchar(100),
		@SupplierAddress		Varchar(200),
		@City				Varchar(50),
		@Pin				Varchar(15),
		@PhoneNo			Varchar(50),
		@FaxNo			Varchar(50),
		@URL				Varchar(50),

		@ContactPerson		Varchar(50),
		@PersonDesignation		Varchar(50),
		@MobileNo			Varchar(50),
		@Email			Varchar(50),
		@VATRegNo			Varchar(50),
		@VATRegDate		Varchar(10),
		@PANNo			Varchar(50),
		@Remarks			Varchar(200),
		
		@LogUserId    			Varchar(12),
		@CompanyID			Varchar(2),
		@BranchID			Varchar(3)

As

	Declare @AutoGenPrefix varchar(5)
	Declare @NewSupplierID as varchar(10)
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as DateTime
	Declare @VATDate DateTime

/*
	Set @VATDate=Convert(DateTime,@VATRegDate)
	print @VATDate
*/


	-- Auto Generate New Stock point ID
	Set @AutoGenPrefix = @CompanyId + @BranchId
	Exec AutoGenerateID 'MstSupplier' , 'SupplierID' , 10 , @AutoGenPrefix , @NewSupplierID output


	If @SupplierName <> ''
	Begin

		Begin Transaction T
		Insert Into mstSupplier
		(SupplierID,SupplierName,SupplierAddress,SupplierCity,SupplierPin,PhoneNo,FaxNo,URL,ContactPerson,MobileNo,PersonDesignation,Email,VATRegNo,
		 VATRegDate,PANNo,Remarks,CompanyID,BranchID)
		Values
		(@NewSupplierID,@SupplierName,@SupplierAddress,@City,@Pin,@PhoneNo,@FaxNo,@URL,@ContactPerson,@MobileNo,@PersonDesignation,
		@Email,@VATRegNo,Convert(DateTime,@VATRegDate,103),@PANNo,@Remarks,@CompanyID,@BranchID)

		-- Inserting Values into Log Table
		Set @LogMsg= 'Insert Supplier Data' + @NewSupplierID
		Set @CurDateTime = Getdate()
		Exec UserLog_Insert @CurDateTime, @LogUserID, @LogMsg

		If @@Error<>0
		Begin
			Rollback Transaction T
			Return @@Error
		End

		Commit Transaction T

		--Select '*Data Saved Successfully.'
		Select @NewSupplierID
	End
GO
/****** Object:  StoredProcedure [dbo].[MstSupplier_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MstSupplier_Delete]

		@SupplierID		Varchar(10),
		@LogUserId		Varchar(12),
		@CompanyId		Varchar(2),
		@BranchId		Varchar(3)

As

		Declare @logMsg  Varchar(200)
		Declare @CurDatetime DateTime
	

		If @SupplierID <> ''
		Begin

			Begin Transaction T
		
			Delete From mstSupplier Where
			SupplierID=@SupplierID
	
			-- Inserting Values into Log Table
			Set @LogMsg= 'Deleted Supplier Data' + @SupplierID
			Set @CurDateTime = GetDate()
			Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg

			If @@Error=0
				Commit Transaction T
			Else
			Begin
				Rollback Transaction T
				Return @@Error
			End
			Select '*Data Deleted Successfully.'
		End
GO
/****** Object:  StoredProcedure [dbo].[MstStockPointNames_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MstStockPointNames_Select]

	@CompanyID		Varchar(2),
	@BranchID		Varchar(3),
	@FinYrID		Varchar(4)

As


	Begin
		Select	StockPointID,StockPointName From mstStockPoint
		Where	CompanyID=@CompanyID
		And	BranchID=@BranchID
		Order By StockPointName ASC
	End
GO
/****** Object:  StoredProcedure [dbo].[MstStockPointName_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Developed By Tridip Bhattacharjee
/*

select * from mstStockPoint
*/


CREATE PROCEDURE [dbo].[MstStockPointName_Select]

	@CompanyID		Varchar(2),
	@BranchID		Varchar(3),
	@StockType		Varchar(1)

As

	If	@StockType = ''
	Begin
		Select	StockPointID,StockPointName From mstStockPoint
		Where	CompanyID=@CompanyID
		And		BranchID=@BranchID
		Order By StockPointName ASC
	End
	Else
	Begin
		Select	StockPointID,StockPointName From mstStockPoint
		Where	StockPointType='V'
		And		CompanyID=@CompanyID
		And		BranchID=@BranchID
		Order By StockPointName ASC
	End
GO
/****** Object:  StoredProcedure [dbo].[MstLabourCategory_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 20/04/2007
/*

select * from MstLabourCategory

*/


CREATE PROCEDURE [dbo].[MstLabourCategory_Select]

	@LabourCategoryID	Varchar(10)='',
	@CompanyID			Varchar(2),
	@BranchID			Varchar(3)

As

	If @LabourCategoryID <> ''
	Begin
		Select	* From  MstLabourCategory 
		Where	LabourCategoryID=@LabourCategoryID
		And		CompanyID=@CompanyID
		And		BranchID=@BranchID	
	End
	Else
	Begin
			Select	LabourCategoryID,LabourCategoryName
			From	MstLabourCategory
			Where	CompanyID=@CompanyID
			And		BranchID=@BranchID	
			Order	By LabourCategoryName
	End
GO
/****** Object:  StoredProcedure [dbo].[MstGetProductGroupName_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--  Swarnali -------- 04/05/2007 ---------- --
CREATE PROCEDURE [dbo].[MstGetProductGroupName_Select]
(
	@ProductGroupID	 as varchar(10)
)

As 

BEGIN
	 select productGroupName 
	 from mstProductGroup
	 where ProductGroupID=@ProductGroupID

END
GO
/****** Object:  StoredProcedure [dbo].[MstGetManufacturerName_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MstGetManufacturerName_Select]
(
	@ManufacturerID	 as varchar(10)
)

As 

BEGIN
	 select ManufacturerName 
	 from mstManufacturer
	 where ManufacturerID=@ManufacturerID

END
GO
/****** Object:  StoredProcedure [dbo].[MstGetDepartmentName_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 30/04/2007
CREATE PROCEDURE [dbo].[MstGetDepartmentName_Select]
(
	@DepartmentID	 as varchar(10)
)

As 

BEGIN
	select  DepartmentName from mstDepartment where DepartmentID=@DepartmentID
END
GO
/****** Object:  StoredProcedure [dbo].[MstFinYr_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 23/04/2007
CREATE PROCEDURE [dbo].[MstFinYr_Select]
As 
BEGIN
	--Select  FinYearID,CAST(StartDate as Varchar) +'---'+CAST(EndDate as Varchar) as FinYr  from  MstFinYear
	Select  FinYearID,CONVERT(Varchar(10),StartDate,103) +'---'+CONVERT(Varchar(10),EndDate,103) as FinYr  from  MstFinYear



END
GO
/****** Object:  StoredProcedure [dbo].[MstProductGroupFrm_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 23/04/2007
CREATE PROCEDURE [dbo].[MstProductGroupFrm_Select]
	
		@CompanyId				Varchar(2),
		@BranchId				Varchar(3)	
As

BEGIN

	Select  ProductGroupID,ProductGroupName  from  MstProductGroup
	Where	CompanyId=@CompanyId
	And		BranchId=@BranchId
END
GO
/****** Object:  StoredProcedure [dbo].[MstManufacturerfrm_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MstManufacturerfrm_Select]
(
	@CompanyID	VARCHAR(2),
	@BranchID	VARCHAR(3)
)
AS

BEGIN

	SELECT ManufacturerID,ManufacturerName FROM MstManufacturer 
	WHERE  CompanyID=@CompanyID AND BranchID=@BranchID

END
GO
/****** Object:  StoredProcedure [dbo].[MstManufacturer_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Arnab -- 14/06/2007
CREATE PROCEDURE [dbo].[MstManufacturer_Select]
(
	@ManufacturerID	 as varchar(10)
)
As 
BEGIN
	Select  *  from  MstManufacturer Where ManufacturerID=@ManufacturerID
END
GO
/****** Object:  StoredProcedure [dbo].[MstProductGroup_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstProductGroup_Select]
(
	@ProductGroupID	 as varchar(10)
)
As 
BEGIN
	Select  *  from  MstProductGroup Where ProductGroupID=@ProductGroupID
END
GO
/****** Object:  Table [dbo].[MstSetup]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstSetup](
	[SetupID] [varchar](3) NOT NULL,
	[SetupCompanyID] [varchar](2) NOT NULL,
	[CurrentVersion] [varchar](50) NULL,
	[CurrentFinYearID] [varchar](4) NOT NULL,
	[SetupBranchID] [varchar](3) NOT NULL,
	[ServerName] [varchar](100) NULL,
	[ServerUser] [varchar](20) NULL,
	[ServerPWD] [varchar](200) NULL,
	[ProcessTag] [varchar](1) NULL,
 CONSTRAINT [PK_MstSetup] PRIMARY KEY CLUSTERED 
(
	[SetupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstSetup] ([SetupID], [SetupCompanyID], [CurrentVersion], [CurrentFinYearID], [SetupBranchID], [ServerName], [ServerUser], [ServerPWD], [ProcessTag]) VALUES (N'001', N'01', N'Beta 1', N'0607', N'001', NULL, NULL, NULL, N'N')
/****** Object:  StoredProcedure [dbo].[MstSetup_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstSetup_Update] 
		(
		@SetupID  	  as varchar(3)  , 
		@SetupCompanyID   as varchar(2)  , 
		@SetupBranchID 	  as varchar(3)  , 
		@CurrentFinYearID as varchar(4)  , 
		@ServerName 	  as varchar(100)  , 
		@ServerUser 	  as varchar(20)  , 
		@ServerPWD 	  as varchar(200)  , 
		@BranchID 	  as varchar(3)  , 
		@CompanyID 	  as varchar(2)  , 
		@ProcessTag	  as varchar(1),
		@LogUserId 	  as varchar(12) 
		)
As 
 
Begin
   
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @intError as integer
	
	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select 	@intCntr = Count(SetupID) 
	from 	MstSetup
	BEGIN TRANSACTION
	if @intCntr = 0 
	begin
		-- Insert Setup
		Insert into MstSetup
		(SetupID,  SetupCompanyID, SetupBranchID, CurrentFinYearID, ServerName, ServerUser, ServerPWD, ProcessTag)
		Values
		(@SetupID,@SetupCompanyID, @SetupBranchID,@CurrentFinYearID,@ServerName,@ServerUser,@ServerPWD, @ProcessTag)
	end
	else
	begin
		-- Update Setup
		Update 	MstSetup
		set	SetupCompanyID = @SetupCompanyID,
			SetupBranchID = @SetupBranchID,
			CurrentFinYearID = @CurrentFinYearID,
			ServerName = @ServerName,
			ServerUser = @ServerUser,
			ServerPWD = @ServerPWD,
			ProcessTag = @ProcessTag
		Where	SetupID = @SetupID
	end	
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End 
	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update Setup ' + @SetupID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	COMMIT TRANSACTION
	select '*Data saved successfully, SetupID - ' + @SetupID
 END
GO
/****** Object:  StoredProcedure [dbo].[MstServiceItem_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstServiceItem_Select]
(
		@ServiceItemID		Varchar(10)
)
As 

			If	@ServiceItemID <> ''
			Begin
				Select  *
				From	MstServiceItem
				Where	ServiceItemID=@ServiceItemID
			End
			Else
				Select  *
				From	MstServiceItem
				Where	
				--And		BranchID=@BranchID
				ServiceType <> 'LWC'
				And		ServiceType <> 'MCC'
GO
/****** Object:  StoredProcedure [dbo].[MstSupplier_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from MstSupplier
*/


CREATE PROCEDURE [dbo].[MstSupplier_Select]

	@CompanyId		Varchar(2),
	@BranchId		Varchar(3)
			

As


	Select	SupplierID,SupplierName
	From	MstSupplier
	Where	CompanyId=@CompanyId
	And		BranchId=@BranchId
GO
/****** Object:  StoredProcedure [dbo].[MstStockPoint_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 16/04/2007
CREATE PROCEDURE [dbo].[MstStockPoint_Select]
(
	@StockPointID	 as varchar(10)
)
As 
BEGIN
	Select  *  from  MstStockPoint Where StockPointID=@StockPointID
END
GO
/****** Object:  StoredProcedure [dbo].[rptProformaInv_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from mstProduct
select * from trnPurchaseOrderDtl

rptProformaInv_Select @ProformaInvNo='030077777000003'

select * from TrnProformaInvoiceHdr
*/

CREATE procedure [dbo].[rptProformaInv_Select]

	@ProformaInvNo		Varchar(15)

As

	Select	TPIH.ProformaInvNo,Convert(Varchar(10),TPIH.ProformaInvDate,103) As ProformaInvDate,MC.CustomerName,
	Convert(Varchar(10),TPIH.DeliveryDate,103) As DeliveryDate,TPIH.Remarks,TPIH.VatRate,TPIH.VatAmt,
	TPIH.ProductTotal,TPIH.ProformaInvAmt,
	(Case
		When ConfirmationTag=1 Then 'Yes'
		When ConfirmationTag=0 Then 'No' End
	) As ConfirmationTag
	From TrnProformaInvoiceHdr TPIH
	Inner Join MstCustomer MC On TPIH.CustomerID=MC.CustomerID
	Where TPIH.ProformaInvNo=@ProformaInvNo
GO
/****** Object:  StoredProcedure [dbo].[MstYear_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstYear_Select]
		(
		@CompanyID as varchar(2) ,
		@BranchID as varchar(3)  
		)
As 
 
BEGIN
	--Select Year List
	Select  Datename(yyyy,StartDate) as YearID
	From MstFinYear
	Union
	Select  Datename(yyyy,EndDate) as YearID
	From MstFinYear
END
GO
/****** Object:  StoredProcedure [dbo].[MstSupplierFrm_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
Created By			: Indranil Roy
Creation Date		: 25.04.2007
Altered By			: N/A
Alteration Date		: N/A



MstSupplierFrm_Select '0000000004','V'
******************************************************************************/


CREATE PROCEDURE [dbo].[MstSupplierFrm_Select]

	@SupplierID				Varchar(10)='',
	@Mode					Varchar(1)='',
	@CompanyId				Varchar(2),
	@BranchId				Varchar(3)

As


	If @SupplierID <> ''
	Begin
		If @Mode='V'
		Begin
			Select	SupplierID,SupplierName,SupplierAddress,SupplierCity,SupplierPin,PhoneNo,URL,
					FaxNo,ContactPerson,
					PersonDesignation,MobileNo,Email,VATRegNo,Convert(Varchar(10),VATRegDate,103) As VATRegDate,PANNo,
					Remarks 
			From	MstSupplier
			Where	SupplierID=@SupplierID
			And		CompanyId=@CompanyId
			And		BranchId=@BranchId
			Order	By SupplierName
		End
		Else
		Begin
			Select	SupplierID,SupplierName,SupplierAddress,SupplierCity,SupplierPin,PhoneNo,URL,
					FaxNo,ContactPerson,
					PersonDesignation,MobileNo,Email,VATRegNo,VATRegDate,PANNo,
					Remarks 
			From	MstSupplier
			Where	SupplierID=@SupplierID
			And		CompanyId=@CompanyId
			And		BranchId=@BranchId
			Order	By SupplierName
		End
		
	End
	Else
	Begin
		Select	SupplierID,SupplierName,SupplierAddress,SupplierCity,SupplierPin,PhoneNo,URL,
				FaxNo,ContactPerson,
				PersonDesignation,MobileNo,Email,VATRegNo,Convert(DateTime,VATRegDate,103),PANNo,
				Remarks 
		From	MstSupplier
		Where	CompanyId=@CompanyId
		And		BranchId=@BranchId
		Order	By SupplierName
	End
GO
/****** Object:  StoredProcedure [dbo].[MstAdminFinYear_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 15/05/2007
CREATE PROCEDURE [dbo].[MstAdminFinYear_Select]
(
	@FinYrID Varchar(4)
)
as
BEGIN
	SELECT * from MstFinYear
	Where MstFinYear.FinYearID=@FinYrID
END
GO
/****** Object:  Table [dbo].[MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstProduct](
	[ProductID] [varchar](10) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductSpec] [varchar](50) NULL,
	[ProductGroupID] [varchar](10) NOT NULL,
	[ManufacturerID] [varchar](10) NULL,
	[ProductUOM] [varchar](10) NOT NULL,
	[ReorderLevel] [decimal](18, 2) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100001', N'Table Fan', N'', N'0100100003', NULL, N'p.c.s', CAST(20.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100002', N'15 Meter Cable', N'cable', N'0100100001', NULL, N'p.c.s', CAST(25.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100003', N'20 Meter Cable', N'Cable', N'0100100001', NULL, N'p.c.s', CAST(50.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100004', N'Ceiling Fan', N'Ceiling Fan', N'0100100003', NULL, N'p.c.s', CAST(40.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100005', N'Tube light', N'light', N'0100100002', NULL, N'p.c.s', CAST(20.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100006', N'Double Tube Light', N'', N'0100100002', NULL, N'p.c.s', CAST(90.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100007', N'Toggle switches', N'', N'0100100004', NULL, N'p.c.s', CAST(20.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100008', N'Pushbutton switches', N'', N'0100100004', NULL, N'p.c.s', CAST(50.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProduct] ([ProductID], [ProductName], [ProductSpec], [ProductGroupID], [ManufacturerID], [ProductUOM], [ReorderLevel], [CompanyID], [BranchID]) VALUES (N'0100100009', N'Selector switch', N'Selector switch', N'0100100004', NULL, N'p.c.s', CAST(60.00 AS Decimal(18, 2)), N'01', N'001')
/****** Object:  StoredProcedure [dbo].[TrnProformaInvoice_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from TrnProformaInvoiceDtl
select * from TrnProformaInvoiceHdr

select * from TrnProformaInvoiceHdr where ProformaInvNo='030077777000001'

select * from TrnProformaInvoiceDtl where ProformaInvNo='030077777000001'


Developed By		: Indranil Roy

TrnProformaInvoice_Update   @ProformaInvNo='030077777000001',
							@ProformaInvDate='24/05/2007',
							@DateofDelivery='24/05/2007',
							@CustomerID='0000000007',
							@Remarks='Good',
							@VATRate=2.00,
							@VATAmt=.040,
							@ProductTotal=20.00,
							@ProformaInvAmt=20.40,
							@ConfirmationTag='1',
							@DetailXml='
										<NewDataSet>
										<ProformaInvDetail>
											<productid>0000000005</productid>
											<unit>pc</unit>
											<rate>10</rate>
											<qty>2</qty>
											<amount>20.00</amount>
										</ProformaInvDetail>
										</NewDataSet>
										',
							@LogUserId='indranil',
							@CompanyId='03',
							@BranchId='007',
							@FinYearID='7777'

*/





CREATE PROCEDURE [dbo].[TrnProformaInvoice_Update]


	@ProformaInvNo				Varchar(15),
	@ProformaInvDate			Varchar(10),
	@DateofDelivery				Varchar(10),
	@CustomerID					Varchar(10),
	@Remarks  					Varchar(200),

	@VATRate					Decimal(18,2),
	@VATAmt						Decimal(18,2),
	@ProductTotal				Decimal(18,2),
	@ProformaInvAmt				Decimal(18,2),
	@ConfirmationTag			Varchar(1),
	@DetailXml					Ntext,
	

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)


As 
 
Begin

	Declare			@intCntr				as int
	Declare			@logMsg					as Varchar(200)
	Declare			@CurDatetime			as datetime	
	Declare			@intError				as integer
	Declare			@NewProformaInvNo		as Varchar(15)
	Declare			@NewProformaInvDtlID	as Varchar(18)
	Declare			@AutoGenPrefix			as Varchar(9)

	Declare			@XMLFormat	Int

	Declare			@ProductID	Varchar(10)
	Declare			@Unit		Varchar(50)
	Declare			@Rate		Decimal(18,2)
	Declare			@Qty		Decimal(18,3)
	Declare			@Amount		Decimal(18,2)


	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	

	IF @ProformaInvDate=''
	BEGIN
	        select 'Proforma Invoice date can not be empty'
	        return
	END

	IF @DateofDelivery=''
	BEGIN
	        select 'Date of delivery can not be empty'
	        return
	END

	IF @CustomerID = ''
	BEGIN
	        select 'Select Customer'
	        return
	END

	IF @CustomerID <> ''
	BEGIN
		select  @intcntr = count(*)
		from   	MstCustomer
		where   (CustomerID = @CustomerID)

		if @intcntr  <= 0
		begin
         	select 'Invalid Customer ID'
			return
		end
	END

	If @VATRate <= 0
		Begin
			Select 'VAT Rate can not be empty'
	        return
		End

	If @ProformaInvAmt <= 0
		Begin
			Select 'Proforma Invoice Amount can not be empty'
	        return
		End

	If @ConfirmationTag = ''
		Begin
			Select 'Please give the Confirmation'
	        return
		End

	If @CompanyId = ''
		Begin
			Select 'Please give the Company'
	        return
		End

	If @BranchId = ''
		Begin
			Select 'Please give the Branch'
	        return
		End

	If @FinYearID = ''
		Begin
			Select 'Please give the Financial Year'
	        return
		End

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select productid,unit,rate,qty,amount
	From Openxml (@XMLFormat, '/NewDataSet/ProformaInvDetail', 2)
	With
		(
			productid Varchar(10),
			unit Varchar(50),
			rate decimal(18,2),
			qty decimal(18,3),
			amount decimal(18,2)

		)



	BEGIN TRANSACTION   

	Update		TrnProformaInvoiceHdr
	Set			ProformaInvDate=Convert(Datetime,@ProformaInvDate,103),
				CustomerID=@CustomerID,
				DeliveryDate=Convert(Datetime,@DateofDelivery,103),
				ConfirmationTag=@ConfirmationTag,
				Remarks=@Remarks,
				ProductTotal=@ProductTotal,
				VATRate=@VATRate,
				VATAmt=@VATAmt,
				ProformaInvAmt=@ProformaInvAmt,
				CompanyID=@CompanyID,
				BranchID=@BranchID,
				FinYearID=@FinYearID
	Where		ProformaInvNo=@ProformaInvNo

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Delete	from TrnProformaInvoiceDtl
	Where 	ProformaInvNo = @ProformaInvNo
	and ProductID not in (Select productid
			 from OPENXML (@XMLFormat, '/NewDataSet/ProformaInvDetail', 2)
			 with (	productid  varchar(10)))


	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount

	While (@@Fetch_Status=0)
	Begin

		/*print 'Product'+@ProductID
		print 'Unit'+@Unit
		print 'Rate'+@Rate
		print 'Qty'+@Qty
		print 'Amt'+@Amount*/

		IF @ProductID=''
		Begin
			select 'Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid product id'
				return
			end
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END

		Select  @intcntr = count(*)
		From   	TrnProformaInvoiceDtl
		Where   (ProductID = @ProductID and ProformaInvNo=@ProformaInvNo)

		--print @intcntr
	/*	
		select * from mstProduct

		Select  count(*)
		From   	TrnProformaInvoiceDtl
		Where   (ProductID = '0000000002' and ProformaInvNo='030077777000001')
*/

		IF @intcntr  <= 0
			Begin
				exec AutoGenerateID 'TrnProformaInvoiceDtl' , 'ProformaInvDtlID' , 18  , @ProformaInvNo,@NewProformaInvDtlID output

				--print 'Insert'
				INSERT INTO TrnProformaInvoiceDtl(ProformaInvDtlID,ProformaInvNo,ProductID,ProductRate,
				ProductQty,ProductAmt)
				Values 
				(@NewProformaInvDtlID,@ProformaInvNo,@ProductID,@Rate,@Qty,@Amount)
			End
		Else
			Begin
				--print 'Update'
				Update	TrnProformaInvoiceDtl
				Set 	ProductQty=@Qty,
						ProductRate=@Rate,
						ProductAmt=@Amount
				Where 	ProformaInvNo=@ProformaInvNo
				And 	ProductID=@ProductID
			End
		

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update Proforma Invoice' + @ProformaInvNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @ProformaInvNo
  
 END
GO
/****** Object:  StoredProcedure [dbo].[TrnProformaInvoice_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Developed By		: Indranil Roy
select * from TrnProformaInvoiceHdr
select * from TrnProformaInvoiceDtl
sp_help TrnProformaInvoiceDtl
*/

CREATE PROCEDURE [dbo].[TrnProformaInvoice_Insert]


	@ProformaInvNo				Varchar(15),
	@ProformaInvDate			Varchar(10),
	@DateofDelivery				Varchar(10),
	@CustomerID					Varchar(10),
	@Remarks  					Varchar(200),

	@VATRate					Decimal(18,2),
	@VATAmt						Decimal(18,2),
	@ProductTotal				Decimal(18,2),
	@ProformaInvAmt				Decimal(18,2),
	@ConfirmationTag			Varchar(1),
	@DetailXml					Ntext,
	

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)


As 
 
Begin

	Declare			@intCntr				as int
	Declare			@logMsg					as Varchar(200)
	Declare			@CurDatetime			as datetime	
	Declare			@intError				as integer
	Declare			@NewProformaInvNo		as Varchar(15)
	Declare			@NewProformaInvDtlID	as Varchar(18)
	Declare			@AutoGenPrefix			as Varchar(9)

	Declare			@XMLFormat	Int

	Declare			@ProductID	Varchar(10)
	Declare			@Unit		Varchar(50)
	Declare			@Rate		Decimal(18,2)
	Declare			@Qty		Decimal(18,3)
	Declare			@Amount		Decimal(18,2)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*)
	from   	TrnProformaInvoiceHdr
	where   (ProformaInvNo = @ProformaInvNo)

	if @intcntr  > 0
	begin
	        select 'Purchase order already exists'
	        return
	end

	IF @ProformaInvDate=''
	BEGIN
	        select 'Proforma Invoice date can not be empty'
	        return
	END

	IF @DateofDelivery=''
	BEGIN
	        select 'Date of delivery can not be empty'
	        return
	END

	IF @CustomerID=''
	BEGIN
	        select 'Select Customer'
	        return
	END

	IF @CustomerID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstCustomer
		where   (CustomerID = @CustomerID)

		if @intcntr  <= 0
		begin
         	select 'Invalid Customer ID'
			return
		end
	END

	If @ProformaInvAmt <= 0
		Begin
			Select 'Proforma Invoice Amount can not be empty'
	        return
		End

	If @ConfirmationTag = ''
		Begin
			Select 'Please give the Confirmation'
	        return
		End

	If @CompanyId = ''
		Begin
			Select 'Please give the Company'
	        return
		End

	If @BranchId = ''
		Begin
			Select 'Please give the Branch'
	        return
		End

	If @FinYearID = ''
		Begin
			Select 'Please give the Financial Year'
	        return
		End

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml


	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select productid,unit,rate,qty,amount
	From Openxml (@XMLFormat, '/NewDataSet/ProformaInvDetail', 2)
	With 
		(
			productid Varchar(10),
			unit Varchar(50),
			rate decimal(18,2),
			qty decimal(18,3),
			amount decimal(18,2)

		)


	BEGIN TRANSACTION   

	-- Auto Generate New ProformaInvoice No
	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnProformaInvoiceHdr' , 'ProformaInvNo' , 15 , @AutoGenPrefix , @NewProformaInvNo output

	Insert Into TrnProformaInvoiceHdr
	(ProformaInvNo,ProformaInvDate,CustomerID,DeliveryDate,ConfirmationTag,Remarks,
	ProductTotal,VATRate,VATAmt,ProformaInvAmt,CompanyID,BranchID,FinYearID)
	Values
	(@NewProformaInvNo,Convert(Datetime,@ProformaInvDate,103),@CustomerID,Convert(Datetime,@DateofDelivery,103),
	@ConfirmationTag,@Remarks,@ProductTotal,@VATRate,@VATAmt,@ProformaInvAmt,@CompanyID,@BranchID,@FinYearID)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount

	While (@@Fetch_Status=0)
	Begin

		IF @ProductID=''
		Begin
			select 'Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid product id'
				return
			end
		END

		IF @Unit = '' 
		Begin
			select 'Unit can not be empty'
			return
		END

		IF @Rate <= 0 
		Begin
			select 'Rate can not be empty'
			return
		END

		IF @Qty <= 0 
		Begin
			select 'Quantity can not be empty'
			return
		END

		IF @Amount <= 0
		Begin
			select 'Amount can not be empty'
			return
		END
	
		-- Auto Generate New PurchaseOrderDtlID
		exec  AutoGenerateID 'TrnProformaInvoiceDtl' ,'ProformaInvDtlID',18,@NewProformaInvNo,@NewProformaInvDtlID output

		INSERT TrnProformaInvoiceDtl(ProformaInvDtlID,ProformaInvNo,ProductID,ProductRate,ProductQty,ProductAmt)
		Values (@NewProformaInvDtlID,@NewProformaInvNo,@ProductID,@Rate,@Qty,@Amount)	

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Proforma Invoice' + @NewProformaInvNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewProformaInvNo
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstProduct_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 25/04/2007
CREATE PROCEDURE [dbo].[MstProduct_Update] 
(
	@ProductID		as varchar(10)=null,
	@ProductName	as  varchar(50),
	@ProductSpec		as  varchar(50),
	@ProductGroupID  	as  varchar(10) = null,
	@ManufacturerID	as  varchar(10) = null,
	@ProductUOM  	as  varchar(10) = null,
	@ReorderLevel  	as  decimal(18,2),	
	@LogUserId    	 	as varchar(12),
	@CompanyId  	 	as varchar(2),
	@BranchId       	 	as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	IF @ProductName = ''
	BEGIN
	        select 'Product name can not be empty'
	        return
	END

	
	IF @ProductGroupID=''
	BEGIN
	        select 'Select product group id'
	        return
	END

	/*IF @ProductGroupID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstProductGroup
		where   (ProductGroupID = @ProductGroupID)
	         	select 'Invalid product group id'
		return
	END*/

	IF @ProductUOM =''
	BEGIN
	        select 'Unit of Product can not be empty'
	        return
	END

	/*IF @ReorderLevel = ''
	BEGIN
	        select 'Product Record level can not be empty'
	        return
	END	*/

	
	BEGIN TRANSACTION   

	Update MstProduct
	Set ProductName=@ProductName,
	ProductSpec = @ProductSpec,
	ProductGroupID = @ProductGroupID,
	ManufacturerID = @ManufacturerID,
	ProductUOM = @ProductUOM,
	ReorderLevel = @ReorderLevel
	Where ProductID=@ProductID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Product Data' + @ProductID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @ProductID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstProduct_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***** Swarnali ******** 25/04/2007 ********* */

CREATE PROCEDURE [dbo].[MstProduct_Insert]
(
	@ProductID		as varchar(10)=null,
	@ProductName		as  varchar(50),
	@ProductSpec		as  varchar(50),
	@ProductGroupID  	as  varchar(10) = null,
	@ManufacturerID	as  varchar(10) = null,	/** arnab 150607 **/
	@ProductUOM  		as  varchar(10) = null,
	@ReorderLevel  	as  decimal(18,2),	
	@LogUserId    	 	as varchar(12),
	@CompanyId  	 	as varchar(2),
	@BranchId        		as varchar(3)
	

)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewProductID as varchar(10)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(*)
	from   	MstProduct
	where   (ProductID = @ProductID)

	if @intcntr  > 0
	begin
	        select 'Product  already exists'
	        return
	end

	IF @ProductName = ''
	BEGIN
	        select 'Product name can not be empty'
	        return
	END

	
	IF @ProductGroupID=''
	BEGIN
	        select 'Select product group id'
	        return
	END

	/*IF @ProductGroupID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstProductGroup
		where   (ProductGroupID = @ProductGroupID)
	         	select 'Invalid product group id'
		return
	END*/

	IF @ProductUOM =''
	BEGIN
	        select 'Unit of Product can not be empty'
	        return
	END

	/*IF @ReorderLevel = ''
	BEGIN
	        select 'Product Reorder  level can not be empty'
	        return
	END	*/

	BEGIN TRANSACTION   

	-- Auto Generate New Product ID
	set @AutoGenPrefix = @CompanyId + @BranchId 
	exec  AutoGenerateID 'MstProduct' , 'ProductID' , 10 , @AutoGenPrefix , @NewProductID output     

	Insert Into MstProduct
	(ProductID, ProductName, ProductSpec, ProductGroupID, ManufacturerID,ProductUOM, ReorderLevel, CompanyID,BranchID)
	Values
	(@NewProductID, @ProductName,@ProductSpec,@ProductGroupID,@ManufacturerID ,@ProductUOM,@ReorderLevel,@CompanyID,@BranchID)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Product' + @NewProductID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewProductID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstFinYear_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstFinYear_Select]
(
	@CompanyID as varchar(2)=null ,
	@BranchID as varchar(3) =null
)
As 
 
BEGIN
	--Select Financial Year and Current Date (without time)
           Select  	FinYearID, StartDate, EndDate, CompanyID, BranchID, 
           DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 0) as CurDateWithoutTime
           From 	MstFinYear
           Where   	CompanyID =@CompanyID
           and	BranchID like @BranchID
          Order by FinYearID
END
GO
/****** Object:  StoredProcedure [dbo].[MstDepartment_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstDepartment_Select]
(
	@DepartmentID	 as varchar(10)
)
As 
BEGIN
	Select  *  from  MstDepartment Where DepartmentID=@DepartmentID
END
GO
/****** Object:  StoredProcedure [dbo].[MstDepartmentFrm_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 23/04/2007
CREATE PROCEDURE [dbo].[MstDepartmentFrm_Select]

	@CompanyId		Varchar(2),
	@BranchId		Varchar(3)

As 
BEGIN
	Select  DepartmentID,DepartmentName  from  MstDepartment
	Where	CompanyId=@CompanyId
	And		BranchId=@BranchId
END
GO
/****** Object:  StoredProcedure [dbo].[MstCustomer_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
Created By			: Indranil Roy
Creation Date		: 25.04.2007
Altered By			: N/A
Alteration Date		: N/A

select * from MstCustomer

******************************************************************************/


CREATE PROCEDURE [dbo].[MstCustomer_Select]

	@CustomerID				Varchar(10),
	@CompanyId				Varchar(2),
	@BranchId				Varchar(3)

As

	If @CustomerID <> ''
	Begin
		Select	CustomerID,CustomerName,BillingAddress,BillingPin,BillingCity,ShippingAddress,
				ShippingCity,ShippingPin,PhoneNo,URL,FaxNo,ContactPerson,PersonDesignation,
				MobileNo,Email,PANNo,Remarks
		From	MstCustomer
		Where	CustomerID=@CustomerID
		And		CompanyId=@CompanyId
		And		BranchId=@BranchId
	End
	Else
	Begin
		Select	CustomerID,CustomerName,BillingAddress,BillingPin,BillingCity,ShippingAddress,
				ShippingCity,ShippingPin,PhoneNo,URL,FaxNo,ContactPerson,PersonDesignation,
				MobileNo,Email,PANNo,Remarks
		From	MstCustomer
		Where	CompanyId=@CompanyId
		And		BranchId=@BranchId
	End
GO
/****** Object:  StoredProcedure [dbo].[MstGetSupplierName_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 30/04/2007
CREATE PROCEDURE [dbo].[MstGetSupplierName_Select]
(
	@SupplierID	 as varchar(10)
)

As 

BEGIN
	select SupplierName from mstSupplier where SupplierID=@SupplierID
END
GO
/****** Object:  Table [dbo].[TrnJobHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnJobHdr](
	[JobNo] [varchar](15) NOT NULL,
	[JobStartDate] [datetime] NOT NULL,
	[CustomerID] [varchar](10) NOT NULL,
	[CustomerName] [varchar](100) NOT NULL,
	[JobAddress] [varchar](200) NOT NULL,
	[JobCity] [varchar](50) NULL,
	[JobPin] [varchar](15) NULL,
	[Remarks] [varchar](200) NULL,
	[JobStatus] [varchar](3) NOT NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[LabWorkTotal] [decimal](18, 2) NOT NULL,
	[ProductIssueTotal] [decimal](18, 2) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnJobHdr] PRIMARY KEY CLUSTERED 
(
	[JobNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnJobHdr] ([JobNo], [JobStartDate], [CustomerID], [CustomerName], [JobAddress], [JobCity], [JobPin], [Remarks], [JobStatus], [CancelDate], [CancelReason], [LabWorkTotal], [ProductIssueTotal], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000997400000000 AS DateTime), N'0100100001', N'Ram', N'sdfsd', N'Kolkata', N'700055', N'sdfsd', N'NUT', NULL, NULL, CAST(11303.47 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnJobProductIssue_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrnJobProductIssue_Cancel]

	@JobNo						Varchar(15),
	@CancelDate					Varchar(10),
	@CancelReason				Varchar(200),
	@LogUserId    	 			Varchar(12),
	@CompanyID					Varchar(2),
	@BranchID					Varchar(3),
	@FinYearID					Varchar(4)


As

	Declare		@logMsg			Varchar(200)
	Declare		@CurDatetime	DateTime

	Begin Transaction T
		
		Update		TrnJobHdr
		Set			CancelDate=Convert(DateTime,@CancelDate,103),
					CancelReason=@CancelReason,
					JobStatus='CAN'
		Where		JobNo=@JobNo
		And			CompanyID=@CompanyID
		And			BranchID=@BranchID
		And			FinYearID=@FinYearID


		-- Inserting Values into Log Table	
	Set @LogMsg= 'Cancel Job' + @JobNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg


	If @@Error <> 0
	Begin
		Rollback Transaction T
	End
	Else
	Begin
			Commit Transaction T
	End

	Select @JobNo
GO
/****** Object:  Table [dbo].[TrnPurchaseOrderHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnPurchaseOrderHdr](
	[PurchaseOrderNo] [varchar](15) NOT NULL,
	[PurchaseOrderDate] [datetime] NOT NULL,
	[DateofDelivery] [datetime] NOT NULL,
	[SupplierID] [varchar](10) NOT NULL,
	[DepartmentID] [varchar](10) NOT NULL,
	[ProductGroupID] [varchar](10) NOT NULL,
	[PaymentTerms] [varchar](100) NULL,
	[Remarks] [varchar](200) NULL,
	[ProductTotalAmt] [decimal](18, 2) NOT NULL,
	[VATRate] [decimal](18, 2) NOT NULL,
	[VATAmt] [decimal](18, 2) NOT NULL,
	[PurchaseOrderAmt] [decimal](18, 2) NOT NULL,
	[PurchaseOrderStatus] [varchar](3) NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnPurchaseOrderHdr] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000001', CAST(0x000099C200000000 AS DateTime), CAST(0x000099C200000000 AS DateTime), N'0100100001', N'0100100001', N'0100100002', N'cash', N'www', CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), N'PUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000002', CAST(0x000099FF00000000 AS DateTime), CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'0100100001', N'0100100001', N'', N'asdas', CAST(2020.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(202.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'NUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000003', CAST(0x000099FF00000000 AS DateTime), CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'0100100001', N'0100100001', N'', N'', CAST(2020.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2020.00 AS Decimal(18, 2)), N'PUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000004', CAST(0x000099FF00000000 AS DateTime), CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'0100100001', N'0100100002', N'', N'', CAST(8000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), CAST(8800.00 AS Decimal(18, 2)), N'PUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010011478000001', CAST(0x0000998F00000000 AS DateTime), CAST(0x0000998F00000000 AS DateTime), N'0100100001', N'0100100001', N'0100100001', N'cash', N'aaaaaa', CAST(33000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(33000.00 AS Decimal(18, 2)), N'NUT', NULL, NULL, N'01', N'001', N'1478')
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000996E00000000 AS DateTime), CAST(0x0000996E00000000 AS DateTime), N'0100100001', N'0100100001', N'0100100003', N'cash', N'xcbxcxcbxc', CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), N'PUT', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', CAST(0x0000997C00000000 AS DateTime), CAST(0x0000997C00000000 AS DateTime), N'0100100001', N'0100100002', N'0100100002', N'', N'', CAST(7000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(7350.00 AS Decimal(18, 2)), N'PUT', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo], [PurchaseOrderDate], [DateofDelivery], [SupplierID], [DepartmentID], [ProductGroupID], [PaymentTerms], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [PurchaseOrderAmt], [PurchaseOrderStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000003', CAST(0x0000999200000000 AS DateTime), CAST(0x0000999200000000 AS DateTime), N'0100100001', N'0100100001', N'0100100001', N'CASH', N'SDGGDGGSDDG', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), N'CAN', CAST(0x0000999200000000 AS DateTime), N'CBXXCBXCBXCBXCBXCBXCBB', N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrder_Close]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 26/07/2007

CREATE PROCEDURE [dbo].[TrnPurchaseOrder_Close]
(
	@PurchaseOrderNo		as varchar(15)=null,
	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        		as varchar(3),
	@FinYearID        		as varchar(4)
)
As 
 
Begin

	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*)
	from   	TrnPurchaseOrderHdr
	where   (PurchaseOrderStatus = 'NUT' and PurchaseOrderNo=@PurchaseOrderNo)


	if @intcntr  <= 0
	begin
	      	select 'Error : Purchase Ordere Status is not [NUT] so this can not be cancel'
	        return
	end

	BEGIN TRANSACTION   

	Update TrnPurchaseOrderHdr Set PurchaseOrderStatus='CLS' Where PurchaseOrderNo=@PurchaseOrderNo
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Close Purchase Orde' + @PurchaseOrderNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @PurchaseOrderNo
  

 END
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrder_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 31/05/2007


CREATE PROCEDURE [dbo].[TrnPurchaseOrder_Cancel]
(

	@PurchaseOrderNo		as varchar(15)=null,
	@CancelDate			as varchar(10),
	@CancelReason			as varchar(200),
	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        		as varchar(3),
	@FinYearID        		as varchar(4)

)
As 
 
Begin

	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*)
	from   	TrnPurchaseOrderHdr
	where   (PurchaseOrderStatus = 'NUT' and PurchaseOrderNo=@PurchaseOrderNo)


	if @intcntr  <= 0
	begin
	      	select 'Error : Purchase Ordere Status is not [NUT] so this can not be cancel'
	        return
	end

	BEGIN TRANSACTION   

	Update TrnPurchaseOrderHdr Set PurchaseOrderStatus='CAN',CancelDate=Convert(datetime,@CancelDate,103),
	CancelReason=@CancelReason Where PurchaseOrderNo=@PurchaseOrderNo
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Cancel Purchase Orde' + @PurchaseOrderNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @PurchaseOrderNo
  

 END
GO
/****** Object:  StoredProcedure [dbo].[MstProductGroup_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 20/04/2007
CREATE PROCEDURE [dbo].[MstProductGroup_Delete] 
(
	@ProductGroupID	 as varchar(10),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCnt as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	Set @intCnt = 0

	BEGIN TRANSACTION   

	Select	@intCnt= Count(*)
	From	mstProduct
	where	ProductGroupID = @ProductGroupID  	
	if @intCnt  > 0
		begin 
			Select 'Delete is not allowed as product Detail  already exist !!!!'
			return
		end

	Select	@intCnt= Count(*)
	From	TrnPurchaseOrderHdr
	where	ProductGroupID = @ProductGroupID  	
	if @intCnt  > 0
		begin 
			Select 'Delete is not allowed as purchase order already exist !!!!'
			return
		end

	Delete from  MstProductGroup 
	Where ProductGroupID=@ProductGroupID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Product Group Data' + @ProductGroupID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully.'
  
 END
GO
/****** Object:  Table [dbo].[TrnPurchaseInvoiceHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnPurchaseInvoiceHdr](
	[PurchaseInvNo] [varchar](15) NOT NULL,
	[PurchaseInvDate] [datetime] NOT NULL,
	[PurchaseOrderNo] [varchar](15) NOT NULL,
	[SupplierID] [varchar](10) NOT NULL,
	[SupInvNo] [varchar](15) NOT NULL,
	[SupInvDate] [datetime] NOT NULL,
	[Remarks] [varchar](200) NULL,
	[PurchaseInvStatus] [varchar](3) NOT NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[ProductTotal] [decimal](18, 2) NOT NULL,
	[VatRate] [decimal](18, 2) NOT NULL,
	[VatAmt] [decimal](18, 2) NOT NULL,
	[PurchaseInvAmt] [decimal](18, 2) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnPurchaseInvoiceHdr] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnPurchaseInvoiceHdr] ([PurchaseInvNo], [PurchaseInvDate], [PurchaseOrderNo], [SupplierID], [SupInvNo], [SupInvDate], [Remarks], [PurchaseInvStatus], [CancelDate], [CancelReason], [ProductTotal], [VatRate], [VatAmt], [PurchaseInvAmt], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'010017777000001', N'0100100001', N'qqqq', CAST(0x0000997C00000000 AS DateTime), N'', N'NPD', NULL, NULL, CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), N'01', N'001', N'7777')
/****** Object:  View [dbo].[vw_TrnProformaInvoice]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnProformaInvoice]
AS
SELECT		dbo.TrnProformaInvoiceHdr.ProformaInvNo, CONVERT(Varchar(10), 
			dbo.TrnProformaInvoiceHdr.ProformaInvDate, 103) AS ProformaInvDate, 
			CONVERT(Varchar(10), dbo.TrnProformaInvoiceHdr.DeliveryDate, 103) AS DeliveryDate, 
			dbo.MstCustomer.CustomerName,dbo.TrnProformaInvoiceHdr.ProformaInvAmt,
			dbo.TrnProformaInvoiceHdr.CompanyID, dbo.TrnProformaInvoiceHdr.BranchID,
			dbo.TrnProformaInvoiceHdr.FinYearID, dbo.TrnProformaInvoiceHdr.VatRate,
			(Case
				When dbo.TrnProformaInvoiceHdr.ConfirmationTag=1 Then 'Yes'
				When dbo.TrnProformaInvoiceHdr.ConfirmationTag=0 Then 'No' End
			) As ConfirmationTag,ProformaInvStatus
FROM		dbo.TrnProformaInvoiceHdr INNER JOIN
			dbo.MstCustomer ON dbo.TrnProformaInvoiceHdr.CustomerID = dbo.MstCustomer.CustomerID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[25] 2[20] 3) )"
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
         Begin Table = "TrnProformaInvoiceHdr"
            Begin Extent = 
               Top = 18
               Left = 290
               Bottom = 124
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "MstCustomer"
            Begin Extent = 
               Top = 24
               Left = 594
               Bottom = 132
               Right = 763
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2130
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5820
         Alias = 1455
         Table = 1920
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnProformaInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnProformaInvoice'
GO
/****** Object:  Table [dbo].[TrnStockTransferHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnStockTransferHdr](
	[StockTransferNo] [varchar](15) NOT NULL,
	[StockTransferDate] [datetime] NOT NULL,
	[FromStockPointID] [varchar](10) NOT NULL,
	[ToStockPointID] [varchar](10) NOT NULL,
	[Remarks] [varchar](200) NULL,
	[StockTransferStatus] [varchar](3) NOT NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnStockTransferHdr] PRIMARY KEY CLUSTERED 
(
	[StockTransferNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnStockTransferHdr] ([StockTransferNo], [StockTransferDate], [FromStockPointID], [ToStockPointID], [Remarks], [StockTransferStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000999700000000 AS DateTime), N'0100100002', N'0100100001', N'FASFAFFASASASFAS', N'CAN', CAST(0x0000999700000000 AS DateTime), N'ZzVzvZvZZZVZVvZZVvZ', N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnStockTransfer_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Created By: Arnab Duta

CREATE  PROCEDURE [dbo].[TrnStockTransfer_Cancel]
(	
		@StockTransferNo		VARCHAR(15),
		@CancelDate				DATETIME,
		@CancelReason			VARCHAR(200),	
		@LogUserId    	 		varchar(12),
		@CompanyID				varchar(2),
		@BranchID				varchar(3),
		@FinYearID				varchar(4)
)
AS

		Declare		@logMsg			Varchar(200)
		Declare		@CurDatetime	DateTime

	Begin Transaction T
		
		Update		TrnStockTransferHdr
		Set			CancelDate=Convert(DateTime,@CancelDate,103),
					CancelReason=@CancelReason,
					StockTransferStatus='CAN'
		Where		StockTransferNo=@StockTransferNo
		And			CompanyID=@CompanyID
		And			BranchID=@BranchID
		And			FinYearID=@FinYearID


		-- Inserting Values into Log Table	
	Set @LogMsg= 'Cancel StockTransfer' + @StockTransferNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg

	If @@Error <> 0
	Begin
		Rollback Transaction T
	End
	Else
	Begin
			Commit Transaction T
	End

	Select @StockTransferNo
GO
/****** Object:  Table [dbo].[TrnStockTransferDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnStockTransferDtl](
	[StockTransferDtlID] [varchar](18) NOT NULL,
	[StockTransferNo] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[BalanceStockQty] [decimal](18, 3) NOT NULL,
	[TransferQty] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnStockTransferDtl] PRIMARY KEY CLUSTERED 
(
	[StockTransferDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnStockTransferDtl] UNIQUE NONCLUSTERED 
(
	[StockTransferNo] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnStockTransferDtl] ([StockTransferDtlID], [StockTransferNo], [ProductID], [Rate], [BalanceStockQty], [TransferQty]) VALUES (N'010017777000001002', N'010017777000001', N'0100100004', CAST(1000.00 AS Decimal(18, 2)), CAST(5.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)))
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrderNo_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

sp_help TrnProformaInvoiceHdr

**/




--Developed By Tridip Bhattacharjee

CREATE PROCEDURE [dbo].[TrnPurchaseOrderNo_Select]

	@PurchaseOrderNo	Varchar(15),
	@CompanyID			Varchar(2),
	@BranchID			Varchar(3),
	@FinYearID			Varchar(4)
	
As


	Begin
		
		Select	PurchaseOrderNo,
				PurchaseOrderDate
		from	TrnPurchaseOrderHdr
		Where	PurchaseOrderStatus in ('NUT','PUT')
		And		CompanyID=@CompanyID
		And		BranchID=@BranchID
		And		FinYearID=@FinYearID
		union
		Select	PurchaseOrderNo,
				PurchaseOrderDate
		from	TrnPurchaseOrderHdr
		Where	PurchaseOrderNo=@PurchaseOrderNo
		And		CompanyID=@CompanyID
		And		BranchID=@BranchID
		And		FinYearID=@FinYearID
		order	By 2 DESC
	End
GO
/****** Object:  Table [dbo].[TrnStockAdjustmentHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnStockAdjustmentHdr](
	[StockAdjustmentNo] [varchar](15) NOT NULL,
	[StockAdjustmentDate] [datetime] NOT NULL,
	[StockPointID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[BookStockQty] [decimal](18, 3) NOT NULL,
	[PhysicalStockQty] [decimal](18, 3) NOT NULL,
	[AdjustStockQty] [decimal](18, 3) NULL,
	[Remarks] [varchar](200) NULL,
	[StockAdjustmentStatus] [varchar](3) NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnStockAdjustmentHdr] PRIMARY KEY CLUSTERED 
(
	[StockAdjustmentNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo], [StockAdjustmentDate], [StockPointID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty], [Remarks], [StockAdjustmentStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000997E00000000 AS DateTime), N'0100100002', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), NULL, N'', N'CAN', CAST(0x0000999100000000 AS DateTime), N'', N'01', N'001', N'7777')
INSERT [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo], [StockAdjustmentDate], [StockPointID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty], [Remarks], [StockAdjustmentStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', CAST(0x0000999200000000 AS DateTime), N'0100100002', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), NULL, N'', N'SAD', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo], [StockAdjustmentDate], [StockPointID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty], [Remarks], [StockAdjustmentStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000003', CAST(0x0000999200000000 AS DateTime), N'0100100002', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'dzczzczZCcZzczc', N'SAD', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo], [StockAdjustmentDate], [StockPointID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty], [Remarks], [StockAdjustmentStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000004', CAST(0x0000999200000000 AS DateTime), N'0100100002', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'trreryererereryery', N'SAD', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo], [StockAdjustmentDate], [StockPointID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty], [Remarks], [StockAdjustmentStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000005', CAST(0x0000999200000000 AS DateTime), N'0100100002', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'GSDSDGSDGSDG', N'SAD', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo], [StockAdjustmentDate], [StockPointID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty], [Remarks], [StockAdjustmentStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000006', CAST(0x0000999200000000 AS DateTime), N'0100100002', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'', N'SAD', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo], [StockAdjustmentDate], [StockPointID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty], [Remarks], [StockAdjustmentStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000007', CAST(0x0000999200000000 AS DateTime), N'0100100002', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'ZXVZXZXVZXVZXVZXV', N'SAD', NULL, NULL, N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnStockAdjustment_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Created By: Arnab Duta

CREATE PROCEDURE [dbo].[TrnStockAdjustment_Cancel]
(	
		@StockAdjustmentNo		VARCHAR(15),
		@CancelDate				DATETIME,
		@CancelReason			VARCHAR(200),	
		@LogUserId    	 			varchar(12),
		@CompanyID				varchar(2),
		@BranchID				varchar(3),
		@FinYearID				varchar(4)
)
AS

		Declare		@logMsg			Varchar(200)
		Declare		@CurDatetime	DateTime

	Begin Transaction T
		
		Update		TrnStockAdjustmentHdr
		Set			CancelDate=Convert(DateTime,@CancelDate,103),
					CancelReason=@CancelReason,
					StockAdjustmentStatus='CAN'
		Where		StockAdjustmentNo=@StockAdjustmentNo
		And			CompanyID=@CompanyID
		And			BranchID=@BranchID
		And			FinYearID=@FinYearID


		-- Inserting Values into Log Table	
	Set @LogMsg= 'Cancel StockAdjustment' + @StockAdjustmentNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg

	If @@Error <> 0
	Begin
		Rollback Transaction T
	End
	Else
	Begin
			Commit Transaction T
	End

	Select @StockAdjustmentNo
GO
/****** Object:  Table [dbo].[TrnStockInDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnStockInDtl](
	[StockInDtlID] [varchar](15) NOT NULL,
	[InDocType] [varchar](3) NOT NULL,
	[InDocNo] [varchar](20) NOT NULL,
	[InDocDate] [datetime] NOT NULL,
	[StockPointID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[BatchNo] [varchar](20) NULL,
	[StoreArea] [varchar](20) NULL,
	[StockINQty] [decimal](18, 3) NOT NULL,
	[UtilQty] [decimal](18, 3) NOT NULL,
	[PurchaseRate] [decimal](18, 2) NOT NULL,
	[VATRate] [decimal](18, 2) NOT NULL,
	[GRNNo] [varchar](20) NULL,
	[GRNDate] [datetime] NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnStockInDtl] PRIMARY KEY CLUSTERED 
(
	[StockInDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnStockInDtl] UNIQUE NONCLUSTERED 
(
	[InDocType] ASC,
	[InDocNo] ASC,
	[StockPointID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000001', N'GRN', N'010010607000001', CAST(0x000099E100000000 AS DateTime), N'0100100001', N'0100100002', NULL, NULL, CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010010607000001', CAST(0x000099A600000000 AS DateTime), N'01', N'001', N'0607')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000002', N'GRN', N'010010607000001', CAST(0x000099E100000000 AS DateTime), N'0100100001', N'0100100003', NULL, NULL, CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010010607000001', CAST(0x000099A600000000 AS DateTime), N'01', N'001', N'0607')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000003', N'GRN', N'010010607000002', CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'0100100001', NULL, NULL, CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010010607000002', CAST(0x000099A700000000 AS DateTime), N'01', N'001', N'0607')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000004', N'GRN', N'010010607000002', CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'0100100002', NULL, NULL, CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010010607000002', CAST(0x000099A700000000 AS DateTime), N'01', N'001', N'0607')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000005', N'GRN', N'010010607000003', CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'0100100002', NULL, NULL, CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010010607000003', CAST(0x000099A700000000 AS DateTime), N'01', N'001', N'0607')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000006', N'GRN', N'010010607000003', CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'0100100005', NULL, NULL, CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010010607000003', CAST(0x000099A700000000 AS DateTime), N'01', N'001', N'0607')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', N'GRN', N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'0100100002', N'0100100004', NULL, NULL, CAST(5.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', N'GRN', N'010017777000002', CAST(0x0000996E00000000 AS DateTime), N'0100100004', N'0100100004', NULL, NULL, CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000003', N'GRN', N'010017777000003', CAST(0x000099A200000000 AS DateTime), N'0100100002', N'0100100001', NULL, NULL, CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010017777000003', CAST(0x0000996600000000 AS DateTime), N'01', N'001', N'7777')
INSERT [dbo].[TrnStockInDtl] ([StockInDtlID], [InDocType], [InDocNo], [InDocDate], [StockPointID], [ProductID], [BatchNo], [StoreArea], [StockINQty], [UtilQty], [PurchaseRate], [VATRate], [GRNNo], [GRNDate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000004', N'GRN', N'010017777000003', CAST(0x000099A200000000 AS DateTime), N'0100100002', N'0100100004', NULL, NULL, CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'010017777000003', CAST(0x0000996600000000 AS DateTime), N'01', N'001', N'7777')
/****** Object:  View [dbo].[vw_TrnStockTransferList]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnStockTransferList]
AS
SELECT     dbo.MstStockPoint.StockPointName AS StockPointFrom, dbo.TrnStockTransferHdr.StockTransferDate, dbo.TrnStockTransferHdr.StockTransferNo, 
                      dbo.TrnStockTransferHdr.FromStockPointID, dbo.TrnStockTransferHdr.ToStockPointID, MstStockPoint_1.StockPointName AS StockPointTo, 
                      dbo.TrnStockTransferHdr.CompanyID, dbo.TrnStockTransferHdr.BranchID, dbo.TrnStockTransferHdr.FinYearID
FROM         dbo.TrnStockTransferHdr INNER JOIN
                      dbo.MstStockPoint ON dbo.TrnStockTransferHdr.FromStockPointID = dbo.MstStockPoint.StockPointID INNER JOIN
                      dbo.MstStockPoint MstStockPoint_1 ON dbo.TrnStockTransferHdr.ToStockPointID = MstStockPoint_1.StockPointID
GO
/****** Object:  View [dbo].[vw_TrnPurchaseOrderHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnPurchaseOrderHdr]
AS
SELECT     dbo.TrnPurchaseOrderHdr.PurchaseOrderNo, dbo.TrnPurchaseOrderHdr.PurchaseOrderDate, dbo.TrnPurchaseOrderHdr.DateofDelivery,
           dbo.TrnPurchaseOrderHdr.PurchaseOrderAmt, dbo.MstSupplier.SupplierName, dbo.MstDepartment.DepartmentName,dbo.TrnPurchaseOrderHdr.PurchaseOrderStatus,
           dbo.TrnPurchaseOrderHdr.FinYearID, dbo.TrnPurchaseOrderHdr.BranchID, dbo.TrnPurchaseOrderHdr.CompanyID
FROM       dbo.MstSupplier INNER JOIN
           dbo.TrnPurchaseOrderHdr ON dbo.MstSupplier.SupplierID = dbo.TrnPurchaseOrderHdr.SupplierID INNER JOIN
           dbo.MstDepartment ON dbo.TrnPurchaseOrderHdr.DepartmentID = dbo.MstDepartment.DepartmentID
GO
/****** Object:  View [dbo].[vw_TrnPurchaseInvoice]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnPurchaseInvoice]

AS

	SELECT		TrnPurchaseInvoiceHdr.PurchaseInvNo, 
				Convert(Varchar(10),TrnPurchaseInvoiceHdr.PurchaseInvDate,103) As PurchaseInvDate,
				TrnPurchaseInvoiceHdr.PurchaseOrderNo,
				MstSupplier.SupplierName, Convert(Varchar(10),TrnPurchaseInvoiceHdr.SupInvDate,103) As SupInvDate,
				TrnPurchaseInvoiceHdr.PurchaseInvStatus,
				TrnPurchaseInvoiceHdr.PurchaseInvAmt,TrnPurchaseInvoiceHdr.BranchID,TrnPurchaseInvoiceHdr.CompanyID,
				TrnPurchaseInvoiceHdr.FinYearID
	FROM		TrnPurchaseInvoiceHdr INNER JOIN
				MstSupplier ON TrnPurchaseInvoiceHdr.SupplierID = MstSupplier.SupplierID
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
         Begin Table = "TrnPurchaseInvoiceHdr"
            Begin Extent = 
               Top = 13
               Left = 347
               Bottom = 121
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "MstSupplier"
            Begin Extent = 
               Top = 78
               Left = 587
               Bottom = 186
               Right = 756
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnPurchaseInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnPurchaseInvoice'
GO
/****** Object:  View [dbo].[vw_TrnJobDetails]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnJobDetails]


AS


SELECT		TrnJobHdr.JobNo,Convert(Varchar(10),TrnJobHdr.JobStartDate,103) As JobStartDate, 
			TrnJobHdr.JobStatus,TrnJobHdr.LabWorkTotal, TrnJobHdr.CompanyID,
			TrnJobHdr.BranchID, TrnJobHdr.FinYearID, MstCustomer.CustomerName
FROM		TrnJobHdr INNER JOIN
			MstCustomer ON TrnJobHdr.CustomerID = MstCustomer.CustomerID
And			MstCustomer.CompanyID=TrnJobHdr.CompanyID
And			MstCustomer.BranchID=TrnJobHdr.BranchID
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
         Begin Table = "TrnJobHdr"
            Begin Extent = 
               Top = 12
               Left = 346
               Bottom = 120
               Right = 513
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MstCustomer"
            Begin Extent = 
               Top = 102
               Left = 633
               Bottom = 210
               Right = 802
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnJobDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnJobDetails'
GO
/****** Object:  Table [dbo].[TrnPurchaseInvoiceDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnPurchaseInvoiceDtl](
	[PurchaseInvDtlID] [varchar](18) NOT NULL,
	[PurchaseInvNo] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[ProductRate] [decimal](18, 2) NOT NULL,
	[ProductQty] [decimal](18, 3) NOT NULL,
	[ProductAmt] [decimal](18, 2) NOT NULL,
	[GRNQty] [decimal](18, 3) NOT NULL,
	[PORate] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TrnPurchaseInvoiceDtl] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnPurchaseInvoiceDtl', @level2type=N'COLUMN',@level2name=N'ProductRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnPurchaseInvoiceDtl', @level2type=N'COLUMN',@level2name=N'ProductQty'
GO
INSERT [dbo].[TrnPurchaseInvoiceDtl] ([PurchaseInvDtlID], [PurchaseInvNo], [ProductID], [ProductRate], [ProductQty], [ProductAmt], [GRNQty], [PORate]) VALUES (N'010017777000001001', N'010017777000001', N'0100100004', CAST(1000.00 AS Decimal(18, 2)), CAST(5.000 AS Decimal(18, 3)), CAST(5000.00 AS Decimal(18, 2)), CAST(5.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)))
/****** Object:  StoredProcedure [dbo].[TrnPurchaseInvoice_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


delete from TrnPurchaseInvoiceDtl

delete from TrnPurchaseInvoiceHdr

select * from TrnGRNHdr

select * from TrnPurchaseInvoiceHdr

select * from TrnPurchaseInvoiceDtl

update TrnGRNHdr set purchaseinvno=null where GRNNo in (010020607000001,030077777000001,030077777000002)



TrnPurchaseInvoice_Update	@PurchaseInvNo='030077777000001',
							@PurchaseOrderNo='030077777000001',
							@PurchaseInvDate='25/02/2007',
							@SupplierID='0000000010',
							@SupInvDate='25/02/2007',
							@Remarks='Good',	
							@SupInvNo='INV_00001',
							@ListOfGRN='030077777000001,030077777000002,',
							@VATRate=7.0,
							@VATAmt=4.0,
							@ProductTotal=250.20,
							@PurchaseInvAmt=4584.23,
							@DetailXml=
									'<NewDataSet>
									  <PurchaseInvDetail>
										<productid>0000000002</productid>
										<unit>Pieces</unit>
										<POrate>25458.00</POrate>
										<InvRate>25458.00</InvRate>
										<GRNqty>2.000</GRNqty>
										<InvQty>2.000</InvQty>
										<Amount>50916.00</Amount>
									  </PurchaseInvDetail>
									  <PurchaseInvDetail>
										<productid>0000000003</productid>
										<unit>Pieces</unit>
										<POrate>30000.00</POrate>
										<InvRate>30000.00</InvRate>
										<GRNqty>2.000</GRNqty>
										<InvQty>2.000</InvQty>
										<Amount>60000.00</Amount>
									  </PurchaseInvDetail>
									  <PurchaseInvDetail>
										<productid>0000000005</productid>
										<unit>pc</unit>
										<POrate>26000.00</POrate>
										<InvRate>26000.00</InvRate>
										<GRNqty>2.000</GRNqty>
										<InvQty>2.000</InvQty>
										<Amount>52000.00</Amount>
									  </PurchaseInvDetail>
									  <PurchaseInvDetail>
										<productid>0000000003</productid>
										<unit>Pieces</unit>
										<POrate>30000.00</POrate>
										<InvRate>30000.00</InvRate>
										<GRNqty>1.000</GRNqty>
										<InvQty>1.000</InvQty>
										<Amount>30000.00</Amount>
									  </PurchaseInvDetail>
									  <PurchaseInvDetail>
										<productid>0000000005</productid>
										<unit>pc</unit>
										<POrate>26000.00</POrate>
										<InvRate>26000.00</InvRate>
										<GRNqty>3.000</GRNqty>
										<InvQty>3.000</InvQty>
										<Amount>78000.00</Amount>
									  </PurchaseInvDetail>
									</NewDataSet>',
							@LogUserId='indranil',
							@CompanyId='03',
							@BranchId='007',
							@FinYearID='7777'
*/


CREATE procedure [dbo].[TrnPurchaseInvoice_Update]

	@PurchaseInvNo				Varchar(15),
	@PurchaseOrderNo			Varchar(15),
	@PurchaseInvDate			Varchar(10),
	@SupplierID					Varchar(10),
	@SupInvDate					Varchar(10),
	@Remarks  					Varchar(200),	
	@SupInvNo					Varchar(15),
	@ListOfGRN					Varchar(8000),

	@VATRate					Decimal(18,2),
	@VATAmt						Decimal(18,2),
	@ProductTotal				Decimal(18,2),
	@PurchaseInvAmt				Decimal(18,2),
	@DetailXml					Ntext,
	

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)

As


	Declare			@intCntr					as int
	Declare			@logMsg						as Varchar(200)
	Declare			@CurDatetime				as datetime	
	Declare			@intError					as integer
	Declare			@NewPurchaseInvNo			as Varchar(15)
	Declare			@NewPurchaseInvDtlID		as Varchar(18)
	Declare			@AutoGenPrefix				as Varchar(9)

	Declare			@XMLFormat					Int

	Declare			@ProductID					Varchar(10)
	Declare			@Unit						Varchar(50)
	Declare			@PORate						Decimal(18,2)
	Declare			@InvRate					Decimal(18,2)
	Declare			@InvQty						Decimal(18,3)
	Declare			@GRNQty						Decimal(18,3)
	Declare			@Amount						Decimal(18,2)
	Declare			@GRNSQL						Varchar(8000)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	

	IF @PurchaseOrderNo=''
	BEGIN
	        select 'Select Purchase Order'
	        return
	END

	IF @PurchaseInvDate=''
	BEGIN
	        select 'Purchase Invoice date can not be empty'
	        return
	END

	IF @SupInvDate = ''
	BEGIN
	        select 'Supplier Invoice date can not be empty'
	        return
	END
	
	If @SupplierID = ''
	BEGIN
		select 'Please Select Supplier'
		return
	END

	IF @SupplierID <>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstSupplier
		where   (SupplierID = @SupplierID)

		if @intcntr  <= 0
		begin
         	select 'Invalid Supplier'
			return
		end
	END

	If @SupInvNo = ''
	BEGIN
		select 'Please Give Supplier Invoice No.'
        return
	END

	If @PurchaseInvAmt <= 0
	Begin
		Select 'Purchase Invoice Amount can not be empty'
	return
	End


	If @CompanyId = ''
	Begin
		Select 'Please give the Company'
	return
	End

	If @BranchId = ''
	Begin
		Select 'Please give the Branch'
	return
	End

	If @FinYearID = ''
	Begin
		Select 'Please give the Financial Year'
	return
	End


	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml


	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select productid,unit,POrate,InvRate,GRNQty,InvQty,Amount
	From Openxml (@XMLFormat, '/NewDataSet/PurchaseInvDetail', 2)
	With 
		(
			productid	Varchar(10),
			unit		Varchar(50),
			POrate		decimal(18,2),
			InvRate		decimal(18,2),
			GRNqty		decimal(18,3),
			InvQty		decimal(18,3),
			Amount		decimal(18,2)

		)


	BEGIN TRANSACTION

	Update		TrnPurchaseInvoiceHdr
	Set			PurchaseInvDate=Convert(Datetime,@PurchaseInvDate,103),
				PurchaseOrderNo=@PurchaseOrderNo,
				SupplierID=@SupplierID,
				SupInvNo=@SupInvNo,
				SupInvDate=Convert(Datetime,@SupInvDate,103),
				Remarks=@Remarks,
				ProductTotal=@ProductTotal,
				VATRate=@VATRate,
				VATAmt=@VATAmt,
				PurchaseInvAmt=@PurchaseInvAmt,
				CompanyID=@CompanyID,
				BranchID=@BranchID,
				FinYearID=@FinYearID
	Where		PurchaseInvNo=@PurchaseInvNo

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


	/*Delete	from TrnPurchaseInvoiceDtl
	Where 	PurchaseInvNo = @PurchaseInvNo
	and ProductID not in (Select productid
			 from OPENXML (@XMLFormat, '/NewDataSet/PurchaseInvDetail', 2)
			 with (	productid  varchar(10)))*/

		Delete		From TrnPurchaseInvoiceDtl
		Where		PurchaseInvNo=@PurchaseInvNo

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@Unit,@PORate,@InvRate,@GRNqty,@InvQty,@Amount

	While (@@Fetch_Status=0)
	Begin



		/*print 'Product'+@ProductID
		print 'Unit'+@Unit
		print 'PORate'+convert(varchar,@PORate)
		print 'Inv Rate'+convert(varchar,@InvRate)
		print 'GRN Qty'+convert(varchar,@GRNqty)
		print 'InvQty'+convert(varchar,@InvQty)
		print 'Amt'+convert(varchar,@Amount)*/
			
		IF @ProductID=''
		Begin
			select 'Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid product id'
				return
			end
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END

		IF @PORate <= 0 
		Begin
			select 'PO Rate can not be empty'
			return
		END

		IF @InvRate <= 0 
		Begin
			select 'Invoice Rate can not be empty'
			return
		END

		IF @InvQty <= 0 
		Begin
			select 'Invoice Quantity can not be empty'
			return
		END

		IF @GRNqty <= 0
		Begin
			select 'GRN Quantity can not be empty'
			return
		END

		IF @Amount <= 0
		Begin
			select 'Amount can not be empty'
			return
		END

		/*Update			TrnPurchaseInvoiceDtl
		Set				ProductID=@ProductID,
						ProductRate=@InvRate,
						ProductQty=@InvQty,
						ProductAmt=@Amount,
						GRNQty=@GRNqty,
						PORate=@PORate
		Where			PurchaseInvNo=@PurchaseInvNo*/

		exec AutoGenerateID 'TrnPurchaseInvoiceDtl' , 'PurchaseInvDtlID',18,@PurchaseInvNo,@NewPurchaseInvDtlID output

		--print 'Insert'
		INSERT INTO TrnPurchaseInvoiceDtl
		(PurchaseInvDtlID,PurchaseInvNo,ProductID,ProductRate,ProductQty,ProductAmt,GRNQty,PORate)
		Values 
		(@NewPurchaseInvDtlID,@PurchaseInvNo,@ProductID,@InvRate,@InvQty,@Amount,@GRNqty,@PORate)

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @ProductID,@Unit,@PORate,@InvRate,@GRNqty,@InvQty,@Amount
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	----- Updating the Inv No in GRN table

	Set @ListOfGRN=Substring(@ListOfGRN,1,Len(@ListOfGRN)-1)
	
	Set		@GRNSQL='Update	TrnGRNHdr
					 Set	PurchaseInvNo='''+@PurchaseInvNo + '''' +' Where GRNNo In ('+@ListOfGRN +')'
	Exec(@GRNSQL)

	-- Inserting Values into Log Table
	Set @LogMsg= 'Update Pruchase Invoice' + @PurchaseInvNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @PurchaseInvNo
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseInvoice_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnGRNHdr

010020607000001


select * from TrnPurchaseInvoiceHdr
select * from TrnPurchaseInvoiceDtl

delete from TrnPurchaseInvoiceHdr


030077777000001

*/


CREATE procedure [dbo].[TrnPurchaseInvoice_Insert]

	@PurchaseInvNo				Varchar(15),
	@PurchaseOrderNo			Varchar(15),
	@PurchaseInvDate			Varchar(10),
	@SupplierID					Varchar(10),
	@SupInvDate					Varchar(10),
	@Remarks  					Varchar(200),	
	@SupInvNo					Varchar(15),
	@ListOfGRN					Varchar(8000),

	@VATRate					Decimal(18,2),
	@VATAmt						Decimal(18,2),
	@ProductTotal				Decimal(18,2),
	@PurchaseInvAmt				Decimal(18,2),
	@DetailXml					Ntext,
	

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)

As


	Declare			@intCntr					as int
	Declare			@logMsg						as Varchar(200)
	Declare			@CurDatetime				as datetime	
	Declare			@intError					as integer
	Declare			@NewPurchaseInvNo			as Varchar(15)
	Declare			@NewPurchaseInvDtlID		as Varchar(18)
	Declare			@AutoGenPrefix				as Varchar(9)

	Declare			@XMLFormat					Int

	Declare			@ProductID					Varchar(10)
	Declare			@Unit						Varchar(50)
	Declare			@PORate						Decimal(18,2)
	Declare			@InvRate					Decimal(18,2)
	Declare			@InvQty						Decimal(18,3)
	Declare			@GRNQty						Decimal(18,3)
	Declare			@Amount						Decimal(18,2)
	Declare			@GRNSQL						Varchar(8000)


	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here
	-- Checking the Primary key violation

	
	select  @intcntr = count(*)
	from   	TrnPurchaseInvoiceHdr
	where   (PurchaseInvNo = @PurchaseInvNo)

	if @intcntr  > 0
	begin
	        select 'Purchase Invoice already exists'
	        return
	end

	IF @PurchaseOrderNo=''
	BEGIN
	        select 'Select Purchase Order'
	        return
	END

	IF @PurchaseInvDate=''
	BEGIN
	        select 'Purchase Invoice date can not be empty'
	        return
	END

	IF @SupInvDate = ''
	BEGIN
	        select 'Supplier Invoice date can not be empty'
	        return
	END
	
	If @SupplierID = ''
	BEGIN
		select 'Please Select Supplier'
		return
	END

	IF @SupplierID <>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstSupplier
		where   (SupplierID = @SupplierID)

		if @intcntr  <= 0
		begin
         	select 'Invalid Supplier'
			return
		end
	END

	If @SupInvNo = ''
	BEGIN
		select 'Please Give Supplier Invoice No.'
        return
	END

	If @PurchaseInvAmt <= 0
	Begin
		Select 'Purchase Invoice Amount can not be empty'
	return
	End


	If @CompanyId = ''
	Begin
		Select 'Please give the Company'
	return
	End

	If @BranchId = ''
	Begin
		Select 'Please give the Branch'
	return
	End

	If @FinYearID = ''
	Begin
		Select 'Please give the Financial Year'
	return
	End


	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml


	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select productid,unit,POrate,InvRate,GRNQty,InvQty,Amount
	From Openxml (@XMLFormat, '/NewDataSet/PurchaseInvDetail', 2)
	With 
		(
			productid	Varchar(10),
			unit		Varchar(50),
			POrate		decimal(18,2),
			InvRate		decimal(18,2),
			GRNqty		decimal(18,3),
			InvQty		decimal(18,3),
			Amount		decimal(18,2)

		)


	BEGIN TRANSACTION

	-- Auto Generate New ProformaInvoice No
	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnPurchaseInvoiceHdr' , 'PurchaseInvNo', 15 , @AutoGenPrefix , @NewPurchaseInvNo output

	Insert Into TrnPurchaseInvoiceHdr
	(PurchaseInvNo,PurchaseInvDate,PurchaseOrderNo,SupplierID,SupInvNo,SupInvDate,Remarks,
	ProductTotal,VATRate,VATAmt,PurchaseInvAmt,CompanyID,BranchID,FinYearID)
	Values
	(@NewPurchaseInvNo,Convert(Datetime,@PurchaseInvDate,103),@PurchaseOrderNo,@SupplierID,@SupInvNo,
	Convert(Datetime,@SupInvDate,103),@Remarks,@ProductTotal,@VATRate,@VATAmt,@PurchaseInvAmt,
	@CompanyID,@BranchID,@FinYearID)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@Unit,@PORate,@InvRate,@GRNqty,@InvQty,@Amount

	While (@@Fetch_Status=0)
	Begin

			
		IF @ProductID=''
		Begin
			select 'Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid product id'
				return
			end
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END

		IF @PORate <= 0 
		Begin
			select 'PO Rate can not be empty'
			return
		END

		IF @InvRate <= 0 
		Begin
			select 'Invoice Rate can not be empty'
			return
		END

		IF @InvQty <= 0 
		Begin
			select 'Invoice Quantity can not be empty'
			return
		END

		IF @GRNqty <= 0
		Begin
			select 'GRN Quantity can not be empty'
			return
		END

		IF @Amount <= 0
		Begin
			select 'Amount can not be empty'
			return
		END

		
		-- Auto Generate New PurchaseOrderDtlID
		exec  AutoGenerateID 'TrnPurchaseInvoiceDtl','PurchaseInvDtlID',18,@NewPurchaseInvNo,@NewPurchaseInvDtlID output

		INSERT TrnPurchaseInvoiceDtl(PurchaseInvDtlID,PurchaseInvNo,ProductID,ProductRate,ProductQty,ProductAmt,
		GRNQty,PORate)
		Values (@NewPurchaseInvDtlID,@NewPurchaseInvNo,@ProductID,@InvRate,@InvQty,@Amount,@GRNqty,@PORate)	

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @ProductID,@Unit,@PORate,@InvRate,@GRNqty,@InvQty,@Amount
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	----- Updating the Inv No in GRN table

	Set @ListOfGRN=Substring(@ListOfGRN,1,Len(@ListOfGRN)-1)
	
	Set		@GRNSQL='Update	TrnGRNHdr
					 Set	PurchaseInvNo='''+@NewPurchaseInvNo + '''' +' Where GRNNo In ('+@ListOfGRN +')'
	Exec(@GRNSQL)


	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Pruchase Invoice' + @NewPurchaseInvNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewPurchaseInvNo
GO
/****** Object:  StoredProcedure [dbo].[TrnProformaInvoice_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from TrnProformaInvoiceDtl
select * from TrnProformaInvoiceHdr 
where ProformaInvNo='030077777000001'

Developed By		: Indranil Roy

TrnProformaInvoice_Select '030077777000001','V'

select * from TrnProformaInvoiceDtl where ProformaInvNo='030077777000001'

*/


CREATE PROCEDURE [dbo].[TrnProformaInvoice_Select]

	@ProformaInvNo		Varchar(15),
	@Mode				Varchar(1)='',
	@CompanyID			Varchar(2),
	@BranchID			Varchar(3),
	@FinYearID			Varchar(4)

As

BEGIN
	If @Mode = ''
	Begin
		Select		ProformaInvNo,Convert(Varchar(10),ProformaInvDate,103) As ProformaInvDate
					,CustomerID,Convert(Varchar(10),DeliveryDate,103) As DeliveryDate,ConfirmationTag,
					Remarks,ProductTotal,VatRate,VatAmt,ProformaInvAmt,ProformaInvStatus,
					Convert(Varchar(10),CancelDate,103) As CancelDate,CancelReason,CompanyID,BranchID,FinYearID
		From		TrnProformaInvoiceHdr
		Where		ProformaInvNo=@ProformaInvNo
		And			CompanyID=@CompanyID
		And			BranchID=@BranchID
		And			FinYearID=@FinYearID
		
					SELECT Count(TPID.ProformaInvNo) as TotalRows 
					From		TrnProformaInvoiceDtl TPID
					Inner Join	TrnProformaInvoiceHdr TPIH On TPIH.ProformaInvNo=TPID.ProformaInvNo
					And			TPIH.CompanyID=@CompanyID
					And			TPIH.BranchID=@BranchID
					And			TPIH.FinYearID=@FinYearID
					Where		TPID.ProformaInvNo=@ProformaInvNo
	End
	Else
	Begin
		Select		TPIH.ProformaInvNo,Convert(Varchar(10),TPIH.ProformaInvDate,103) As ProformaInvDate
					,C.CustomerName,Convert(Varchar(10),TPIH.DeliveryDate,103) As DeliveryDate,TPIH.ConfirmationTag,
					TPIH.Remarks,TPIH.ProductTotal,TPIH.VatRate,TPIH.VatAmt,TPIH.ProformaInvAmt,
					TPIH.ProformaInvStatus,Convert(Varchar(10),TPIH.CancelDate,103) As CancelDate,TPIH.CancelReason
		From		TrnProformaInvoiceHdr TPIH
		Inner Join	MstCustomer C On TPIH.CustomerID=C.CustomerID
		And			C.CompanyID=@CompanyID
		And			C.BranchID=@BranchID

		Where		ProformaInvNo=@ProformaInvNo
		And			TPIH.CompanyID=@CompanyID
		And			TPIH.BranchID=@BranchID
		And			TPIH.FinYearID=@FinYearID
	End
	
	SELECT		MP.ProductID,MP.ProductName,MP.ProductUOM,TPID.ProformaInvDtlID,TPID.ProformaInvNo,
				TPID.ProductQty,TPID.ProductRate,TPID.ProductAmt
	FROM		TrnProformaInvoiceDtl TPID
	INNER JOIN	MstProduct MP ON TPID.ProductID = MP.ProductID
	Where		TPID.ProformaInvNo=@ProformaInvNo
END
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseInvoice_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from TrnProformaInvoiceHdr
*/


CREATE procedure [dbo].[TrnPurchaseInvoice_Cancel]

	@PurchaseInvNo				Varchar(15),
	@CancelDate					Varchar(10),
	@CancelReason				Varchar(200),
	@CompanyID					Varchar(2),
	@BranchID					Varchar(3),
	@FinYearID					Varchar(4)


As

	Begin Transaction T
		
		Update		TrnPurchaseInvoiceHdr
		Set			CancelDate=Convert(DateTime,@CancelDate,103),
					CancelReason=@CancelReason,
					PurchaseInvStatus='CAN'
		Where		PurchaseInvNo=@PurchaseInvNo
		And			CompanyID=@CompanyID
		And			BranchID=@BranchID
		And			FinYearID=@FinYearID

	If @@Error <> 0
	Begin
		Rollback Transaction T
	End
	Else
	Begin
			Commit Transaction T
	End

	Select @PurchaseInvNo
GO
/****** Object:  Table [dbo].[TrnPurchaseOrderDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnPurchaseOrderDtl](
	[PurchaseOrderDtlID] [varchar](18) NOT NULL,
	[PurchaseOrderNo] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[ProductQty] [decimal](18, 3) NOT NULL,
	[ProductRate] [decimal](18, 2) NOT NULL,
	[ProductAmt] [decimal](18, 2) NOT NULL,
	[UtilQty] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnPurchaseOrderDtl] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnPurchaseOrderDtl] UNIQUE NONCLUSTERED 
(
	[PurchaseOrderNo] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnPurchaseOrderDtl', @level2type=N'COLUMN',@level2name=N'ProductQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnPurchaseOrderDtl', @level2type=N'COLUMN',@level2name=N'ProductRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnPurchaseOrderDtl', @level2type=N'COLUMN',@level2name=N'ProductAmt'
GO
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000001001', N'010010607000001', N'0100100002', CAST(2.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(1.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000001002', N'010010607000001', N'0100100003', CAST(5.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(1.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000002001', N'010010607000002', N'0100100002', CAST(2.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000002002', N'010010607000002', N'0100100001', CAST(2.000 AS Decimal(18, 3)), CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000003001', N'010010607000003', N'0100100002', CAST(2.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(1.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000003002', N'010010607000003', N'0100100001', CAST(2.000 AS Decimal(18, 3)), CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(1.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000004001', N'010010607000004', N'0100100002', CAST(4.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), CAST(2.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010010607000004002', N'010010607000004', N'0100100005', CAST(4.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), CAST(2.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010011478000001001', N'010011478000001', N'0100100002', CAST(33.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(33000.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010017777000001001', N'010017777000001', N'0100100004', CAST(20.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(7.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010017777000001002', N'010017777000001', N'0100100001', CAST(0.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010017777000002001', N'010017777000002', N'0100100004', CAST(2.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(1.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010017777000002002', N'010017777000002', N'0100100001', CAST(5.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(2.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnPurchaseOrderDtl] ([PurchaseOrderDtlID], [PurchaseOrderNo], [ProductID], [ProductQty], [ProductRate], [ProductAmt], [UtilQty]) VALUES (N'010017777000003001', N'010017777000003', N'0100100002', CAST(3.000 AS Decimal(18, 3)), CAST(1000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)))
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrder_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 24/04/2007
/*
<NewDataSet>
	<PurchaseOrderDetail>  
		<productid>0000000001</productid>  
		<unit>Pieces</unit>  
		<rate>2.00</rate>  
		<qty>2.000</qty>  
		<amount>4.00</amount>
	</PurchaseOrderDetail>
</NewDataSet>

*/


CREATE PROCEDURE [dbo].[TrnPurchaseOrder_Update]
(
	@PurchaseOrderNo		as varchar(15)=null,
	@PurchaseOrderDate		as  varchar(10),
	@DateofDelivery		as  varchar(10),
	@SupplierID  			as  varchar(10) = null,
	@DepartmentID  		as  varchar(10) = null,
	@ProductGroupID  		as  varchar(10) = null,
	@PaymentTerms  		as  varchar(100) = null,
	@Remarks  			as  varchar(200) = null,
	@VATRate			as  Decimal(18,2),
	@VATAmt			as  Decimal(18,2),
	@ProductTotalAmt		as  Decimal(18,2),
	@PurchaseOrderAmt		as  Decimal(18,2),
	@DetailXml			as NTEXT,

	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        			as varchar(3),
	@FinYearID        		as varchar(4)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewPurchaseOrderNo as varchar(15)
	Declare @NewPurchaseOrderDtlID as varchar(18)
	Declare @AutoGenPrefix as varchar(9)

	Declare @XMLFormat Int
	Declare @ProductID as Varchar(10)
	Declare @Unit as varchar(50)
	Declare @Rate as Decimal(18,2)
	Declare @Qty as Decimal(18,3)
	Declare @Amount as Decimal(18,2)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	

	IF @PurchaseOrderDate=''
	BEGIN
	        select 'Purchase order date can not be empty'
	        return
	END

	IF @DateofDelivery=''
	BEGIN
	        select 'Date of delivery can not be empty'
	        return
	END

	IF @SupplierID=''
	BEGIN
	        select 'Select supplier'
	        return
	END

	IF @SupplierID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstSupplier
		where   (SupplierID = @SupplierID)

		if @intcntr  <= 0
		begin
		         	select 'Invalid supplier id'
			return
		end
	END


	IF @DepartmentID=''
	BEGIN
	        select 'Select department id'
	        return
	END

	IF @DepartmentID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstDepartment
		where   (DepartmentID = @DepartmentID)

		if @intcntr  <= 0
		begin
		         	select 'Invalid department id'
			return
		end
	END


	IF @ProductGroupID=''
	BEGIN
	        select 'Select product group id'
	        return
	END

	IF @ProductGroupID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstProductGroup
		where   (ProductGroupID = @ProductGroupID)


		if @intcntr  <= 0
		begin
			select 'Invalid product group id'
			return
		end
	END

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select productid,unit,rate,qty,amount
	From Openxml (@XMLFormat, '/NewDataSet/PurchaseOrderDetail', 2)
	With 
		(
			productid Varchar(10),
			unit Varchar(50),
			rate decimal(18,2),
			qty decimal(18,3),
			amount decimal(18,2)

		)


	BEGIN TRANSACTION   

	-- Auto Generate New PurchaseOrderNo
	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnPurchaseOrderHdr' , 'PurchaseOrderNo' , 15 , @AutoGenPrefix , @NewPurchaseOrderNo output     

	Update TrnPurchaseOrderHdr Set PurchaseOrderDate=Convert(Datetime,@PurchaseOrderDate,103),
	DateofDelivery=Convert(Datetime,@DateofDelivery,103),
	SupplierID=@SupplierID,
	DepartmentID=@DepartmentID,
	ProductGroupID=@ProductGroupID,
	PaymentTerms=@PaymentTerms,
	Remarks=@Remarks,
	ProductTotalAmt=@ProductTotalAmt,
	VATRate=@VATRate,
	VATAmt=@VATAmt,
	PurchaseOrderAmt=@PurchaseOrderAmt,
	CompanyID=@CompanyID,
	BranchID=@BranchID,
	FinYearID=@FinYearID
	Where PurchaseOrderNo=@PurchaseOrderNo

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Delete from TrnPurchaseOrderDtl
	Where 	PurchaseOrderNo = @PurchaseOrderNo
	and ProductID not in (Select productid
			 from OPENXML (@XMLFormat, '/NewDataSet/PurchaseOrderDetail', 2)
			 with (	productid  varchar(10)))


	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount

	While (@@Fetch_Status=0)
	Begin

		IF @ProductID=''
		Begin
			select 'Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid product id'
				return
			end
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END


		Select  @intcntr = count(*)
		From   	TrnPurchaseOrderDtl
		Where   (ProductID = @ProductID and PurchaseOrderNo=@PurchaseOrderNo)

		IF @intcntr  <= 0
			Begin

				-- Auto Generate New PurchaseOrderDtlID
				exec  AutoGenerateID 'TrnPurchaseOrderDtl' , 'PurchaseOrderDtlID' , 18  , @PurchaseOrderNo,@NewPurchaseOrderDtlID output  

				INSERT TrnPurchaseOrderDtl 	
				(PurchaseOrderDtlID,PurchaseOrderNo,ProductID,ProductQty,ProductRate, ProductAmt)
				Values 
				(@NewPurchaseOrderDtlID,@PurchaseOrderNo,@ProductID,@Qty,@Rate,@Amount)	
			End
		Else
			Begin
				Update TrnPurchaseOrderDtl 
				Set 	ProductQty=@Qty,
					ProductRate=@Rate,
					ProductAmt=@Amount 
				Where 	PurchaseOrderNo=@PurchaseOrderNo
				And 	ProductID=@ProductID
			End
		

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update Purchase Order' + @PurchaseOrderNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @PurchaseOrderNo
  
 END
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrder_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 24/04/2007
/*
<NewDataSet>
	<PurchaseOrderDetail>  
		<productid>0000000001</productid>  
		<unit>Pieces</unit>  
		<rate>2.00</rate>  
		<qty>2.000</qty>  
		<amount>4.00</amount>
	</PurchaseOrderDetail>
</NewDataSet>

*/


CREATE PROCEDURE [dbo].[TrnPurchaseOrder_Insert]
(
	@PurchaseOrderNo		as varchar(15)=null,
	@PurchaseOrderDate		as  varchar(10),
	@DateofDelivery		as  varchar(10),
	@SupplierID  			as  varchar(10) = null,
	@DepartmentID  		as  varchar(10) = null,
	@ProductGroupID  		as  varchar(10) = null,
	@PaymentTerms  		as  varchar(100) = null,
	@Remarks  			as  varchar(200) = null,
	@VATRate			as  Decimal(18,2),
	@VATAmt			as  Decimal(18,2),
	@ProductTotalAmt		as  Decimal(18,2),
	@PurchaseOrderAmt		as  Decimal(18,2),
	@DetailXml			as NTEXT,

	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        			as varchar(3),
	@FinYearID        		as varchar(4)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewPurchaseOrderNo as varchar(15)
	Declare @NewPurchaseOrderDtlID as varchar(18)
	Declare @AutoGenPrefix as varchar(9)

	Declare @XMLFormat Int
	Declare @ProductID as Varchar(10)
	Declare @Unit as varchar(50)
	Declare @Rate as Decimal(18,2)
	Declare @Qty as Decimal(18,3)
	Declare @Amount as Decimal(18,2)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*)
	from   	TrnPurchaseOrderHdr
	where   (PurchaseOrderNo = @PurchaseOrderNo)

	if @intcntr  > 0
	begin
	        select 'Purchase order already exists'
	        return
	end

	IF @PurchaseOrderDate=''
	BEGIN
	        select 'Purchase order date can not be empty'
	        return
	END

	IF @DateofDelivery=''
	BEGIN
	        select 'Date of delivery can not be empty'
	        return
	END

	IF @SupplierID=''
	BEGIN
	        select 'Select supplier'
	        return
	END

	IF @SupplierID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstSupplier
		where   (SupplierID = @SupplierID)

		if @intcntr  <= 0
		begin
		         	select 'Invalid supplier id'
			return
		end
	END


	IF @DepartmentID=''
	BEGIN
	        select 'Select department id'
	        return
	END

	IF @DepartmentID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstDepartment
		where   (DepartmentID = @DepartmentID)

		if @intcntr  <= 0
		begin
		         	select 'Invalid department id'
			return
		end
	END


	IF @ProductGroupID=''
	BEGIN
	        select 'Select product group id'
	        return
	END

	IF @ProductGroupID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstProductGroup
		where   (ProductGroupID = @ProductGroupID)


		if @intcntr  <= 0
		begin
			select 'Invalid product group id'
			return
		end
	END

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select productid,unit,rate,qty,amount
	From Openxml (@XMLFormat, '/NewDataSet/PurchaseOrderDetail', 2)
	With 
		(
			productid Varchar(10),
			unit Varchar(50),
			rate decimal(18,2),
			qty decimal(18,3),
			amount decimal(18,2)

		)


	BEGIN TRANSACTION   

	-- Auto Generate New PurchaseOrderNo
	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnPurchaseOrderHdr' , 'PurchaseOrderNo' , 15 , @AutoGenPrefix , @NewPurchaseOrderNo output     

	Insert Into TrnPurchaseOrderHdr
	(PurchaseOrderNo,PurchaseOrderDate,DateofDelivery,SupplierID,DepartmentID,ProductGroupID,PaymentTerms,Remarks,
	ProductTotalAmt,VATRate,VATAmt,PurchaseOrderAmt,CompanyID,BranchID,FinYearID)
	Values
	(@NewPurchaseOrderNo,Convert(Datetime,@PurchaseOrderDate,103),Convert(Datetime,@DateofDelivery,103),@SupplierID,@DepartmentID,@ProductGroupID,@PaymentTerms,@Remarks,
	@ProductTotalAmt,@VATRate,@VATAmt,@PurchaseOrderAmt,@CompanyID,@BranchID,@FinYearID)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount

	While (@@Fetch_Status=0)
	Begin

		IF @ProductID=''
		Begin
			select 'Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid product id'
				return
			end
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END

		IF @Unit='' 
		Begin
			select 'Unit can not be empty'
			return
		END

		-- Auto Generate New PurchaseOrderDtlID
		exec  AutoGenerateID 'TrnPurchaseOrderDtl' , 'PurchaseOrderDtlID' , 18  , @NewPurchaseOrderNo,@NewPurchaseOrderDtlID output  

		INSERT TrnPurchaseOrderDtl 	(PurchaseOrderDtlID,PurchaseOrderNo,ProductID,ProductQty,ProductRate, ProductAmt)
		Values (@NewPurchaseOrderDtlID,@NewPurchaseOrderNo,@ProductID,@Qty,@Rate,@Amount)	

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Purchase Order' + @NewPurchaseOrderNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewPurchaseOrderNo
  
 END
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrder_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 26/04/2007
CREATE PROCEDURE [dbo].[TrnPurchaseOrder_Delete]
(
	@PurchaseOrderNo	 	as varchar(15),
	@LogUserId    	 		as varchar(12)
)
As 
Begin
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	BEGIN TRANSACTION   

	Delete  from  TrnPurchaseOrderDtl Where PurchaseOrderNo=@PurchaseOrderNo
	Delete   from  TrnPurchaseOrderHdr Where PurchaseOrderNo=@PurchaseOrderNo
	

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Purchase Order' + @PurchaseOrderNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully. '+@PurchaseOrderNo
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstProduct_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--- Author : Swarnali -- 25/04/2007
CREATE PROCEDURE [dbo].[MstProduct_Delete] 
(
	@ProductID	 as varchar(10),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin	
	Declare @intCnt as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	Set @intCnt = 0

	BEGIN TRANSACTION   

	Select	@intCnt= Count(*)
	From	TrnPurchaseOrderDtl
	where	ProductID = @ProductID  	
	if @intCnt  > 0
		begin 
			Select 'Delete is not allowed as purchase order already exist !!!!'
			return
		end
	
	Delete from  MstProduct 
	Where ProductID=@ProductID

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Product  Data' + @ProductID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully.'
  
END
GO
/****** Object:  Table [dbo].[TrnGRNHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnGRNHdr](
	[GRNNo] [varchar](15) NOT NULL,
	[GRNDate] [datetime] NOT NULL,
	[SalesReturnTag] [varchar](1) NOT NULL,
	[SupplierID] [varchar](10) NULL,
	[CustomerID] [varchar](10) NULL,
	[PurchaseOrderNo] [varchar](15) NULL,
	[InvoiceNo] [varchar](15) NULL,
	[RefDeliveryNoteNo] [varchar](30) NULL,
	[RefDeliveryNoteDate] [datetime] NULL,
	[StockPointID] [varchar](10) NOT NULL,
	[DeliveredBy] [varchar](50) NULL,
	[VehicleNo] [varchar](30) NULL,
	[Remarks] [varchar](200) NULL,
	[PurchaseInvNo] [varchar](15) NULL,
	[VatRate] [decimal](18, 2) NOT NULL,
	[VatAmount] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 3) NOT NULL,
	[InvTotal] [decimal](18, 3) NOT NULL,
	[GRNStatus] [varchar](3) NOT NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_GRNHdr] PRIMARY KEY CLUSTERED 
(
	[GRNNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnGRNHdr] ([GRNNo], [GRNDate], [SalesReturnTag], [SupplierID], [CustomerID], [PurchaseOrderNo], [InvoiceNo], [RefDeliveryNoteNo], [RefDeliveryNoteDate], [StockPointID], [DeliveredBy], [VehicleNo], [Remarks], [PurchaseInvNo], [VatRate], [VatAmount], [SubTotal], [InvTotal], [GRNStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000001', CAST(0x000099E100000000 AS DateTime), N'N', N'0100100001', NULL, N'010010607000001', NULL, N'', CAST(0x000099A600000000 AS DateTime), N'0100100001', N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'NUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnGRNHdr] ([GRNNo], [GRNDate], [SalesReturnTag], [SupplierID], [CustomerID], [PurchaseOrderNo], [InvoiceNo], [RefDeliveryNoteNo], [RefDeliveryNoteDate], [StockPointID], [DeliveredBy], [VehicleNo], [Remarks], [PurchaseInvNo], [VatRate], [VatAmount], [SubTotal], [InvTotal], [GRNStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000002', CAST(0x000099FF00000000 AS DateTime), N'N', N'0100100001', NULL, N'010010607000003', NULL, N'', CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'', N'', N'cbvv', NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'NUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnGRNHdr] ([GRNNo], [GRNDate], [SalesReturnTag], [SupplierID], [CustomerID], [PurchaseOrderNo], [InvoiceNo], [RefDeliveryNoteNo], [RefDeliveryNoteDate], [StockPointID], [DeliveredBy], [VehicleNo], [Remarks], [PurchaseInvNo], [VatRate], [VatAmount], [SubTotal], [InvTotal], [GRNStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000003', CAST(0x000099FF00000000 AS DateTime), N'N', N'0100100001', NULL, N'010010607000004', NULL, N'', CAST(0x000099FF00000000 AS DateTime), N'0100100001', N'', N'', N'vvv', NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'NUT', NULL, NULL, N'01', N'001', N'0607')
INSERT [dbo].[TrnGRNHdr] ([GRNNo], [GRNDate], [SalesReturnTag], [SupplierID], [CustomerID], [PurchaseOrderNo], [InvoiceNo], [RefDeliveryNoteNo], [RefDeliveryNoteDate], [StockPointID], [DeliveredBy], [VehicleNo], [Remarks], [PurchaseInvNo], [VatRate], [VatAmount], [SubTotal], [InvTotal], [GRNStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'N', N'0100100001', NULL, N'010017777000001', NULL, N'1111', CAST(0x0000996E00000000 AS DateTime), N'0100100002', N'aaa', N'', N'zxczxczzzvxzxv', N'010017777000001', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'NUT', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnGRNHdr] ([GRNNo], [GRNDate], [SalesReturnTag], [SupplierID], [CustomerID], [PurchaseOrderNo], [InvoiceNo], [RefDeliveryNoteNo], [RefDeliveryNoteDate], [StockPointID], [DeliveredBy], [VehicleNo], [Remarks], [PurchaseInvNo], [VatRate], [VatAmount], [SubTotal], [InvTotal], [GRNStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', CAST(0x0000996E00000000 AS DateTime), N'N', N'0100100001', NULL, N'010017777000001', NULL, N'998765', CAST(0x0000996E00000000 AS DateTime), N'0100100004', N'kkkk', N'885632', N'gjgjgghgh', N'010017777000001', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'NUT', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnGRNHdr] ([GRNNo], [GRNDate], [SalesReturnTag], [SupplierID], [CustomerID], [PurchaseOrderNo], [InvoiceNo], [RefDeliveryNoteNo], [RefDeliveryNoteDate], [StockPointID], [DeliveredBy], [VehicleNo], [Remarks], [PurchaseInvNo], [VatRate], [VatAmount], [SubTotal], [InvTotal], [GRNStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000003', CAST(0x000099A200000000 AS DateTime), N'N', N'0100100001', NULL, N'010017777000002', NULL, N'', CAST(0x000099A200000000 AS DateTime), N'0100100002', N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'NUT', NULL, NULL, N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnJobDetails_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrnJobDetails_Cancel]


	@JobNo						Varchar(15),
	@CancelDate					Varchar(10),
	@CancelReason				Varchar(200)

As


	Begin Transaction T
		
		Update		TrnJobHdr
		Set			CancelDate=Convert(DateTime,@CancelDate,103),
					CancelReason=@CancelReason,
					JobStatus='CAN'
		Where		JobNo=@JobNo

	If @@Error <> 0
	Begin
		Rollback Transaction T
	End
	Else
	Begin
			Commit Transaction T
	End

	Select @JobNo
GO
/****** Object:  StoredProcedure [dbo].[TrnInvoiceServiceDtl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnJobHdr

select * from TrnJobLabWorkDtl

select * from TrnInvoiceServiceDtl

select * from MstServiceItem

TrnInvoiceServiceDtl_Select '010017777000002','01','001','7777'

*/

CREATE procedure [dbo].[TrnInvoiceServiceDtl_Select]

	@JobNo				Varchar(15),
	@CompanyID			Varchar(2),
	@BranchID			Varchar(3),
	@FinYearID			Varchar(4)

As



	Select	(Select	ServiceItemName
			From	MstServiceItem
			Where	ServiceType='LWC'
			And		CompanyID = TrnJobHdr.CompanyID
			And		BranchID = TrnJobHdr.BranchID) as ServiceItemName,
			(Select	ServiceItemID
			From	MstServiceItem
			Where	ServiceType='LWC'
			And		CompanyID = TrnJobHdr.CompanyID
			And		BranchID = TrnJobHdr.BranchID) as ServiceItemID,
			'' As Particulars,
			LabWorkTotal as Rate,
			1 as InvQty,
			LabWorkTotal as ServiceAmt
	From	TrnJobHdr
	Where	JobNo = @JobNo
	And		IsNull(LabWorkTotal,0) > 0
	And		TrnJobHdr.CompanyID=@CompanyID
	And		TrnJobHdr.BranchID=@BranchID
	And		FinYearID=@FinYearID
	Union All
	Select	(Select	ServiceItemName
			From	MstServiceItem
			Where	ServiceType='MCC'
			And		CompanyID = TrnJobHdr.CompanyID
			And		BranchID = TrnJobHdr.BranchID) aS ServiceItemName,
			(Select	ServiceItemID
			From	MstServiceItem
			Where	ServiceType='MCC'
			And		CompanyID = TrnJobHdr.CompanyID
			And		BranchID = TrnJobHdr.BranchID) as ServiceItemID,
			'' As Particulars,
			ProductIssueTotal as Rate,
			1 as InvQty,
			ProductIssueTotal as ServiceAmt
	From	TrnJobHdr
	Where	JobNo = @JobNo
	And		IsNull(ProductIssueTotal,0) > 0
	And		TrnJobHdr.CompanyID=@CompanyID
	And		TrnJobHdr.BranchID=@BranchID
	And		FinYearID=@FinYearID
GO
/****** Object:  Table [dbo].[TrnJobProductIssueDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnJobProductIssueDtl](
	[JobProductIssueDtlID] [varchar](18) NOT NULL,
	[JobNo] [varchar](15) NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[StockPointID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[BalanceStockQty] [decimal](18, 3) NOT NULL,
	[IssueQty] [decimal](18, 3) NOT NULL,
	[ProductAmt] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TrnJobProductIssueDtl] PRIMARY KEY CLUSTERED 
(
	[JobProductIssueDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnJobProductIssueDtl] UNIQUE NONCLUSTERED 
(
	[JobNo] ASC,
	[IssueDate] ASC,
	[StockPointID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrnJobLabWorkDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnJobLabWorkDtl](
	[JobLabWorkDtlID] [varchar](18) NOT NULL,
	[JobNo] [varchar](15) NOT NULL,
	[WorkDate] [datetime] NOT NULL,
	[LabourCategoryID] [varchar](10) NOT NULL,
	[LabourRate] [decimal](18, 2) NOT NULL,
	[NoOfLabour] [decimal](18, 0) NOT NULL,
	[WorkHour] [decimal](18, 2) NOT NULL,
	[LabourAmt] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_JobLabWorkDtl] PRIMARY KEY CLUSTERED 
(
	[JobLabWorkDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnJobLabWorkDtl] UNIQUE NONCLUSTERED 
(
	[JobNo] ASC,
	[WorkDate] ASC,
	[LabourCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnJobLabWorkDtl] ([JobLabWorkDtlID], [JobNo], [WorkDate], [LabourCategoryID], [LabourRate], [NoOfLabour], [WorkHour], [LabourAmt]) VALUES (N'010017777000001001', N'010017777000001', CAST(0x0000997400000000 AS DateTime), N'0100100001', CAST(15.50 AS Decimal(18, 2)), CAST(2 AS Decimal(18, 0)), CAST(2.00 AS Decimal(18, 2)), CAST(62.00 AS Decimal(18, 2)))
INSERT [dbo].[TrnJobLabWorkDtl] ([JobLabWorkDtlID], [JobNo], [WorkDate], [LabourCategoryID], [LabourRate], [NoOfLabour], [WorkHour], [LabourAmt]) VALUES (N'010017777000001002', N'010017777000001', CAST(0x0000997400000000 AS DateTime), N'0100100002', CAST(15.50 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)), CAST(2.30 AS Decimal(18, 2)), CAST(35.65 AS Decimal(18, 2)))
INSERT [dbo].[TrnJobLabWorkDtl] ([JobLabWorkDtlID], [JobNo], [WorkDate], [LabourCategoryID], [LabourRate], [NoOfLabour], [WorkHour], [LabourAmt]) VALUES (N'010017777000001003', N'010017777000001', CAST(0x0000997400000000 AS DateTime), N'0100100003', CAST(1000.52 AS Decimal(18, 2)), CAST(2 AS Decimal(18, 0)), CAST(5.60 AS Decimal(18, 2)), CAST(11205.82 AS Decimal(18, 2)))
/****** Object:  StoredProcedure [dbo].[TrnJobDetails_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnJobHdr
select * from TrnJobLabWorkDtl

objArr.Add(this.txtJobStartDate.Date.ToShortDateString().Trim());
objArr.Add(this.ddCustomer.SelectedValue.Trim());
objArr.Add(this.txtCustomerName.Text.Trim());
objArr.Add(this.txtRemarks.Text.Trim());
objArr.Add(this.txtJobAddress.Text.Trim());
objArr.Add(this.txtJobCity.Text.Trim());
objArr.Add(this.txtJobPin.Text.Trim());
objArr.Add(this.txtJobSubTotal.Text.Trim());

objArr.Add(BuildXmlForDetail());

objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

*/

CREATE procedure [dbo].[TrnJobDetails_Update]

	@JobNo						Varchar(15),
	@JobStartDate				Varchar(10),
	@CustomerID					Varchar(10),
	@CustomerName				Varchar(100),
	@Remarks  					Varchar(200),
	@JobAddress					Varchar(200),
	@JobCity					Varchar(50),
	@JobPin						Varchar(15),
	@LabWorkTotal				Decimal(18,2),

	@DetailXml					Ntext,

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)

As



	Declare			@intCntr				as int
	Declare			@logMsg					as Varchar(200)
	Declare			@CurDatetime			as datetime	
	Declare			@intError				as integer
	Declare			@NewJobNo				as Varchar(15)
	Declare			@NewJobLabWorkDtlID		as Varchar(18)
	Declare			@AutoGenPrefix			as Varchar(9)

	Declare			@XMLFormat	Int

	Declare			@WorkDate				Varchar(10)
	Declare			@LabCategoryID			Varchar(10)
	Declare			@Rate					Decimal(18,2)
	Declare			@NoOfLabour				Decimal(18,0)
	Declare			@WorkHour				Decimal(18,2)
	Declare			@Amount					Decimal(18,2)



	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	


	IF @JobStartDate=''
	BEGIN
	        select 'Job Start date can not be empty'
	        return
	END

	IF @CustomerID=''
	BEGIN
	        select 'Select Customer'
	        return
	END

	IF @CustomerID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstCustomer
		where   (CustomerID = @CustomerID)

		if @intcntr  <= 0
		begin
         	select 'Invalid Customer ID'
			return
		end
	END


	If @LabWorkTotal <= 0
		Begin
			Select 'Labour Work Work Amount can not be empty'
	        return
		End

	If @CompanyId = ''
		Begin
			Select 'Please give the Company'
	        return
		End

	If @BranchId = ''
		Begin
			Select 'Please give the Branch'
	        return
		End

	If @FinYearID = ''
		Begin
			Select 'Please give the Financial Year'
	        return
		End

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet

	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml


	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select LabCategoryID,WorkDate,Rate,NoOfLabour,WorkHour,Amount
	From Openxml (@XMLFormat, '/NewDataSet/JobDetails', 2)
	With
		(
			
			LabCategoryID	Varchar(10),
			WorkDate		Varchar(10),
			Rate			decimal(18,2),
			NoOfLabour		decimal(18,0),
			WorkHour		decimal(18,2),
			Amount			decimal(18,2)

		)

	BEGIN TRANSACTION

	Update		TrnJobHdr
	Set			JobStartDate=Convert(Datetime,@JobStartDate,103),
				CustomerID=@CustomerID,
				CustomerName=@CustomerName,
				JobAddress=@JobAddress,
				JobCity=@JobCity,
				JobPin=@JobPin,
				Remarks=@Remarks,
				LabWorkTotal=@LabWorkTotal
	Where		JobNo=@JobNo
	And			BranchId=@BranchId
	And			FinYearID=@FinYearID


	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


	Delete	From	TrnJobLabWorkDtl
	Where			JobNo=@JobNo
	And				JobNo In
	(Select			JobNo 
	From			TrnJobHdr
	Where			CompanyId=@CompanyId
	And				BranchId=@BranchId
	And				FinYearID=@FinYearID)
	
	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @LabCategoryID,@WorkDate,@Rate,@NoOfLabour,@WorkHour,@Amount

	While (@@Fetch_Status=0)
	Begin

		IF @WorkDate =''
		Begin
			select 'Please Give Work Date'
			return
		END

		If @LabCategoryID = ''
		Begin
			select 'Please Give Labour Category ID'
			return
		END

		IF @LabCategoryID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstLabourCategory
			where   (LabourCategoryID = @LabCategoryID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Labour Category ID'
				return
			end
		END

		IF @Rate <= 0 
		Begin
			select 'Rate can not be empty'
			return
		END

		IF @NoOfLabour <= 0 
		Begin
			select 'Please Give No Of Labour'
			return
		END

		IF @WorkHour <= 0
		Begin
			select 'Please Give Working Hour'
			return
		END
		

		IF @Amount <= 0
		Begin
			select 'Amount can not be empty'
			return
		END
	
		/*print @WorkDate
		print @LabCategoryID
		print @Rate
		print @NoOfLabour
		print @WorkHour
		print @Amount*/

		exec  AutoGenerateID 'TrnJobLabWorkDtl' ,'JobLabWorkDtlID',18,@JobNo,@NewJobLabWorkDtlID output

		INSERT TrnJobLabWorkDtl(JobLabWorkDtlID,JobNo,WorkDate,LabourCategoryID,LabourRate,NoOfLabour,
		WorkHour,LabourAmt)
		Values (@NewJobLabWorkDtlID,@JobNo,Convert(DateTime,@WorkDate,103),@LabCategoryID,@Rate,@NoOfLabour,
		@WorkHour,@Amount)

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Fetch Next From CurDetailRecord Into @LabCategoryID,@WorkDate,@Rate,@NoOfLabour,@WorkHour,@Amount
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table
	Set @LogMsg= 'Update Job Details' + @JobNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @JobNo
GO
/****** Object:  StoredProcedure [dbo].[TrnJobDetails_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Developed By		: Indranil Roy
select * from TrnJobHdr
select * from TrnJobLabWorkDtl

delete from TrnJobHdr
delete from TrnJobLabWorkDtl



TrnJobDetails_Insert

	@JobNo='',
	@JobStartDate='01/12/2007',
	@CustomerID='0300700001',
	@CustomerName='Indranil Roy',
	@JobAddress='Bangur',
	@JobCity='Kolkata',
	@JobPin='700055',
	@Remarks='Good',
	@LabWorkTotal='125.00',

	@DetailXml='<NewDataSet>
				  <JobDetails>
					<WorkDate>13/06/2007</WorkDate>
					<LabourCategoryID>0300700001</LabourCategoryID>
					<Rate>12.50</Rate>
					<NoOfLabour>2</NoOfLabour>
					<WorkHour>5</WorkHour>
					<Amount>125.00</Amount>
				  </JobDetails>
				  <JobDetails>
					<WorkDate>13/06/2007</WorkDate>
					<LabourCategoryID>0300700001</LabourCategoryID>
					<Rate>12.50</Rate>
					<NoOfLabour>1</NoOfLabour>
					<WorkHour>2</WorkHour>
					<Amount>25.00</Amount>
				  </JobDetails>
				  <JobDetails>
					<WorkDate>13/06/2007</WorkDate>
					<LabourCategoryID>0300700001</LabourCategoryID>
					<Rate>12.50</Rate>
					<NoOfLabour>2</NoOfLabour>
					<WorkHour>1</WorkHour>
					<Amount>25.00</Amount>
				  </JobDetails>
				</NewDataSet>',

	@LogUserId='indranil',
	@CompanyId='03',
	@BranchId='007',
	@FinYearID='7777'
*/

CREATE procedure [dbo].[TrnJobDetails_Insert]


	@JobNo						Varchar(15),
	@JobStartDate				Varchar(10),
	@CustomerID					Varchar(10),
	@CustomerName				Varchar(100),
	@Remarks  					Varchar(200),
	@JobAddress					Varchar(200),
	@JobCity					Varchar(50),
	@JobPin						Varchar(15),
	@LabWorkTotal				Decimal(18,2),

	@DetailXml					Ntext,

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)


As


	Declare			@intCntr				as int
	Declare			@logMsg					as Varchar(200)
	Declare			@CurDatetime			as datetime	
	Declare			@intError				as integer
	Declare			@NewJobNo				as Varchar(15)
	Declare			@NewJobLabWorkDtlID		as Varchar(18)
	Declare			@AutoGenPrefix			as Varchar(9)

	Declare			@XMLFormat	Int

	Declare			@WorkDate				Varchar(10)
	Declare			@LabCategoryID			Varchar(10)
	Declare			@Rate					Decimal(18,2)
	Declare			@NoOfLabour				Decimal(18,0)
	Declare			@WorkHour				Decimal(18,2)
	Declare			@Amount					Decimal(18,2)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation

	select  @intcntr = count(*)
	from   	TrnJobHdr
	where   JobNo = @JobNo

	if @intcntr  > 0
	begin
	        select 'Job No already exists'
	        return
	end

	IF @JobStartDate=''
	BEGIN
	        select 'Job Start date can not be empty'
	        return
	END

	IF @CustomerID=''
	BEGIN
	        select 'Select Customer'
	        return
	END

	IF @CustomerID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstCustomer
		where   (CustomerID = @CustomerID)

		if @intcntr  <= 0
		begin
         	select 'Invalid Customer ID'
			return
		end
	END


	If @LabWorkTotal <= 0
		Begin
			Select 'Labour Work Work Amount can not be empty'
	        return
		End

	If @CompanyId = ''
		Begin
			Select 'Please give the Company'
	        return
		End

	If @BranchId = ''
		Begin
			Select 'Please give the Branch'
	        return
		End

	If @FinYearID = ''
		Begin
			Select 'Please give the Financial Year'
	        return
		End

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml


	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select LabCategoryID,WorkDate,Rate,NoOfLabour,WorkHour,Amount
	From Openxml (@XMLFormat, '/NewDataSet/JobDetails', 2)
	With
		(
			
			LabCategoryID	Varchar(10),
			WorkDate		Varchar(10),
			Rate			decimal(18,2),
			NoOfLabour		decimal(18,0),
			WorkHour		decimal(18,2),
			Amount			decimal(18,2)

		)


	BEGIN TRANSACTION

	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnJobHdr' , 'JobNo' , 15 , @AutoGenPrefix , @NewJobNo output


	Insert Into TrnJobHdr
	(JobNo,JobStartDate,CustomerID,CustomerName,JobAddress,JobCity,JobPin,Remarks,
	LabWorkTotal,CompanyID,BranchID,FinYearID)
	Values
	(@NewJobNo,Convert(Datetime,@JobStartDate,103),@CustomerID,@CustomerName,@JobAddress,
	@JobCity,@JobPin,@Remarks,@LabWorkTotal,@CompanyID,@BranchID,@FinYearID)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @LabCategoryID,@WorkDate,@Rate,@NoOfLabour,@WorkHour,@Amount

	While (@@Fetch_Status=0)
	Begin


		If @LabCategoryID = ''
		Begin
			select 'Please Give Labour Category ID'
			return
		END

		IF @WorkDate =''
		Begin
			select 'Please Give Work Date'
			return
		END

		IF @LabCategoryID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstLabourCategory
			where   (LabourCategoryID = @LabCategoryID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Labour Category ID'
				return
			end
		END

		IF @Rate <= 0 
		Begin
			select 'Rate can not be empty'
			return
		END

		IF @NoOfLabour <= 0 
		Begin
			select 'Please Give No Of Labour'
			return
		END

		IF @WorkHour <= 0 
		Begin
			select 'Please Give Working Hour'
			return
		END
		

		IF @Amount <= 0
		Begin
			select 'Amount can not be empty'
			return
		END
	
		/*print @WorkDate
		print @LabCategoryID
		print @Rate
		print @NoOfLabour
		print @WorkHour
		print @Amount*/
		exec  AutoGenerateID 'TrnJobLabWorkDtl' ,'JobLabWorkDtlID',18,@NewJobNo,@NewJobLabWorkDtlID output

		INSERT TrnJobLabWorkDtl(JobLabWorkDtlID,JobNo,WorkDate,LabourCategoryID,LabourRate,NoOfLabour,
		WorkHour,LabourAmt)
		Values (@NewJobLabWorkDtlID,@NewJobNo,Convert(DateTime,@WorkDate,103),@LabCategoryID,@Rate,@NoOfLabour,
		@WorkHour,@Amount)

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Fetch Next From CurDetailRecord Into @LabCategoryID,@WorkDate,@Rate,@NoOfLabour,@WorkHour,@Amount

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Job Details' + @NewJobNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewJobNo
GO
/****** Object:  StoredProcedure [dbo].[MstGetProductUOM_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 26/04/2007
CREATE PROCEDURE [dbo].[MstGetProductUOM_Select]
(
	@ProductID		Varchar(10),
	@CompanyID		Varchar(2),
	@BranchID		Varchar(3)
)

As 

BEGIN
	select	productUOM from mstproduct
	where	ProductID=@ProductID
	And		CompanyID=@CompanyID
	And		BranchID=@BranchID
END
GO
/****** Object:  StoredProcedure [dbo].[MstGetProductName_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--  Swarnali -------- 07/05/2007 ---------- --
CREATE PROCEDURE [dbo].[MstGetProductName_Select]
(
	@ProductID	 as varchar(10)
)

As 

BEGIN
	 select productName 
	 from mstProduct
	 where ProductID=@ProductID

END
GO
/****** Object:  Table [dbo].[TrnCurrentStock]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnCurrentStock](
	[CurrentStockID] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[StockPointID] [varchar](10) NOT NULL,
	[OpeningStockQty] [decimal](18, 3) NOT NULL,
	[StockInQty] [decimal](18, 3) NOT NULL,
	[StockOutQty] [decimal](18, 3) NOT NULL,
	[ClosingStockQty] [decimal](18, 3) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnCurrentStock] PRIMARY KEY CLUSTERED 
(
	[CurrentStockID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnCurrentStock] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC,
	[StockPointID] ASC,
	[CompanyID] ASC,
	[BranchID] ASC,
	[FinYearID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnCurrentStock] ([CurrentStockID], [ProductID], [StockPointID], [OpeningStockQty], [StockInQty], [StockOutQty], [ClosingStockQty], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000001', N'0100100002', N'0100100001', CAST(0.000 AS Decimal(18, 3)), CAST(4.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'01', N'001', N'0607')
INSERT [dbo].[TrnCurrentStock] ([CurrentStockID], [ProductID], [StockPointID], [OpeningStockQty], [StockInQty], [StockOutQty], [ClosingStockQty], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000002', N'0100100003', N'0100100001', CAST(0.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'01', N'001', N'0607')
INSERT [dbo].[TrnCurrentStock] ([CurrentStockID], [ProductID], [StockPointID], [OpeningStockQty], [StockInQty], [StockOutQty], [ClosingStockQty], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000003', N'0100100001', N'0100100001', CAST(0.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'01', N'001', N'0607')
INSERT [dbo].[TrnCurrentStock] ([CurrentStockID], [ProductID], [StockPointID], [OpeningStockQty], [StockInQty], [StockOutQty], [ClosingStockQty], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010010607000004', N'0100100005', N'0100100001', CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'01', N'001', N'0607')
INSERT [dbo].[TrnCurrentStock] ([CurrentStockID], [ProductID], [StockPointID], [OpeningStockQty], [StockInQty], [StockOutQty], [ClosingStockQty], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', N'0100100004', N'0100100002', CAST(0.000 AS Decimal(18, 3)), CAST(6.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'01', N'001', N'7777')
INSERT [dbo].[TrnCurrentStock] ([CurrentStockID], [ProductID], [StockPointID], [OpeningStockQty], [StockInQty], [StockOutQty], [ClosingStockQty], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', N'0100100004', N'0100100004', CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'01', N'001', N'7777')
INSERT [dbo].[TrnCurrentStock] ([CurrentStockID], [ProductID], [StockPointID], [OpeningStockQty], [StockInQty], [StockOutQty], [ClosingStockQty], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000003', N'0100100001', N'0100100002', CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnGoodsReceiptNo_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 28/05/2007
/*
<NewDataSet>
	<GRNDetail>
	<ProductID>0000000001</ProductID>
	<BalancePOQty>4.000</BalancePOQty>
	<ReceiptQty>1</ReceiptQty>
	<Rate>4.00</Rate>
	</GRNDetail>
</NewDataSet>

*/


CREATE PROCEDURE [dbo].[TrnGoodsReceiptNo_Cancel]
(
	@GRNNo			as varchar(15)=null,
	@PurchaseOrderNo		as varchar(15)=null,
	@StockPointID			as varchar(10)=null,
	@CancelReason  		as varchar(200) = null,
	@CancelDate			as varchar(10),
	@DetailXml			as NTEXT,
	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        			as varchar(3),
	@FinYearID        		as varchar(4)

)
As 
 
Begin

	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	Declare @XMLFormat Int

	Declare @ProductID as Varchar(10)
	Declare @BalancePOQty as Decimal(18,3)
	Declare @ReceiptQty as Decimal(18,2)
	Declare @NewBalancePOQty as Decimal(18,3)
	Declare @Rate as Decimal(18,3)
	Declare @OldReceiptQty Decimal(18,3) 
	
	Declare @ProductQty as Decimal(18,3)
	Declare @UtilQty as Decimal(18,3)


	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*)
	from   	TrnGRNHdr
	where   (GRNStatus = 'NUT' and GRNNo=@GRNNo)


	if @intcntr  <= 0
	begin
	        select 'Error : GRN Status is not [NUT] so this can not be cancel'
	        return
	end


	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select ProductID,BalancePOQty,ReceiptQty,Rate
	From Openxml (@XMLFormat, '/NewDataSet/GRNDetail', 2)
	With 
		(
			ProductID Varchar(10),
			BalancePOQty Decimal(18,3),
			ReceiptQty Decimal(18,3),
			Rate decimal(18,2)
		)


	BEGIN TRANSACTION   

	

	Update TrnPurchaseOrderHdr Set PurchaseOrderStatus='PUT'
	Where PurchaseOrderNo=@PurchaseOrderNo
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Update TrnGRNHdr Set GRNStatus='CAN',CancelDate=Convert(datetime,@CancelDate,103),
	CancelReason=@CancelReason Where GRNNo=@GRNNo	
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@BalancePOQty,@ReceiptQty,@Rate

	While (@@Fetch_Status=0)
	Begin
		
		Update TrnPurchaseOrderdtl Set UtilQty=(isnull(UtilQty,0) - isnull(@ReceiptQty,0))
		Where ProductID=@ProductID and PurchaseOrderNo=@PurchaseOrderNo

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


		Update TrnStockInDtl Set StockinQty=(isnull(StockinQty,0)-isnull(@ReceiptQty,0)) 
		Where InDocNo=@GRNNo and ProductID=@ProductID and StockPointID=@StockPointID
		
		Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


		Update TrnCurrentStock 
		Set StockInQty=(isnull(StockInQty,0) - isnull(@ReceiptQty,0))		
		Where   ProductID=@ProductID and StockPointID=@StockPointID and 
		CompanyId=@CompanyId and BranchId=@BranchId and FinYearID=@FinYearID
		
	
		Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End		

		Fetch Next From CurDetailRecord Into @ProductID,@BalancePOQty,@ReceiptQty,@Rate

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord
	--- Validation end for detail part from here

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Cancel Goods Receipt Note' + @GRNNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @GRNNo
  

 END
GO
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNoteDtl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--Tridip Bhattacharjee
CREATE procedure [dbo].[TrnDeliveryNoteDtl_Select]
(
	@ProformaInvNo Varchar(15)
)
As

	Begin
		SELECT TrnProformaInvoiceHdr.ProformaInvNo,TrnProformaInvoiceHdr.ProformaInvDate, 
		MstCustomer.CustomerName,MstCustomer.ShippingAddress,MstCustomer.ShippingCity, 
		MstCustomer.ShippingPin
		FROM   TrnProformaInvoiceHdr INNER JOIN
		MstCustomer ON TrnProformaInvoiceHdr.CustomerID = MstCustomer.CustomerID
		Where TrnProformaInvoiceHdr.ProformaInvNo=@ProformaInvNo
		
		
		SELECT TrnProformaInvoiceDtl.ProductID,MstProduct.ProductName,MstProduct.ProductUOM as Unit,
		TrnProformaInvoiceDtl.ProductRate as Rate,
		(isnull(TrnProformaInvoiceDtl.ProductQty,0)- isnull(TrnProformaInvoiceDtl.UtilQty,0)) as BalQty,0 as DeliveryQty
		FROM TrnProformaInvoiceHdr INNER JOIN
		TrnProformaInvoiceDtl ON TrnProformaInvoiceHdr.ProformaInvNo = TrnProformaInvoiceDtl.ProformaInvNo INNER JOIN
		MstProduct ON TrnProformaInvoiceDtl.ProductID = MstProduct.ProductID
		Where TrnProformaInvoiceHdr.ProformaInvNo=@ProformaInvNo
	End
GO
/****** Object:  StoredProcedure [dbo].[rptPurchaseInv_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
select * from mstProduct
select * from trnPurchaseOrderDtl

rptProformaInv_Select @ProformaInvNo='030077777000003'

select * from TrnPurchaseInvoiceHdr

select * from MstSupplier


*/

CREATE procedure [dbo].[rptPurchaseInv_Select]

	@PurchaseInvNo			Varchar(15),
	@CompanyId				Varchar(2),
	@BranchId        				Varchar(3),
	@FinYearID        			Varchar(4)

As

	Select	TPIH.PurchaseInvNo,Convert(Varchar(10),TPIH.PurchaseInvDate,103) As PurchaseInvDate,
			PurchaseOrderNo,SupInvNo,Convert(Varchar(10),TPIH.SupInvDate,103) As SupInvDate,
			TPIH.Remarks,TPIH.PurchaseInvStatus,Convert(Varchar(10),TPIH.CancelDate,103) As CancelDate,
			TPIH.CancelReason,TPIH.ProductTotal,TPIH.VatRate,TPIH.VatAmt,TPIH.PurchaseInvAmt,
			MS.SupplierName
	From	TrnPurchaseInvoiceHdr TPIH

	Inner	Join MstSupplier MS On TPIH.SupplierID=MS.SupplierID
	And		MS.CompanyId=@CompanyId
	And		MS.BranchId=@BranchId

	Where	TPIH.PurchaseInvNo=@PurchaseInvNo
	And		TPIH.CompanyId=@CompanyId
	And		TPIH.BranchId=@BranchId
	And		TPIH.FinYearID=@FinYearID
GO
/****** Object:  StoredProcedure [dbo].[rptProformaInvDtl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rptProformaInvDtl_Select]

	@ProformaInvNo		Varchar(15)

As


	Select	TPID.ProformaInvNo,MP.ProductName,MP.ProductUOM,TPID.ProductQty,TPID.ProductRate,TPID.ProductAmt	
	From TrnProformaInvoiceDtl TPID
	Inner Join MstProduct MP On MP.ProductID=TPID.ProductID
	Where TPID.ProformaInvNo=@ProformaInvNo
GO
/****** Object:  StoredProcedure [dbo].[rptPurchaseOrder_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 04/05/2007
CREATE PROCEDURE [dbo].[rptPurchaseOrder_Select]
(
	@PurchaseOrderNo	 as varchar(15)
)
As 
BEGIN

		SELECT     TrnPurchaseOrderHdr.*, MstDepartment.DepartmentName,MstProductGroup.ProductGroupName,
		MstSupplier.SupplierName
		FROM TrnPurchaseOrderHdr INNER JOIN
	                MstDepartment ON TrnPurchaseOrderHdr.DepartmentID = MstDepartment.DepartmentID INNER JOIN
                      	MstProductGroup ON TrnPurchaseOrderHdr.ProductGroupID = MstProductGroup.ProductGroupID INNER JOIN
                      	MstSupplier ON TrnPurchaseOrderHdr.SupplierID = MstSupplier.SupplierID
	      	Where TrnPurchaseOrderHdr.PurchaseOrderNo=@PurchaseOrderNo
	
END
GO
/****** Object:  Table [dbo].[MstSupplierRate]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstSupplierRate](
	[SupplierRateID] [varchar](30) NOT NULL,
	[SupplierID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[SupplierRate] [decimal](18, 2) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstSupplierRate] PRIMARY KEY CLUSTERED 
(
	[SupplierRateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_MstSupplierRate] UNIQUE NONCLUSTERED 
(
	[SupplierID] ASC,
	[ProductID] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstSupplierRate] ([SupplierRateID], [SupplierID], [ProductID], [EffectiveDate], [SupplierRate], [CompanyID], [BranchID]) VALUES (N'0100100001', N'0100100001', N'0100100004', CAST(0x0000996E00000000 AS DateTime), CAST(1000.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstSupplierRate] ([SupplierRateID], [SupplierID], [ProductID], [EffectiveDate], [SupplierRate], [CompanyID], [BranchID]) VALUES (N'0100100002', N'0100100001', N'0100100001', CAST(0x0000996E00000000 AS DateTime), CAST(600.00 AS Decimal(18, 2)), N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstSupplierRate_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
Created By		: Indranil Roy
Creation Date	: 08.05.2007
Alteration Date	: N/A
Altered By		: N/A

select * from mstsupplierrate

sp_help mstsupplierrate

********************************************************************************************/

CREATE procedure [dbo].[MstSupplierRate_Update]

		@SupplierRateID		Varchar(10),
		@SupplierID			Varchar(10),
		@ProductID			Varchar(200),
		@EffectiveDate		Varchar(10),
		@SupplierRate		Decimal(18,2),

		@LogUserID    		Varchar(12),
		@CompanyID			Varchar(2),
		@BranchID			Varchar(3)

As

		Declare		@logMsg Varchar(200)
		Declare		@CurDatetime DateTime
		Declare		@dt DateTime


		If (@SupplierRateID <> '' And @SupplierID <> '' And @ProductID <> ''
		   And @EffectiveDate <> '' And @SupplierRate > 0)

			Begin
				Begin Transaction T
			
				Update	mstSupplierRate
				Set		SupplierID=@SupplierID,
						ProductID=@ProductID,
						EffectiveDate=Convert(DateTime,@EffectiveDate,103),
						SupplierRate=@SupplierRate
				Where	SupplierRateID=@SupplierRateID

				-- Inserting Values into Log Table
				Set @LogMsg= 'Modified Supplier Rate Data' + @SupplierRateID
				Set @CurDateTime = GetDate()
				Exec UserLog_Insert @CurDateTime, @LogUserID, @LogMsg
		
				If @@Error <> 0
				Begin
					Rollback Transaction T
					Return @@Error
				End
				
				Commit Transaction T
		
				--Select '*Data Updated Successfully.'
				Select @SupplierRateID
			End
GO
/****** Object:  StoredProcedure [dbo].[MstSupplierRate_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
Created By		: Indranil Roy
Creation Date	: 08.05.2007
Alteration Date	: N/A
Altered By		: N/A

********************************************************************************************/


CREATE PROCEDURE [dbo].[MstSupplierRate_Insert]

		@SupplierRateID		Varchar(10),
		@SupplierID			Varchar(10),
		@ProductID			Varchar(200),
		@EffectiveDate			Varchar(10),
		@SupplierRate			Decimal(18,2),

		@LogUserId    			Varchar(12),
		@CompanyID			Varchar(2),
		@BranchID			Varchar(3)

As

	Declare @AutoGenPrefix varchar(5)
	Declare @NewSupplierRateID as varchar(10)
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as DateTime



	
	Set @AutoGenPrefix = @CompanyId + @BranchId
	Exec AutoGenerateID 'MstSupplierRate' , 'SupplierRateID' , 10 , @AutoGenPrefix , @NewSupplierRateID output

	
	--If (@SupplierID <> '' And @ProductID <> '' And @EffectiveDate <> '' And @SupplierRate > 0)

	Begin

		Begin Transaction T

		Insert Into
		MstSupplierRate(SupplierRateID,SupplierID,ProductID,EffectiveDate,SupplierRate,CompanyID,BranchID)
		Values(@NewSupplierRateID,@SupplierID,@ProductID,Convert(DateTime,@EffectiveDate,103),@SupplierRate,@CompanyID,@BranchID)
		
		
		-- Inserting Values into Log Table
		Set @LogMsg= 'Insert Supplier Rate Data' + @NewSupplierRateID
		Set @CurDateTime = Getdate()
		Exec UserLog_Insert @CurDateTime, @LogUserID, @LogMsg

		If @@Error<>0
		Begin
			Rollback Transaction T
			Return @@Error
		End

		Commit Transaction T

		--Select '*Data Saved Successfully.'
		Select @NewSupplierRateID

	End
GO
/****** Object:  StoredProcedure [dbo].[MstSupplierRate_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************

Created By			: Indranil
Creation Date		: 08.05.2007
Alteration Date		: N/A
Altered By			: N/A

*****************************************************************************************/

CREATE procedure [dbo].[MstSupplierRate_Delete]

		@SupplierRateID	Varchar(10),

		@LogUserId		Varchar(12),
		@CompanyId		Varchar(2),
		@BranchId		Varchar(3)

As

		Declare @logMsg  Varchar(200)
		Declare @CurDatetime DateTime
	

		If @SupplierRateID <> ''
		Begin
			Begin Transaction T
		
			Delete	From MstSupplierRate Where 
			SupplierRateID=@SupplierRateID
	
			-- Inserting Values into Log Table
			Set @LogMsg= 'Deleted Supplier Rate Data' + @SupplierRateID
			Set @CurDateTime = GetDate()
			Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg

			If @@Error=0
				Commit Transaction T
			Else
			Begin
				Rollback Transaction T
				Return @@Error
			End
			Select '*Data Deleted Successfully.'
		End
GO
/****** Object:  StoredProcedure [dbo].[MstSetupForLocation_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstSetupForLocation_Select] 
(
@CompanyID as varchar(2)
)
	
As 
 
Begin
	SELECT    SetupCompanyID, SetupBranchID, CurrentVersion, CurrentFinYearID, SetupID,
		  ServerName, ServerUser, ServerPWD,ProcessTag
   	FROM       MstSetup
	WHERE	  SetupCompanyID = @CompanyID 	
END
GO
/****** Object:  StoredProcedure [dbo].[MstSetup_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Samik Nandi -- 29/03/2006
CREATE PROCEDURE [dbo].[MstSetup_Select]
			(
			@CompanyID as varchar(2) = null,
			@BranchID as varchar(3) = null
			) 
	
As 
 
Begin
	SELECT    SetupID, SetupCompanyID, SetupBranchID, CurrentVersion, CurrentFinYearID, 
		  ServerName, ServerUser, ServerPWD, ProcessTag
   	FROM      MstSetup
	Where	SetupCompanyID like isnull(@CompanyID,'%')
	and	SetupBranchID like isnull(@BranchID,'%')	
END
GO
/****** Object:  StoredProcedure [dbo].[MstProduct_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from mstproduct

MstProduct_Select @ProductID=''

*/
-- Author : Tridip -- 23/04/2007
CREATE PROCEDURE [dbo].[MstProduct_Select]
		
		@ProductID				Varchar(10)='',
		@CompanyId				Varchar(2),
		@BranchId				Varchar(3)

As 
BEGIN
	If 	@ProductID = ''
	Begin
		Select  ProductID,ProductName
		from	MstProduct
		Where	CompanyId=@CompanyId
		And		BranchId=@BranchId
		Order	By ProductName
	End
	Else
	Begin
		Select  ProductID,ProductName,ProductSpec,ProductGroupID,ProductUOM,
				ReorderLevel
		from	MstProduct
		Where	ProductID=@ProductID
		And		CompanyId=@CompanyId
		And		BranchId=@BranchId
		Order	By ProductName
	End	
END
GO
/****** Object:  Table [dbo].[MstOpeningStock]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstOpeningStock](
	[OpeningStockID] [varchar](15) NOT NULL,
	[GRNNo] [varchar](15) NOT NULL,
	[GRNDate] [datetime] NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[StockPointID] [varchar](10) NOT NULL,
	[OpeningQty] [numeric](18, 0) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_MstOpeningStock] PRIMARY KEY CLUSTERED 
(
	[OpeningStockID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MstProductRate]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstProductRate](
	[ProductRateID] [varchar](20) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[UnitSaleRate] [decimal](18, 2) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_MstProductRate] PRIMARY KEY CLUSTERED 
(
	[ProductRateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_MstProductRate] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'0100100000000002', N'0100100004', CAST(0x0000996E00000000 AS DateTime), CAST(900.00 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'0100100000000003', N'0100100002', CAST(0x0000997400000000 AS DateTime), CAST(5000.50 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'0100100000000004', N'0100100003', CAST(0x0000997400000000 AS DateTime), CAST(1000.20 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'0100100000000005', N'0100100004', CAST(0x0000997400000000 AS DateTime), CAST(50.50 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'0100100000000006', N'0100100006', CAST(0x0000997400000000 AS DateTime), CAST(56.80 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'0100100000000007', N'0100100001', CAST(0x0000997400000000 AS DateTime), CAST(1000.85 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'0100100000000008', N'0100100007', CAST(0x0000997400000000 AS DateTime), CAST(5000.20 AS Decimal(18, 2)), N'01', N'001')
INSERT [dbo].[MstProductRate] ([ProductRateID], [ProductID], [EffectiveDate], [UnitSaleRate], [CompanyID], [BranchID]) VALUES (N'010010000000001', N'0100100001', CAST(0x0000996E00000000 AS DateTime), CAST(500.00 AS Decimal(18, 2)), N'01', N'001')
/****** Object:  StoredProcedure [dbo].[MstProductRate_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 07/05/2007
CREATE PROCEDURE [dbo].[MstProductRate_Update] 
(
	@ProductRateID	 as varchar(20),
	@ProductID  	 as varchar(10),
	@EffectiveDate	 as varchar(10),
	@UnitSaleRate	 as decimal(18,2),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	BEGIN TRANSACTION   

	Update MstProductRate 
	Set ProductID=@ProductID,
	EffectiveDate=Convert(DateTime,@EffectiveDate,103),
	UnitSaleRate = @UnitSaleRate
	Where ProductRateID=@ProductRateID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Modified Product Rate Data' + @ProductRateID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @ProductRateID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstProductRate_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 07/05/2007
CREATE PROCEDURE [dbo].[MstProductRate_Insert] 
(
	@ProductRateID	 as varchar(20),
	@ProductID  		 as  varchar(10),
	@EffectiveDate		 as varchar(10),
	@UnitSaleRate	 	 as decimal(18,2), 		
	@LogUserId    	 	 as varchar(12),
	@CompanyId  		 as varchar(2),
	@BranchId       		 as varchar(3)

)
As 
 
Begin
	Declare @intCntr as int
	Declare @intCntr1 as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewProductRateID as varchar(20)
	Declare @AutoGenPrefix as varchar(5)

	-- Setting Counter to zero
	set @intCntr = 0
	
	-- Checking the Primary key violation	
	select  @intcntr = count(ProductRateID)
	from   	MstProductRate
	where   (ProductRateID = @ProductRateID)

	if @intcntr  > 0
	begin
	        select 'Product Rate Already Exists'
	        return
	end

	IF @ProductID=''
	BEGIN
	        select 'Select  Product  Id'
	        return
	END


	BEGIN TRANSACTION   


	-- Auto Generate New ProductRate ID
	set @AutoGenPrefix = 	@CompanyId + @BranchId
	exec  AutoGenerateID 'MstProductRate' , 'ProductRateID' , 20 , @AutoGenPrefix , @NewProductRateID output     

	Insert Into MstProductRate 
	(ProductRateID,ProductID,EffectiveDate,UnitSaleRate,CompanyId,BranchId)  
	values	
	(@NewProductRateID, @ProductID,Convert(DateTime,@EffectiveDate,103),@UnitSaleRate, @CompanyId, @BranchId)
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Product Rate Data' + @NewProductRateID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewProductRateID
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstProductRate_Delete]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Swarnali -- 07/05/2007
CREATE PROCEDURE [dbo].[MstProductRate_Delete] 
(
	@ProductRateID	 as varchar(20),
	@LogUserId    	 as varchar(12),
	@CompanyId  	 as varchar(2),
	@BranchId        as varchar(3)
)
As 
 
Begin
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	BEGIN TRANSACTION   

	Delete from  MstProductRate 
	Where ProductRateID=@ProductRateID


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Deleted Product Rate Data' + @ProductRateID
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select '*Data Deleted Successfully.'
  
 END
GO
/****** Object:  StoredProcedure [dbo].[MstOpeningStock_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

sp_help MstOpeningStock

sp_help TrnCurrentStock

select * from TrnCurrentStock

select * from TrnStockInDtl

sp_help TrnStockInDtl

select * from MstProductRate

sp_help MstProductRate

*/

CREATE procedure [dbo].[MstOpeningStock_Insert]

		@OpeningStockID			Varchar(10),
		@GRNNo					Varchar(15),
		@GRNDate				Varchar(10),
		@ProductID				Varchar(10),
		@StockPointID			Varchar(10),
		@OpeningQty				Decimal(18,3),
		
		@LogUserId    			Varchar(12),
		@CompanyID				Varchar(2),
		@BranchID				Varchar(3),
		@FinYearID				Varchar(4)

As


	Declare @AutoGenPrefix			varchar(9)
	Declare @NewOpeningStockID		varchar(15)
	Declare @logMsg					Varchar(200)
	Declare @CurDatetime			DateTime
	Declare @NewCurrentStockID		varchar(15)
	Declare @CntCurrentStock		Int
	Declare @StockInQty				Decimal(18,3)
	Declare @StockOutQty			Decimal(18,3)
	Declare @UnitsaleRate			Decimal(18,2)
	Declare @NewStockInDtlID		varchar(15)
	Declare	@intCntr				Int

	Set @CurDateTime = Getdate()


	-------------- All Validations -------------------------------------------------------------------------

		IF @StockPointID =''
		Begin
			select 'Please Give Stock Point'
			return
		END

		IF @StockPointID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstStockPoint
			where   (StockPointID = @StockPointID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Stock Point ID'
				return
			end
		END

		IF @ProductID =''
		Begin
			select 'Please Give Product'
			return
		END

		IF @ProductID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Product ID'
				return
			end
		END

	-------------- All Validations -------------------------------------------------------------------------

	
	-- Auto Generate New Stock point ID
	Set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	Exec AutoGenerateID 'MstOpeningStock' , 'OpeningStockID' , 15 , @AutoGenPrefix , @NewOpeningStockID output
	
	Begin Transaction T
	
	Insert Into
	MstOpeningStock(OpeningStockID,GRNNo,GRNDate,ProductID,StockPointID,OpeningQty,CompanyID,BranchID,FinYearID)
	Values (@NewOpeningStockID,@GRNNo,Convert(DateTime,@GRNDate,103),@ProductID,
	@StockPointID,@OpeningQty,@CompanyID,@BranchID,@FinYearID)
	
	
	-------------------- Effect In Stock ----------------------------------------------------------------------

	Exec AutoGenerateID 'TrnCurrentStock' , 'CurrentStockID' , 15 , @AutoGenPrefix , @NewCurrentStockID output
	
	Select		@CntCurrentStock=Count(CurrentStockID)
	From		TrnCurrentStock
	Where		ProductID=@ProductID
	And			StockPointID=@StockPointID
	And			CompanyID=@CompanyID
	And			BranchID=@BranchID
	And			FinYearID=@FinYearID

	Select		@StockInQty=StockInQty,@StockOutQty=StockOutQty
	From		TrnCurrentStock
	Where		ProductID=@ProductID
	And			StockPointID=@StockPointID
	And			CompanyID=@CompanyID
	And			BranchID=@BranchID
	And			FinYearID=@FinYearID


	If @CntCurrentStock > 0
	Begin
			If  @StockInQty=0 And @StockOutQty=0
			Begin
				Update		TrnCurrentStock
				Set			OpeningStockQty=@OpeningQty
				Where		ProductID=@ProductID
				And			StockPointID=@StockPointID
				And			CompanyID=@CompanyID
				And			BranchID=@BranchID
				And			FinYearID=@FinYearID
			End
			Else
			Begin
					Return 'Transaction already Started So Opening Stock Can not be changed'
			End
	End
	Else
	Begin
		Insert Into TrnCurrentStock
		(CurrentStockID,ProductID,StockPointID,OpeningStockQty,StockInQty,StockOutQty,ClosingStockQty,CompanyID,
		BranchID,FinYearID)
		Values(@NewCurrentStockID,@ProductID,@StockPointID,@OpeningQty,0,0,0,@CompanyID,@BranchID,@FinYearID)
	
	End

	Select		@UnitSaleRate=UnitSaleRate
	From		MstProductRate
	Where		ProductID=@ProductID
	And			CompanyID=@CompanyID
	And			BranchID=@BranchID

	Exec AutoGenerateID 'TrnStockInDtl' , 'TrnStockInDtlID' , 15 , @AutoGenPrefix , @NewCurrentStockID output

	Insert Into TrnStockInDtl
	(StockInDtlID,InDocType,InDocNo,InDocDate,StockPointID,ProductID,StockINQty,UtilQty,
	PurchaseRate,VATRate,GRNNo,GRNDate,CompanyID,BranchID,FinYearID)
	Values(@NewCurrentStockID,'OPB',@NewCurrentStockID,@CurDateTime,@StockPointID,@ProductID,@OpeningQty,
	0,@UnitsaleRate,0,@GRNNo,Convert(DateTime,@GRNDate,103),@CompanyID,@BranchID,@FinYearID)
	
	-------------------- Effect In Stock ----------------------------------------------------------------------
	
	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Opening Stock Data' + @NewOpeningStockID
	Exec UserLog_Insert @CurDateTime, @LogUserID, @LogMsg

	If @@Error<>0
	Begin
		Rollback Transaction T
		Return @@Error
	End

	Commit Transaction T

	--Select '*Data Saved Successfully.'
	Select @NewOpeningStockID
GO
/****** Object:  StoredProcedure [dbo].[MstProducts_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Swarnali -- 25/04/2007

CREATE PROCEDURE [dbo].[MstProducts_Select]
(
	@ProductID	 as varchar(10)
)
As 
BEGIN
	Select  ProductID, ProductName, ProductSpec, MstProductGroup.ProductGroupID, ProductGroupName,MstManufacturer.ManufacturerId,ManufacturerName, ProductUOM, ReorderLevel
	 from  MstProduct, MstProductGroup,MstManufacturer
	 Where ProductID=@ProductID
	and 	MstProduct.ProductGroupID =  MstProductGroup.ProductGroupID
	and       MstProduct.ManufacturerId *= MstManufacturer.ManufacturerID
END
GO
/****** Object:  StoredProcedure [dbo].[MstProductRate_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from mstStockPoint
select * from MstProductRate where productid='0100100006'
select * from MstProduct where productid in (0100100007,0100100006,0300700001)

MstProductRate_Select '','0100100006','01','001'

Select	UnitSaleRate
From	MstProductRate MPR
Inner	Join MstProduct MP On MP.ProductID=MPR.ProductID
And		MP.CompanyID='01'
And		MP.BranchID='001'

Where	MPR.ProductID='0100100006'
And		MPR.CompanyID='01'
And		MPR.BranchID='001'

*/

-- Author : Swarnali -- 07/05/2007

CREATE PROCEDURE [dbo].[MstProductRate_Select]
(
	@ProductRateID	Varchar(20),
	@ProductID		Varchar(10),
	@CompanyID		Varchar(2),
	@BranchID		Varchar(3)
)

As

		If @ProductID = ''
		Begin
			Select	MPR.ProductRateId,MP.ProductID,MP.ProductName,MPR.EffectiveDate,MPR.UnitSaleRate
			From	MstProductRate MPR
			Inner	Join MstProduct MP On MP.ProductID=MPR.ProductID
			And		MP.CompanyID=@CompanyID
			And		MP.BranchID=@BranchID
			Where	MPR.ProductRateID=@ProductRateID
			And		MPR.CompanyID=@CompanyID
			And		MPR.BranchID=@BranchID
		End
		Else
			Select	UnitSaleRate
			From	MstProductRate MPR
			Inner	Join MstProduct MP On MP.ProductID=MPR.ProductID
			And		MP.CompanyID=@CompanyID
			And		MP.BranchID=@BranchID

			Where	MPR.ProductID=@ProductID
			And		MPR.CompanyID=@CompanyID
			And		MPR.BranchID=@BranchID
GO
/****** Object:  StoredProcedure [dbo].[MstSupplierRate_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
Created By			: Indranil Roy
Creation Date		: 08.05.2007
Altered By			: N/A
Alteration Date		: N/A

select * from mstsupplierrate

select * from mstproduct

sp_help mstsupplierrate
******************************************************************************/


CREATE PROCEDURE [dbo].[MstSupplierRate_Select]

	@SupplierRateID		Varchar(10),
	@Mode				Varchar(1)=''

As

	If @Mode='V'
	Begin
		Select		SR.SupplierRateID,S.SupplierName,P.ProductName,Convert(Varchar(20),SR.EffectiveDate,103) As EffectiveDate,
					SR.SupplierRate
		From		MstSupplierRate SR
		Inner Join	MstProduct P On P.ProductID=SR.ProductID
		Inner Join	MstSupplier S On S.SupplierID=SR.SupplierID
		Where		SupplierRateID=@SupplierRateID
	End
	Else
	Begin
		Select		SupplierRateID,SupplierID,ProductID,EffectiveDate,SupplierRate
		From		MstSupplierRate
		Where		SupplierRateID=@SupplierRateID
	End
GO
/****** Object:  Table [dbo].[TrnDeliveryNoteHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnDeliveryNoteHdr](
	[DeliveryNoteNo] [varchar](15) NOT NULL,
	[DeliveryNoteDate] [datetime] NOT NULL,
	[PurchaseReturnTag] [varchar](1) NOT NULL,
	[SupplierID] [varchar](10) NULL,
	[CustomerID] [varchar](10) NULL,
	[ProformaInvNo] [varchar](15) NULL,
	[GRNNo] [varchar](15) NULL,
	[ShippingAddress] [varchar](200) NOT NULL,
	[ShippingCity] [varchar](50) NULL,
	[ShippingPin] [varchar](15) NULL,
	[DespatchMode] [varchar](20) NULL,
	[DeliveredBy] [varchar](50) NULL,
	[VehicleNo] [varchar](30) NULL,
	[Remarks] [varchar](200) NULL,
	[ProductTotalAmt] [decimal](18, 2) NULL,
	[VATRate] [decimal](18, 2) NULL,
	[VATAmt] [decimal](18, 2) NULL,
	[TotalAmt] [decimal](18, 2) NULL,
	[DeliveryNoteStatus] [varchar](3) NOT NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnDeliveryNoteHdr] PRIMARY KEY CLUSTERED 
(
	[DeliveryNoteNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnDeliveryNoteHdr] ([DeliveryNoteNo], [DeliveryNoteDate], [PurchaseReturnTag], [SupplierID], [CustomerID], [ProformaInvNo], [GRNNo], [ShippingAddress], [ShippingCity], [ShippingPin], [DespatchMode], [DeliveredBy], [VehicleNo], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [TotalAmt], [DeliveryNoteStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'N', NULL, N'0100100001', N'010017777000001', NULL, N'7/4 kualalumpur.', N'kolkata', N'7220154', N'Road', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'UTL', NULL, NULL, N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNote_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Procedure [dbo].[TrnDeliveryNote_Update]
(
	@DeliveryNoteNo 	Varchar(15),
	@ShippingAddress 	Varchar(200),
	@ShippingCity 		Varchar(50),
	@ShippingPin 		Varchar(15),
	@DespatchMode 	Varchar(20),
	@DeliveredBy 		Varchar(50),
	@VehicleNo 		Varchar(30),
	@Remarks 		Varchar(200),

	@LogUserId		Varchar(12),
	@CompanyId		Varchar(2),
	@BranchId        		Varchar(3),
	@FinYearID        	Varchar(4)

)
as
	Begin

	Declare	@intCntr	as int
	Declare	@logMsg 	as Varchar(200)
	Declare	@CurDatetime	as datetime	
	Declare	@intError	as integer

		BEGIN TRANSACTION
			Update TrnDeliveryNoteHdr
			Set ShippingAddress=@ShippingAddress,
			ShippingCity=@ShippingCity,
			ShippingPin=@ShippingPin,
			DespatchMode=@DespatchMode,
			DeliveredBy=@DeliveredBy,
			VehicleNo=@VehicleNo,
			Remarks=@Remarks,
			CompanyID=@CompanyId,
			BranchID=@BranchId,
			FinYearID=@FinYearID
			Where DeliveryNoteNo=@DeliveryNoteNo
			select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
			-- Inserting Values into Log Table
			Set @LogMsg= 'Updating TrnDeliveryNoteHdr' + @DeliveryNoteNo
			Set @CurDateTime = getdate()
			Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
			select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
		COMMIT TRANSACTION
		select @DeliveryNoteNo
	End
GO
/****** Object:  StoredProcedure [dbo].[rptPurchaseInvDtl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnPurchaseInvoiceDtl

*/

CREATE procedure [dbo].[rptPurchaseInvDtl_Select]

	@PurchaseInvNo				Varchar(15),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)

As


	Select	TPID.PurchaseInvNo,MP.ProductName,MP.ProductUOM,TPID.ProductQty,TPID.ProductRate,TPID.ProductAmt
	From	TrnPurchaseInvoiceDtl TPID

	Inner	Join MstProduct MP On MP.ProductID=TPID.ProductID
	And		MP.CompanyId=@CompanyId
	And		MP.BranchId=@BranchId

	Inner	Join TrnPurchaseInvoiceHdr TPIH On TPIH.PurchaseInvNo=TPID.PurchaseInvNo
	And		TPIH.CompanyId=@CompanyId
	And		TPIH.BranchId=@BranchId
	And		TPIH.FinYearID=@FinYearID

	Where	TPID.PurchaseInvNo=@PurchaseInvNo
GO
/****** Object:  StoredProcedure [dbo].[rptGRNHdr_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[rptGRNHdr_Select]
(
	 @GRNNo  varchar(15)
)
 AS

BEGIN
	SELECT  TrnGRNHdr.GRNDate, TrnGRNHdr.PurchaseOrderNo, TrnGRNHdr.StockPointID, TrnGRNHdr.RefDeliveryNoteNo, 
                TrnGRNHdr.RefDeliveryNoteDate, TrnGRNHdr.DeliveredBy, TrnGRNHdr.VehicleNo, TrnGRNHdr.Remarks, 
                MstSupplier.SupplierName, TrnPurchaseOrderHdr.PurchaseOrderDate, TrnGRNHdr.GRNNo, MstStockPoint.StockPointName
	FROM  TrnGRNHdr INNER JOIN
                MstSupplier ON TrnGRNHdr.SupplierID = MstSupplier.SupplierID INNER JOIN
                TrnPurchaseOrderHdr ON TrnGRNHdr.PurchaseOrderNo = TrnPurchaseOrderHdr.PurchaseOrderNo INNER JOIN
                MstStockPoint ON TrnGRNHdr.StockPointID = MstStockPoint.StockPointID
	Where GRNNo=@GRNNo
END
GO
/****** Object:  StoredProcedure [dbo].[PurchaseRetdetail_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PurchaseRetdetail_Select]
(
	@GRNNo     as varchar(15)
)
as
Begin
SELECT MstSupplier.SupplierName, MstSupplier.SupplierAddress, MstSupplier.SupplierCity, 
MstSupplier.SupplierPin,TrnGRNHdr.RefDeliveryNoteNo, TrnGRNHdr.RefDeliveryNoteDate
FROM TrnGRNHdr INNER JOIN
MstSupplier ON TrnGRNHdr.SupplierID = MstSupplier.SupplierID
Where TrnGRNHdr.GRNNo=@GRNNo
End
GO
/****** Object:  StoredProcedure [dbo].[PurchaseRetddl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PurchaseRetddl_Select]
(
	@CompanyId      	as varchar(2),  
	@BranchId           	as varchar(3),  
	@FinYearID          	as varchar(4)  
)
as
Begin
	SELECT GRNNo FROM TrnGRNHdr
	Where GRNStatus='NUT' 
	and CompanyID=@CompanyId
	and BranchID=@BranchId 
	and FinYearID=@FinYearID
End
GO
/****** Object:  StoredProcedure [dbo].[TrnJobDetails_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from TrnJobHdr
select * from TrnJobLabWorkDtl
*/


CREATE procedure [dbo].[TrnJobDetails_Select]

	@JobNo				Varchar(15),
	@CompanyID			Varchar(2),
	@BranchID			Varchar(3),
	@FinYearID			Varchar(4),
	@Mode				Varchar(1)


As


	If	@Mode = 'V'
	Begin
			Select		TJH.JobNo,Convert(Varchar(10),TJH.JobStartDate,103) As JobStartDate,MC.CustomerName,
						TJH.JobAddress,TJH.JobCity,TJH.JobPin,TJH.Remarks,
						Convert(Varchar(10),TJH.CancelDate,103) As CancelDate,TJH.CancelReason,TJH.LabWorkTotal
			From		TrnJobHdr TJH
			Inner		Join	MstCustomer MC On MC.CustomerID=TJH.CustomerID
			And			MC.CompanyID=@CompanyID
			And			MC.BranchID=@BranchID
			Where		TJH.JobNo=@JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			
			Select		Convert(Varchar(10),TJLWD.WorkDate,103) As WorkDate,MLC.LabourCategoryName,
						TJLWD.LabourRate,TJLWD.NoOfLabour,TJLWD.WorkHour,TJLWD.LabourAmt
			From		TrnJobLabWorkDtl TJLWD
			Inner Join	MstLabourCategory MLC On MLC.LabourCategoryID=TJLWD.LabourCategoryID
			And			MLC.CompanyID=@CompanyID
			And			MLC.BranchID=@BranchID		
			Inner Join	TrnJobHdr TJH On TJH.JobNo=TJLWD.JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			Where		TJLWD.JobNo=@JobNo	
	End
If	@Mode = 'E'
	Begin
			Select		TJH.JobNo,Convert(Varchar(10),TJH.JobStartDate,103) As JobStartDate,TJH.CustomerID,
						TJH.JobAddress,TJH.JobCity,TJH.JobPin,TJH.Remarks,TJH.CustomerName,
						Convert(Varchar(10),TJH.CancelDate,103) As CancelDate,TJH.CancelReason,TJH.LabWorkTotal
			From		TrnJobHdr TJH
			Where		TJH.JobNo=@JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			
			Select		Count(TrnJobLabWorkDtl.JobLabWorkDtlID) As TotalRows
			From		TrnJobLabWorkDtl
			Inner		Join TrnJobHdr On TrnJobHdr.JobNo=TrnJobLabWorkDtl.JobNo
			And			TrnJobHdr.CompanyID=@CompanyID
			And			TrnJobHdr.BranchID=@BranchID
			And			TrnJobHdr.FinYearID=@FinYearID
			Where		TrnJobLabWorkDtl.JobNo=@JobNo
			
			Select		Convert(Varchar(10),TJLWD.WorkDate,103) As WorkDate,TJLWD.LabourCategoryID,
						TJLWD.LabourRate,TJLWD.NoOfLabour,TJLWD.WorkHour,TJLWD.LabourAmt
			From		TrnJobLabWorkDtl TJLWD
			Inner Join	TrnJobHdr TJH On TJH.JobNo=TJLWD.JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			Where		TJLWD.JobNo=@JobNo
	End

If	@Mode = ''
Begin
	If	@JobNo <> ''
	Begin
			Select		TJH.JobNo,Convert(Varchar(10),TJH.JobStartDate,103) As JobStartDate,MC.CustomerName,
						MC.CustomerID
			From		TrnJobHdr TJH
			Inner Join	MstCustomer MC On MC.CustomerID=TJH.CustomerID
			And			MC.CompanyID=@CompanyID
			And			MC.BranchID=@BranchID

			Where		TJH.JobNo=@JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
	End
	Else
	Begin
			Select		JobNo
			From		TrnJobHdr
			Where		CompanyID=@CompanyID
			And			BranchID=@BranchID
			And			FinYearID=@FinYearID
			
	End
End
GO
/****** Object:  Table [dbo].[TrnGRNDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnGRNDtl](
	[GRNDtlID] [varchar](18) NOT NULL,
	[GRNNo] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[BalancePOQty] [decimal](18, 3) NOT NULL,
	[InvoiceQty] [decimal](18, 3) NOT NULL,
	[ReceiptQty] [decimal](18, 3) NOT NULL,
	[Amount] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnGRNDtl] PRIMARY KEY CLUSTERED 
(
	[GRNDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnGRNDtl] UNIQUE NONCLUSTERED 
(
	[GRNNo] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnGRNDtl', @level2type=N'COLUMN',@level2name=N'BalancePOQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnGRNDtl', @level2type=N'COLUMN',@level2name=N'InvoiceQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TrnGRNDtl', @level2type=N'COLUMN',@level2name=N'ReceiptQty'
GO
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010010607000001001', N'010010607000001', N'0100100002', CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010010607000001002', N'010010607000001', N'0100100003', CAST(5.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010010607000002001', N'010010607000002', N'0100100001', CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010010607000002002', N'010010607000002', N'0100100002', CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010010607000003001', N'010010607000003', N'0100100002', CAST(4.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010010607000003002', N'010010607000003', N'0100100005', CAST(4.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010017777000001001', N'010017777000001', N'0100100004', CAST(20.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010017777000002001', N'010017777000002', N'0100100004', CAST(15.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010017777000003001', N'010017777000003', N'0100100001', CAST(5.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnGRNDtl] ([GRNDtlID], [GRNNo], [ProductID], [BalancePOQty], [InvoiceQty], [ReceiptQty], [Amount]) VALUES (N'010017777000003002', N'010017777000003', N'0100100004', CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
/****** Object:  StoredProcedure [dbo].[TrnGoodsReceiptNo_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 28/05/2007
/*
<NewDataSet>
	<GRNDetail>
	<ProductID>0000000001</ProductID>
	<BalancePOQty>4.000</BalancePOQty>
	<ReceiptQty>1</ReceiptQty>
	<Rate>4.00</Rate>
	</GRNDetail>
</NewDataSet>

*/


CREATE PROCEDURE [dbo].[TrnGoodsReceiptNo_Update]
(
	@GRNNo			as varchar(15)=null,
	@GRNDate			as varchar(10),
	@PurchaseOrderNo		as varchar(15)=null,
	@StockPointID			as varchar(10)=null,
	@RefDeliveryNoteNo		as varchar(30),
	@RefDeliveryNoteDate		as varchar(10) = null,
	@DeliveredBy	  		as varchar(50) = null,
	@VehicleNo	  		as varchar(30) = null,
	@Remarks  			as varchar(200) = null,
	@DetailXml			as NTEXT,
	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        			as varchar(3),
	@FinYearID        		as varchar(4)

)
As 
 
Begin

	Declare @SupplierID  as Varchar(10)
	Declare @PODate  as datetime
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	Declare @XMLFormat Int

	Declare @ProductID as Varchar(10)
	Declare @BalancePOQty as Decimal(18,3)
	Declare @ReceiptQty as Decimal(18,2)
	Declare @NewBalancePOQty as Decimal(18,3)
	Declare @Rate as Decimal(18,3)
	Declare @OldReceiptQty Decimal(18,3) 
	
	Declare @ProductQty as Decimal(18,3)
	Declare @UtilQty as Decimal(18,3)


	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*),@PODate=PurchaseOrderDate,@SupplierID=SupplierID
	from   	TrnPurchaseOrderHdr
	where   (PurchaseOrderNo = @PurchaseOrderNo and PurchaseOrderStatus in ('NUT','PUT'))
	Group By PurchaseOrderDate,SupplierID

	if @intcntr  <= 0
	begin
	        select 'Error : Invalid Purchase order or Purchase Order Utilised/Cancel/Close'
	        return
	end

	IF @GRNDate=''
	BEGIN
	        select 'Error : GRN date can not be empty'
	        return
	END
	
	IF convert(varchar,convert(datetime,@GRNDate,103),112) < convert(varchar,@PODate,112)
	BEGIN
	        select 'Error : GRN date can not be less than P.O. Date'
	        return
	END

	select  @intcntr = count(*)
	from   	MstStockPoint
	where   (StockPointID = @StockPointID)

	if @intcntr  <= 0
	begin
	        select 'Error : Invalid Stock Point ID'
	        return
	end


	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select ProductID,BalancePOQty,ReceiptQty,Rate
	From Openxml (@XMLFormat, '/NewDataSet/GRNDetail', 2)
	With 
		(
			ProductID Varchar(10),
			BalancePOQty Decimal(18,3),
			ReceiptQty Decimal(18,3),
			Rate decimal(18,2)
		)


	BEGIN TRANSACTION   

	-- Auto Generate New GRNNo
	declare @tdate as datetime

	select  @intcntr = count(*)
	from   	TrnGRNHdr
	where   (GRNStatus = 'NUT')

	if @intcntr  <= 0
	begin
	        select 'Error : GRN status should be not utilised for any modification'
	        return
	end

	
	Update TrnGRNHdr Set GRNDate=Convert(datetime,@GRNDate,103),SalesReturnTag='N',SupplierID=@SupplierID,
	CustomerID=null,PurchaseOrderNo=@PurchaseOrderNo,RefDeliveryNoteNo=@RefDeliveryNoteNo,
	RefDeliveryNoteDate=Convert(datetime,@RefDeliveryNoteDate,103),StockPointID=@StockPointID,
	DeliveredBy=@DeliveredBy,VehicleNo=@VehicleNo,Remarks=@Remarks,GRNStatus='NUT',CancelDate=null,
	CancelReason=null,CompanyID=@CompanyId,BranchID=@BranchId,FinYearID=@FinYearID
	Where GRNNo=@GRNNo
	

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@BalancePOQty,@ReceiptQty,@Rate

	While (@@Fetch_Status=0)
	Begin

		IF @ProductID=''
		Begin
			select 'Error : Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Error : Invalid product id'
				return
			end
		END


		IF isnull(@BalancePOQty,0) <=0
		Begin
			select 'Error : Balance Qty can not be empty or less than 0'
			return
		END

		IF isnull(@ReceiptQty,0) <=0
		Begin
			select 'Error : Receive Qty can not be empty or less than 0'
			return
		END

		IF isnull(@Rate,0) <=0
		Begin
			select 'Error : Balance Qty can not be empty or less than 0'
			return
		END

		Select @OldReceiptQty=ReceiptQty from TrnGRNDtl Where GRNNo=@GRNNo and ProductID=@ProductID
		
		Update TrnGRNDtl Set BalancePOQty=@BalancePOQty,ReceiptQty=@ReceiptQty
		Where GRNNo=@GRNNo and ProductID=@ProductID
		
		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


		Update TrnStockInDtl Set StockinQty=@ReceiptQty 
		Where InDocNo=@GRNNo and ProductID=@ProductID and StockPointID=@StockPointID
		
		Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


		Update TrnCurrentStock 
		Set StockInQty=(isnull(StockInQty,0) - isnull(@OldReceiptQty,0)) + @ReceiptQty 		
		Where   ProductID=@ProductID and StockPointID=@StockPointID and 
		CompanyId=@CompanyId and BranchId=@BranchId and FinYearID=@FinYearID
		
		Update TrnPurchaseOrderdtl Set UtilQty=(isnull(UtilQty,0) - isnull(@OldReceiptQty,0)) + 
		isnull(@ReceiptQty,0)
		Where ProductID=@ProductID and PurchaseOrderNo=@PurchaseOrderNo
	
		Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End		

		Fetch Next From CurDetailRecord Into @ProductID,@BalancePOQty,@ReceiptQty,@Rate

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord
	--- Validation end for detail part from here


	Select @ProductQty=sum(ProductQty) ,@UtilQty=sum(UtilQty)
	from TrnPurchaseOrderdtl Where PurchaseOrderNo=@PurchaseOrderNo
	Group By PurchaseOrderNo

	IF @ProductQty=@UtilQty
	Begin
		Update TrnPurchaseOrderHdr Set PurchaseOrderStatus='UTL' Where PurchaseOrderNo=@PurchaseOrderNo
	End
	Else
	Begin
		Update TrnPurchaseOrderHdr Set PurchaseOrderStatus='PUT' Where PurchaseOrderNo=@PurchaseOrderNo
	End




	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update Goods Receipt Note' + @GRNNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @GRNNo
  

 END
GO
/****** Object:  StoredProcedure [dbo].[TrnGoodsReceiptNo_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 28/05/2007
/*
<NewDataSet>
	<GRNDetail>
	<ProductID>0000000001</ProductID>
	<BalancePOQty>4.000</BalancePOQty>
	<ReceiptQty>1</ReceiptQty>
	<Rate>4.00</Rate>
	</GRNDetail>
</NewDataSet>

*/


CREATE PROCEDURE [dbo].[TrnGoodsReceiptNo_Insert]
(
	@GRNNo			as varchar(15)=null,
	@GRNDate			as varchar(10),
	@PurchaseOrderNo		as varchar(15)=null,
	@StockPointID			as varchar(10)=null,
	@RefDeliveryNoteNo		as varchar(30),
	@RefDeliveryNoteDate		as varchar(10) = null,
	@DeliveredBy	  		as varchar(50) = null,
	@VehicleNo	  		as varchar(30) = null,
	@Remarks  			as varchar(200) = null,
	@DetailXml			as NTEXT,
	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        			as varchar(3),
	@FinYearID        		as varchar(4)

)
As 
 
Begin

	Declare @SupplierID  as Varchar(10)
	Declare @PODate  as datetime
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	Declare @NewGRNNo as varchar(15)
	Declare @NweGRNDtlID as varchar(18)
	Declare @NewStockInDtlID as varchar(15)
	Declare @NewCurrentStockID as varchar(15)

	Declare @AutoGenPrefix as varchar(9)

	Declare @XMLFormat Int

	Declare @ProductID as Varchar(10)
	Declare @BalancePOQty as Decimal(18,3)
	Declare @ReceiptQty as Decimal(18,2)
	Declare @NewBalancePOQty as Decimal(18,3)
	Declare @Rate as Decimal(18,3)

	Declare @ProductQty as Decimal(18,3)
	Declare @UtilQty as Decimal(18,3)


	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*),@PODate=PurchaseOrderDate,@SupplierID=SupplierID
	from   	TrnPurchaseOrderHdr
	where   (PurchaseOrderNo = @PurchaseOrderNo and PurchaseOrderStatus in ('NUT','PUT'))
	Group By PurchaseOrderDate,SupplierID

	if @intcntr  <= 0
	begin
	        select 'Error : Invalid Purchase order or Purchase Order Utilised/Cancel/Close'
	        return
	end

	IF @GRNDate=''
	BEGIN
	        select 'Error : GRN date can not be empty'
	        return
	END
	
	IF convert(varchar,convert(datetime,@GRNDate,103),112) < convert(varchar,@PODate,112)
	BEGIN
	        select 'Error : GRN date can not be less than P.O. Date'
	        return
	END

	select  @intcntr = count(*)
	from   	MstStockPoint
	where   (StockPointID = @StockPointID)

	if @intcntr  <= 0
	begin
	        select 'Error : Invalid Stock Point ID'
	        return
	end


	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select ProductID,BalancePOQty,ReceiptQty,Rate
	From Openxml (@XMLFormat, '/NewDataSet/GRNDetail', 2)
	With 
		(
			ProductID Varchar(10),
			BalancePOQty Decimal(18,3),
			ReceiptQty Decimal(18,3),
			Rate decimal(18,2)
		)


	BEGIN TRANSACTION   

	-- Auto Generate New GRNNo
	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnGRNHDR' , 'GRNNo' , 15 , @AutoGenPrefix , @NewGRNNo output     
	declare @tdate as datetime


	Insert Into TrnGRNHdr
	(
		GRNNo,
		GRNDate,
		SalesReturnTag,
		SupplierID,
		CustomerID,
		PurchaseOrderNo,
		InvoiceNo,
		RefDeliveryNoteNo,
		RefDeliveryNoteDate,
		StockPointID,
		DeliveredBy,
		VehicleNo,
		Remarks,
		GRNStatus,
		CancelDate,
		CancelReason,
		CompanyID,
		BranchID,
		FinYearID
	)
	Values
	(
		@NewGRNNo,
		Convert(datetime,@GRNDate,103),
		'N',
		@SupplierID,
		null,
		@PurchaseOrderNo,
		null,
		@RefDeliveryNoteNo,
		Convert(datetime,@RefDeliveryNoteDate,103),
		@StockPointID,
		@DeliveredBy,
		@VehicleNo,
		@Remarks,
		'NUT',
		null,
		null,
		@CompanyId,
		@BranchId,
		@FinYearID
	)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@BalancePOQty,@ReceiptQty,@Rate

	While (@@Fetch_Status=0)
	Begin

		IF @ProductID=''
		Begin
			select 'Error : Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Error : Invalid product id'
				return
			end
		END


		IF isnull(@BalancePOQty,0) <=0
		Begin
			select 'Error : Balance Qty can not be empty or less than 0'
			return
		END

		IF isnull(@ReceiptQty,0) <=0
		Begin
			select 'Error : Receive Qty can not be empty or less than 0'
			return
		END

		IF isnull(@Rate,0) <=0
		Begin
			select 'Error : Balance Qty can not be empty or less than 0'
			return
		END

		-- Auto Generate New GRNDtlID
		exec  AutoGenerateID 'TrnGRNDTL' , 'GRNDtlID' , 18  , @NewGRNNo,@NweGRNDtlID output  

		INSERT into TrnGRNDtl  (GRNDtlID,GRNNo,ProductID,BalancePOQty,ReceiptQty)
		Values (@NweGRNDtlID,@NewGRNNo,@ProductID,@BalancePOQty,@ReceiptQty)	

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		---**********
		set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
		exec  AutoGenerateID 'TrnStockInDtl' , 'StockInDtlID' , 15 , @AutoGenPrefix , @NewStockInDtlID output     


		Insert Into TrnStockInDtl
		(
			StockInDtlID,
			InDocType,
			InDocNo,
			InDocDate,
			StockPointID,
			ProductID,
			StockINQty,
			PurchaseRate,
			VATRate,
			GRNNo,
			GRNDate,
			CompanyID,
			BranchID,
			FinYearID
		)
		Values
		(
			@NewStockInDtlID,
			'GRN',
			@NewGRNNo,
			Convert(datetime,@GRNDate,103),
			@StockPointID,
			@ProductID,
			@ReceiptQty,
			@Rate,
			0,
			@NewGRNNo,
			@GRNDate,
			@CompanyId,
			@BranchId,
			@FinYearID
		)

		Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Select  @intcntr = count(*)
		From   	TrnCurrentStock
		Where   ProductID=@ProductID and StockPointID=@StockPointID and 
		CompanyId=@CompanyId and BranchId=@BranchId and FinYearID=@FinYearID


		Set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
		exec  AutoGenerateID 'TrnCurrentStock' , 'CurrentStockID' , 15 , @AutoGenPrefix , @NewCurrentStockID output     

		IF @intcntr  <= 0
		Begin
			Insert Into TrnCurrentStock
			(
				CurrentStockID,
				StockPointID,
				ProductID,
				OpeningStockQty,
				StockInQty,
				StockOutQty,
				ClosingStockQty,
				CompanyID,
				BranchID,
				FinYearID
			)
			Values
			(
				@NewCurrentStockID,
				@StockPointID,
				@ProductID,
				0,
				@ReceiptQty,
				0,
				0,
				@CompanyId,
				@BranchId,
				@FinYearID
			)

			select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
		
		End
		Else
		Begin
			Update TrnCurrentStock 
			Set StockInQty=StockInQty+@ReceiptQty 		
			Where   ProductID=@ProductID and StockPointID=@StockPointID and 
			CompanyId=@CompanyId and BranchId=@BranchId and FinYearID=@FinYearID
 		End

		--*********** 
		
		update TrnPurchaseOrderdtl Set UtilQty=isnull(UtilQty,0) + isnull(@ReceiptQty,0)
		Where ProductID=@ProductID and PurchaseOrderNo=@PurchaseOrderNo
	
		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End		

		Fetch Next From CurDetailRecord Into @ProductID,@BalancePOQty,@ReceiptQty,@Rate

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord
	--- Validation end for detail part from here


	Select @ProductQty=sum(ProductQty) ,@UtilQty=sum(UtilQty)
	from TrnPurchaseOrderdtl Where PurchaseOrderNo=@PurchaseOrderNo
	Group By PurchaseOrderNo

	IF @ProductQty=@UtilQty
	Begin
		Update TrnPurchaseOrderHdr Set PurchaseOrderStatus='UTL' Where PurchaseOrderNo=@PurchaseOrderNo
	End
	Else
	Begin
		Update TrnPurchaseOrderHdr Set PurchaseOrderStatus='PUT' Where PurchaseOrderNo=@PurchaseOrderNo
	End




	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Goods Receipt Note' + @NewGRNNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewGRNNo
  

 END
GO
/****** Object:  StoredProcedure [dbo].[rptPurcsaseOrderDtl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[rptPurcsaseOrderDtl_Select]
( 
	@PurchaseOrderNo Varchar(15)
)
 AS
Begin
	SELECT MstProduct.ProductName,MstProduct.ProductUOM,TrnPurchaseOrderDtl.PurchaseOrderDtlID, 
	TrnPurchaseOrderDtl.PurchaseOrderNo,TrnPurchaseOrderDtl.ProductID,
	TrnPurchaseOrderDtl.ProductQty, 
	TrnPurchaseOrderDtl.ProductRate,TrnPurchaseOrderDtl.ProductAmt
	FROM   TrnPurchaseOrderDtl INNER JOIN
	MstProduct ON TrnPurchaseOrderDtl.ProductID = MstProduct.ProductID
	 Where TrnPurchaseOrderDtl.PurchaseOrderNo=@PurchaseOrderNo
End
GO
/****** Object:  Table [dbo].[TrnStockTransferLiftDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnStockTransferLiftDtl](
	[StockTransferLiftDtlID] [varchar](18) NOT NULL,
	[StockTransferDtlID] [varchar](18) NOT NULL,
	[StockTransferNo] [varchar](15) NOT NULL,
	[StockInDtlID] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[BalanceStockInQty] [decimal](18, 3) NOT NULL,
	[LiftQty] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnStockTransferLiftDtl] PRIMARY KEY CLUSTERED 
(
	[StockTransferLiftDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnStockTransferLiftDtl] UNIQUE NONCLUSTERED 
(
	[StockTransferDtlID] ASC,
	[StockInDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnStockTransferLiftDtl] ([StockTransferLiftDtlID], [StockTransferDtlID], [StockTransferNo], [StockInDtlID], [ProductID], [BalanceStockInQty], [LiftQty]) VALUES (N'010017777000001001', N'010017777000001002', N'010017777000001', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnStockTransferLiftDtl] ([StockTransferLiftDtlID], [StockTransferDtlID], [StockTransferNo], [StockInDtlID], [ProductID], [BalanceStockInQty], [LiftQty]) VALUES (N'010017777000001002', N'010017777000001002', N'010017777000001', N'010017777000002', N'0100100004', CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
/****** Object:  StoredProcedure [dbo].[TrnStockTransfer_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Arnab -- 04/07/2007  

/*  
<NewDataSet>\r\n  
	<DeliveryDetail>\r\n    
		
		<ProductID>
			0100100009
		</ProductID>\r\n    
		
		<Unit>
			P.C.S
		</Unit>\r\n    
		
		<BalinvQty>
			500.000
		</BalinvQty>\r\n    
		
		<TrnQty>
			100
		</TrnQty>\r\n 

	
	<LiftDetail>\r\n   
		<ProductID>
			0100100009
		</ProductID>\r\n     
		
		<InDocType>
			GRN
		</InDocType>\r\n      

		<InDocNo>
			010017777000006
		</InDocNo>\r\n     
		
		<DocDate>
			02/07/2007
		</DocDate>\r\n    

		<StockPointID>
			01001003
		</StockPointID>\r\n     
		
		<BalQty>
			500.000
		</BalQty>\r\n 

		<LiftQty>
			100
		</LiftQty>\r\n 
		
		</LiftDetail>\r\n 
	 </DeliveryDetail>\r\n
</NewDataSet>
*/  
  
 
CREATE PROCEDURE [dbo].[TrnStockTransfer_Insert]  
(  
 @StTrnNo   		as varchar(15)=null,  
 @StTrnDate   		as varchar(10),  
 @StTrnFrom 		as varchar(15)=null,  
 @StTrnTo		as varchar(200)=null,  
 @Remarks     		as varchar(200) = null,  
 @DetailXml   		as NTEXT,  
 @LogUserId      	as varchar(12),  
 @CompanyId      	as varchar(2),  
 @BranchId             	as varchar(3),  
 @FinYearID            	as varchar(4)  
  
)  
As   
   
Begin  
  
 Declare @intCntr as int  
 Declare @logMsg as Varchar(200)  
 Declare @CurDatetime as datetime   
 Declare @intError as integer  
  
 Declare @NewStTrnNo as varchar(15)  
 Declare @NewStTrnDtlID as varchar(18)  
 Declare @NewStLiftDtlID as varchar(18)  
 Declare @NewStockOutID as varchar(15)  
 Declare @CustomerID  as Varchar(10)  
 --Declare @ProformaInvDate  as datetime  
  
 Declare @AutoGenPrefix as varchar(9)  
  
 Declare @XMLFormat Int  
  
 Declare @ProductID as Varchar(10)  
 Declare @Unit as Decimal(18,3)  
 Declare @BalinvQty as Decimal(18,2)  
 Declare @TrnQty as Decimal(18,3)  
  
  
 Declare @StockInDtlID as varchar(15)  
 Declare @InDocType as varchar(3)  
 Declare @InDocNo as varchar(20)  
 Declare @InDocDate as varchar(10)  
 Declare @StockPointID as varchar(10)  
 Declare @BalQty as Decimal(18,3)  
 Declare @LiftQty as Decimal(18,3)  
  
 Declare @tmpDelQty as Decimal(18,3)  
 Declare @tmpLiftQty as Decimal(18,3)  
  
 Declare @StoreQty as Decimal(18,3)  
 Declare @OutQty as Decimal(18,3)  
  
 -- Setting Counter to zero  
 set @intCntr = 0  
  
 --- Validation start for Master part from here   
 -- Checking the Primary key violation   
  
 IF isnull(@StTrnFrom,'')=''  
 BEGIN  
         select 'Error : Stock Transfer From can not be empty'  
         return  
 END  
  
 /*select   @intcntr = count(*),  
  @ProformaInvDate=ProformaInvDate,  
  @CustomerID=CustomerID  
 from    TrnProformaInvoiceHdr  
 where   (ProformaInvNo = @ProformaInvNo   
 and  ProformaInvStatus in ('NUT','PUT'))  
 Group By ProformaInvDate,CustomerID  
  
 if @intcntr  <= 0  
 begin  
         select 'Error : Invalid Proforma Invoice no or Proforma Invoice no Utilised/Cancel/Close'  
         return  
 end  */
  
 IF isnull(@StTrnDate,'')=''  
 BEGIN  
         select 'Error : Stock Transfer date can not be empty'  
         return  
 END  
   
 /*IF convert(varchar,convert(datetime,@DVNDate,103),112) < convert(varchar,@ProformaInvDate,112)  
 BEGIN  
         select 'Error : Delivery Note date can not be less than Proforma Invoice Date'  
         return  
 END  
  
 IF isnull(@ShippingAddress,'')=''  
 BEGIN  
         select 'Error : Shipping Address can not be empty'  
         return  
 END  
  
 IF isnull(@ModeofDespatch,'')=''  
 BEGIN  
         select 'Error : Despatch Mode can not be empty'  
         return  
 END  */
  
 --- Validation end for Master part from here  
  
 --- Validation start for detail part from here  
 --Prepare input values as an XML documnet  
  
  
 Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml  
  
 -- Create Cursor from XML Table  
  
 Declare CurDetailRecord  
 Cursor For  
 Select ProductID,BalinvQty,TrnQty  
 From Openxml (@XMLFormat, '/NewDataSet/DeliveryDetail', 2)  
 With   
  (  
   ProductID Varchar(10),  
   BalinvQty Decimal(18,3),  
   TrnQty decimal(18,2)  
  )  
  
 Declare CurLiftDetailRecord  
 Cursor For  
 Select StockInDtlID,InDocType,InDocNo,DocDate,StockPointID,BalQty,LiftQty  
 From Openxml (@XMLFormat, '/NewDataSet/DeliveryDetail/LiftDetail', 3)  
 With   
  (  
   StockInDtlID Varchar(15),  
   InDocType Varchar(13),  
   InDocNo Varchar(20),  
   DocDate Varchar(10),  
   StockPointID Varchar(10),  
   BalQty decimal(18,2),  
   LiftQty decimal(18,2)  
  )  
  
  
 BEGIN TRANSACTION     
  
 -- Auto Generate New GRNNo  
 set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID  
 exec  AutoGenerateID 'TrnStockTransferHdr' , 'StockTransferNo' , 15 , @AutoGenPrefix , @NewStTrnNo output       
 --select * from trnstocktransferhdr  
 Insert Into TrnStockTransferHdr  
 (  
  StockTransferNo,  
  StockTransferDate,  
  FromStockPointID,  
  ToStockPointID,  
  Remarks,  
  StockTransferStatus, 
  CancelDate,
  CancelReason,
  CompanyID,  
  BranchID,  
  FinYearID  
 )  
 Values  
 (  
  @NewStTrnNo,  
  Convert(datetime,@StTrnDate,103),  
  @StTrnFrom,  
  @StTrnTo,  
  @Remarks,  
  'UTL',  
  null,  
  null,  
  @CompanyId,  
  @BranchId,  
  @FinYearID  
 )  
  
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
  
 Open CurDetailRecord  
 Fetch Next From CurDetailRecord Into @ProductID,@BalinvQty,@TrnQty  
  
 While (@@Fetch_Status=0)  
 Begin  
  
  IF isnull(@ProductID,'')=''  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : Product can not be empty'  
   return  
  END  
  
  IF isnull(@ProductID,'')<>''  
  Begin  
   select  @intcntr = count(*)  
   from    MstProduct  
   where   (ProductID = @ProductID)  
   
   if @intcntr  <= 0  
   begin  
    ROLLBACK TRANSACTION  
            select 'Error : product does not exist'  
    return  
   end  
  END  
  
  IF isnull(@BalinvQty,0) <=0  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : P.Inv.Qty can not be empty or less than 0'  
   return  
  END  
  
  IF isnull(@TrnQty,0) <=0  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : Delivered Qty can not be empty or less than 0'  
   return  
  END  
  
  IF isnull(@TrnQty,0) > isnull(@BalinvQty,0)  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : Delivered Qty can not be more than balance qty'  
   return  
  END  
    
  Set @tmpDelQty=@TrnQty  
  -- Auto Generate New GRNDtlID  
  exec  AutoGenerateID 'TrnDeliveryNoteDtl' , 'DeliveryNoteDtlID' , 18  , @NewStTrnNo,@NewStTrnDtlID output    
  
  Declare @Rate Decimal(18,2)
  select @Rate=PurchaseRate from TrnStockInDtl where ProductId=@ProductID

  Insert into TrnStockTransferDtl  
  (  
   StockTransferDtlID,  
   StockTransferNo,  
   ProductID,  
   Rate,  
   BalanceStockQty,  
   TransferQty  
  )  
  Values  
  (  
   @NewStTrnDtlID,  
   @NewStTrnNo,  
   @ProductID,  
   @Rate,  
   @BalinvQty,  
   @TrnQty
  
  )  
  
  select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
  
  --**********Second Cursor Start  
   Open CurLiftDetailRecord  
   Fetch Next From CurLiftDetailRecord Into @StockInDtlID,@InDocType,@InDocNo,@InDocDate,@StockPointID,@BalQty,@LiftQty  
    
   While (@@Fetch_Status=0)  
   Begin  
  
    IF isnull(@NewStTrnDtlID,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Stock In Detail id can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@InDocType,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Doc Type can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@InDocNo,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Doc no can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@InDocDate,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Doc date can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@StockPointID,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Stock Point can not be empty or less than 0'  
     return  
    END  
  
    select  @intcntr = count(*)  
    from    MstStockPoint  
    where   (StockPointID = @StockPointID)  
     
    if @intcntr  <= 0  
    begin  
     ROLLBACK TRANSACTION  
            select 'Error : Invalid Stock Point selected'  
            return  
    end  
  
    IF isnull(@BalQty,0) < 0  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Balance Qty can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@LiftQty,0) < 0  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Lift Qty can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@LiftQty,0) > isnull(@BalQty,0)  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Delivered Qty can not be more than balance qty'  
     return  
    END  
      
    Set @tmpLiftQty=isnull(@tmpLiftQty,0)+isnull(@LiftQty,0)  
    exec  AutoGenerateID 'TrnStockTransferLiftDtl','StockTransferLiftDtlID',18,@NewStTrnNo,@NewStLiftDtlID output    
    Insert into TrnStockTransferLiftDtl  
    (  
     StockTransferLiftDtlID,  
     StockTransferDtlID,  
     StockTransferNo,  
     StockInDtlID,  
     ProductID,  
     BalanceStockInQty,  
     LiftQty  
    )  
    Values  
    (  
     @NewStLiftDtlID,  
     @NewStTrnDtlID,  
     @NewStTrnNo,  
     @StockInDtlID,  
     @ProductID,  
     @BalQty,  
     @LiftQty  
    )  
    select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
   
    set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID  
    exec  AutoGenerateID 'TrnStockOutDtl' , 'StockOutDtlID' , 15 , @AutoGenPrefix , @NewStockOutID output       
/*    --Doubts where it will be placed in outer cursor or inner  
    Insert Into TrnStockOutDtl  
    (  
     StockOutDtlID,  
     StockInDtlID,  
     OutDocType,  
     OutDocNo,  
     OutDocDate,  
     StockPointID,  
     ProductID,  
     StockOutQty,  
     SaleRate,  
     VATRate,  
     CompanyID,  
     BranchID,  
     FinYearID  
    )  
    Values  
    (  
     @NewStockOutID,  
     @StockInDtlID,  
     'DVN',  
     @NewDVNNo,  
     Convert(datetime,@DVNDate,103),  
     @StockPointID,  
     @ProductID,  
     @LiftQty,  
     @Rate,  
     0,  
     @CompanyId,  
     @BranchId,  
     @FinYearID  
    )  
    */
    Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
    
    Select  @intcntr = count(*)  
    From    TrnCurrentStock  
    Where   ProductID=@ProductID   
    and  StockPointID=@StockPointID   
    and  CompanyId=@CompanyId   
    and  BranchId=@BranchId   
    and  FinYearID=@FinYearID  
      
    -- ## check BALANCE Qty       
    Select @StoreQty=isnull(StockInQty,0),@OutQty=isnull(UtilQty,0)  
    From TrnStockInDtl Where StockInDtlID=@StockInDtlID  
      
    IF isnull(@StoreQty,0) < isnull(@OutQty,0)           
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Utilised Qty can''t be more than StockinQty'  
     return  
    End  
  
    Update TrnStockInDtl   
    Set  UtilQty=isnull(UtilQty,0) + isnull(@LiftQty,0)  
    Where  StockInDtlID=@StockInDtlID  
      
    select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
  
    -- ## check BALANCE Qty    
     
    Select  	@StoreQty=isnull(OpeningStockQty,0) +  isnull(StockInQty,0) - isnull(StockOutQty,0)  
    From  	TrnCurrentStock   
    Where  	ProductID=@ProductID    
    and  	StockPointID=@StockPointID   
    and 	CompanyID=@CompanyID   
    and  	BranchID=@BranchID   
    and  	FinYearID=@FinYearID  
  
    IF isnull(@StoreQty,0) <  isnull(@LiftQty,0)         
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Utilised Qty can''t be more than Lift Qty'  
     return  
    End  
  
      
    Update TrnCurrentStock   
    Set  StockOutQty=isnull(StockOutQty,0) + @LiftQty  
    Where  ProductID=@ProductID   
    and  StockPointID=@StockPointID   
    and CompanyID=@CompanyID   
    and  BranchID=@BranchID   
    and  FinYearID=@FinYearID  
    select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
    
    Fetch Next From CurLiftDetailRecord Into @StockInDtlID,@InDocType,@InDocNo,@InDocDate,@StockPointID,@BalQty,@LiftQty  
   End  
   Close CurLiftDetailRecord  
   Deallocate CurLiftDetailRecord  
																														     
  
   -- ## check BALANCE Qty       
/*   Select  @StoreQty=isnull(ProductQty,0),  
   @OutQty=isnull(UtilQty,0)  
   From  TrnProformaInvoiceDtl   
   Where  ProformaInvNo=@ProformaInvNo   
   and  ProductID=@ProductID  */
  
/*arnab   IF isnull(@StoreQty,0) < isnull(@OutQty,0)           
   Begin  
    ROLLBACK TRANSACTION  
    select 'Error : Product Qty can''t be more than UtilQty'  
    return  
   End  arnab */
  
/*   Update TrnProformaInvoiceDtl   
   Set  UtilQty=isnull(UtilQty,0) + @TrnQty  
   Where  ProformaInvNo=@ProformaInvNo   
   and  ProductID=@ProductID  
   select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    */
  
   -- ## check Deleivery qty with Total lift qty.  

/* arnab
   if @tmpLiftQty <> @tmpDelQty  
   Begin  
    ROLLBACK TRANSACTION  
    select 'Error : Delivered Qty and lift qty must be same'  
    return  
   End  
   Set @tmpLiftQty=0  arnab */
  
/* arnab
  Fetch Next From CurDetailRecord Into @ProductID,@Unit,@BalinvQty,@TrnQty  arnab */
 End  
   
 Close CurDetailRecord  
 Deallocate CurDetailRecord  
 --- Validation end for detail part from here  
   
/* Update TrnProformaInvoiceHdr   
 Set  ProformaInvStatus='PUT'  
 Where ProformaInvNo=@ProformaInvNo  */
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
  
  
/* Select @StoreQty=sum(ProductQty),@OutQty=sum(UtilQty)  
 from TrnProformaInvoiceDtl Where ProformaInvNo=@ProformaInvNo  
 Group By ProformaInvNo	*/  
  
/* IF @StoreQty=@OutQty  
 Begin  
  Update TrnProformaInvoiceHdr Set ProformaInvStatus='UTL' Where ProformaInvNo=@ProformaInvNo  
 End  
 Else  
 Begin  
  Update TrnProformaInvoiceHdr Set ProformaInvStatus='PUT' Where ProformaInvNo=@ProformaInvNo  
 End  	*/
  
 -- Inserting Values into Log Table   
 Set @LogMsg= 'Insert Delivery Note' + @NewStTrnNo  
 Set @CurDateTime = getdate()  
 Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg  
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
   
 COMMIT TRANSACTION  
 select @NewStTrnNo  
      
 END
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrderDetail_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 24/05/2007
CREATE PROCEDURE [dbo].[TrnPurchaseOrderDetail_Select]
(
	@PurchaseOrderNo varchar(15)
)
as
BEGIN
	SELECT TrnPurchaseOrderHdr.PurchaseOrderDate, 
	TrnPurchaseOrderHdr.SupplierID,MstSupplier.SupplierName
	FROM MstSupplier INNER JOIN TrnPurchaseOrderHdr ON 
	MstSupplier.SupplierID = TrnPurchaseOrderHdr.SupplierID
	Where TrnPurchaseOrderHdr.PurchaseOrderNo=@PurchaseOrderNo

	SELECT     TrnPurchaseOrderDtl.ProductID, MstProduct.ProductName, isnull(MstProduct.ProductUOM,0) as Unit, 
		 (isnull( TrnPurchaseOrderDtl.ProductQty,0)-isnull( TrnPurchaseOrderDtl.UtilQty,0)) as Qty,
		 isnull(TrnPurchaseOrderDtl.ProductRate,0) as Rate,0 as RcptQty
	FROM         MstProduct INNER JOIN TrnPurchaseOrderDtl ON MstProduct.ProductID = TrnPurchaseOrderDtl.ProductID
	Where TrnPurchaseOrderDtl.PurchaseOrderNo=@PurchaseOrderNo and
	 (isnull( TrnPurchaseOrderDtl.ProductQty,0)-isnull( TrnPurchaseOrderDtl.UtilQty,0)) > 0
END
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrder_View]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 01/05/2007

CREATE PROCEDURE [dbo].[TrnPurchaseOrder_View]
(
	@PurchaseOrderNo	 	as varchar(15)
)
As 
Begin
	SELECT  TrnPurchaseOrderHdr.*,MstSupplier.SupplierName,MstDepartment.DepartmentName,MstProductGroup.ProductGroupName
	FROM TrnPurchaseOrderHdr INNER JOIN
	MstDepartment ON TrnPurchaseOrderHdr.DepartmentID = MstDepartment.DepartmentID INNER JOIN
	MstProductGroup ON TrnPurchaseOrderHdr.ProductGroupID = MstProductGroup.ProductGroupID INNER JOIN
	MstSupplier ON TrnPurchaseOrderHdr.SupplierID = MstSupplier.SupplierID
	 Where PurchaseOrderNo=@PurchaseOrderNo

	Select  TrnPurchaseOrderDtl.*,mstProduct.ProductName,mstProduct.ProductUOM  from TrnPurchaseOrderDtl,mstProduct 
	 Where TrnPurchaseOrderDtl.ProductID=mstProduct.ProductID and PurchaseOrderNo=@PurchaseOrderNo


END
GO
/****** Object:  StoredProcedure [dbo].[TrnPopulateProduct_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TrnPopulateProduct_Select]

	@StockPointID	INT,
	@CompanyID	INT,
	@BranchID	INT,
	@FinYearID	INT

AS

SELECT     dbo.MstProduct.ProductName + ' [ ' + Convert(varchar, isnull(TrnCurrentStock.OpeningStockQty,0) + 
isnull(TrnCurrentStock.StockinQty,0) - isnull(TrnCurrentStock.StockOutQty,0)) + '  ' + dbo.MstProduct.ProductUOM + ' ]'
	 as ProductName , 
	   dbo.TrnCurrentStock.CompanyID, 
	   dbo.TrnCurrentStock.BranchID, 
	   dbo.TrnCurrentStock.FinYearID, 
           dbo.MstProduct.ProductID, dbo.TrnCurrentStock.StockPointID
FROM       dbo.TrnCurrentStock INNER JOIN
           dbo.MstProduct ON dbo.TrnCurrentStock.ProductID = dbo.MstProduct.ProductID
	   WHERE TrnCurrentStock.StockPointID=@StockPointID AND TrnCurrentStock.CompanyID=@CompanyID 
	   AND TrnCurrentStock.BranchID=@BranchID AND TrnCurrentStock.FinYearID=@FinYearID
	   AND 	(isnull(TrnCurrentStock.OpeningStockQty,0) + isnull(TrnCurrentStock.StockinQty,0) - isnull(TrnCurrentStock.StockOutQty,0)) > 0
GO
/****** Object:  StoredProcedure [dbo].[TrnListGRN]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from TrnGRNHdr
/*

select * from TrnGRNHdr
*/


CREATE procedure [dbo].[TrnListGRN]


		@PurchaseOrderNo		Varchar(15),
		@CompanyId				Varchar(2),
		@BranchId				Varchar(3),
		@FinYearID				Varchar(4)
As



		Select		GRNNo,Convert(Varchar(10),GRNDate,103) As GRNDate
		From		TrnGRNHdr
		Where		PurchaseOrderNo=@PurchaseOrderNo
		And			CompanyId=@CompanyId
		And			BranchId=@BranchId
		And			FinYearID=@FinYearID
GO
/****** Object:  Table [dbo].[TrnJobProductIssueLiftDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnJobProductIssueLiftDtl](
	[JobProductIssueLiftDtlID] [varchar](18) NOT NULL,
	[JobProductIssueDtlID] [varchar](18) NOT NULL,
	[JobNo] [varchar](15) NOT NULL,
	[StockInDtlID] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[BalanceStockInQty] [decimal](18, 3) NOT NULL,
	[LiftQty] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnJobProductIssueLiftDtl] PRIMARY KEY CLUSTERED 
(
	[JobProductIssueLiftDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnJobProductIssueLiftDtl] UNIQUE NONCLUSTERED 
(
	[JobProductIssueDtlID] ASC,
	[StockInDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TrnProformaInvStockinDtl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--Tridip Bhattacharjee
CREATE procedure [dbo].[TrnProformaInvStockinDtl_Select]
(
	@ProductID int
)
As

	Begin
		Declare @IntCnt int

		SELECT @IntCnt=(isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0))
		FROM TrnStockInDtl Where TrnStockInDtl.ProductID=@ProductID
		
		IF @IntCnt>0
		Begin
			SELECT TrnStockInDtl.StockInDtlID,TrnStockInDtl.ProductID,TrnStockInDtl.InDocType,TrnStockInDtl.InDocNo,
			TrnStockInDtl.InDocDate,TrnStockInDtl.StockPointID,MstStockPoint.StockPointName, 
			(isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0)) as BalQty,0 as LiftQty
			FROM TrnStockInDtl INNER JOIN MstStockPoint ON 
			TrnStockInDtl.StockPointID = MstStockPoint.StockPointID
			Where TrnStockInDtl.ProductID=@ProductID and (isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0))>0
			order by (isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0)) desc
		End
	End
GO
/****** Object:  StoredProcedure [dbo].[TrnJobProductIssue_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrnJobProductIssue_Select]

	@JobNo				Varchar(15),
	@CompanyID			Varchar(2),
	@BranchID			Varchar(3),
	@FinYearID			Varchar(4),
	@Mode				Varchar(1)

As


Declare		@cntTotalRows	Int

	If	@Mode = 'V'
	Begin
			Select		TJH.JobNo,Convert(Varchar(10),TJH.JobStartDate,103) As JobStartDate,MC.CustomerName,
						Sum(TJPID.ProductAmt) As ProductAmt,
						Convert(Varchar(10),TJH.CancelDate,103) As CancelDate,TJH.CancelReason
			From		TrnJobHdr TJH
			Inner Join	MstCustomer MC On MC.CustomerID=TJH.CustomerID
			And			MC.CompanyID=@CompanyID
			And			MC.BranchID=@BranchID
			Inner Join	TrnJobProductIssueDtl TJPID On TJPID.JobNo=TJH.JobNo
			Where		TJH.JobNo=@JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			Group By	TJH.JobNo,TJH.JobStartDate,MC.CustomerName,TJH.CancelDate,TJH.CancelReason


			Select		Convert(Varchar(10),TJPID.IssueDate,103) As IssueDate,
						MSP.StockPointName,MP.ProductName,TJPID.Rate,TJPID.BalanceStockQty,TJPID.IssueQty,
						TJPID.ProductAmt
			From		TrnJobProductIssueDtl TJPID
			Inner Join	MstStockPoint MSP On MSP.StockPointID=TJPID.StockPointID
			And			MSP.CompanyID=@CompanyID
			And			MSP.BranchID=@BranchID
			Inner Join	MstProduct MP On MP.ProductID=TJPID.ProductID
			And			MP.CompanyID=@CompanyID
			And			MP.BranchID=@BranchID
			Inner Join	TrnJobHdr TJH On TJH.JobNo=TJPID.JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			Where		TJPID.JobNo=@JobNo
	End
		
	If	@Mode = 'E'
	Begin
			Select		TJH.JobNo,Convert(Varchar(10),TJH.JobStartDate,103) As JobStartDate,MC.CustomerName
			From		TrnJobHdr TJH
			Inner Join	MstCustomer MC On MC.CustomerID=TJH.CustomerID
			And			MC.CompanyID=@CompanyID
			And			MC.BranchID=@BranchID
			Where		TJH.JobNo=@JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID

			Select		Count(TJPID.JobProductIssueDtlID) As TotalRows
			From		TrnJobProductIssueDtl TJPID
			Inner Join	TrnJobHdr TJH On TJH.JobNo=TJPID.JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			Where		TJPID.JobNo=@JobNo

			Select		TJPID.JobProductIssueDtlID,Convert(Varchar(10),TJPID.IssueDate,103) As IssueDate,
						TJPID.StockPointID,TJPID.ProductID,TJPID.Rate,TJPID.BalanceStockQty,TJPID.IssueQty,
						TJPID.ProductAmt
			From		TrnJobProductIssueDtl TJPID
			Inner Join	TrnJobHdr TJH On TJH.JobNo=TJPID.JobNo
			And			TJH.CompanyID=@CompanyID
			And			TJH.BranchID=@BranchID
			And			TJH.FinYearID=@FinYearID
			Where		TJPID.JobNo=@JobNo			
			
	End
GO
/****** Object:  View [dbo].[vw_TrnJobProductIssue]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnJobProductIssueDtl

*/


CREATE VIEW [dbo].[vw_TrnJobProductIssue]

AS

			SELECT		TrnJobHdr.JobNo,Convert(Varchar(10),TrnJobHdr.JobStartDate,103) As JobStartDate,
						TrnJobHdr.JobStatus,TrnJobHdr.CompanyID,
						TrnJobHdr.BranchID, TrnJobHdr.FinYearID, MstCustomer.CustomerName,
						Sum(TrnJobProductIssueDtl.ProductAmt) As ProductAmt
			FROM		TrnJobHdr
			INNER JOIN	MstCustomer ON TrnJobHdr.CustomerID = MstCustomer.CustomerID
			And			MstCustomer.CompanyID=TrnJobHdr.CompanyID
			And			MstCustomer.BranchID=TrnJobHdr.BranchID
			INNER JOIN	TrnJobProductIssueDtl ON TrnJobProductIssueDtl.JobNo=TrnJobHdr.JobNo
			GROUP BY	TrnJobHdr.JobNo,TrnJobHdr.JobStartDate,TrnJobHdr.JobStatus,TrnJobHdr.CompanyID,
						TrnJobHdr.BranchID,TrnJobHdr.FinYearID,MstCustomer.CustomerName
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
         Begin Table = "TrnJobProductIssueDtl"
            Begin Extent = 
               Top = 12
               Left = 385
               Bottom = 120
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "MstProduct"
            Begin Extent = 
               Top = 129
               Left = 187
               Bottom = 237
               Right = 344
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MstStockPoint"
            Begin Extent = 
               Top = 118
               Left = 656
               Bottom = 226
               Right = 813
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnJobProductIssue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_TrnJobProductIssue'
GO
/****** Object:  View [dbo].[vw_TrnStockAdjustment]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnStockAdjustment]
AS
SELECT     dbo.TrnStockAdjustmentHdr.StockAdjustmentNo, dbo.MstStockPoint.StockPointName, dbo.MstProduct.ProductName, 
                      dbo.TrnStockAdjustmentHdr.BookStockQty, dbo.TrnStockAdjustmentHdr.PhysicalStockQty, dbo.TrnStockAdjustmentHdr.CompanyID, 
                      dbo.TrnStockAdjustmentHdr.BranchID, dbo.TrnStockAdjustmentHdr.FinYearID, dbo.TrnStockAdjustmentHdr.StockAdjustmentDate
FROM         dbo.TrnStockAdjustmentHdr INNER JOIN
                      dbo.MstStockPoint ON dbo.TrnStockAdjustmentHdr.StockPointID = dbo.MstStockPoint.StockPointID INNER JOIN
                      dbo.MstProduct ON dbo.TrnStockAdjustmentHdr.ProductID = dbo.MstProduct.ProductID
GO
/****** Object:  View [dbo].[vw_TrnSalesReturnList]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_TrnSalesReturnList]
as

SELECT TrnGRNHdr.GRNNo as SalRetNo,TrnGRNHdr.GRNDate as SaleRetDate,MstStockPoint.StockPointName, 
TrnGRNHdr.GRNStatus,TrnGRNHdr.InvoiceNo,MstCustomer.CustomerName,
CASE GRNStatus WHEN 'NUT' THEN 'Not Utilised' 
WHEN 'UTL' THEN 'Utilised' 
WHEN 'PUT' THEN 'Part Utilised' 
WHEN 'CAN' THEN 'Cancel' 
WHEN 'PCL' THEN 'Part Close' 
END AS SalRetStatus,
TrnGRNHdr.FinYearID,TrnGRNHdr.BranchID,TrnGRNHdr.CompanyID
FROM TrnGRNHdr INNER JOIN
MstStockPoint ON TrnGRNHdr.StockPointID = MstStockPoint.StockPointID INNER JOIN
MstCustomer ON TrnGRNHdr.CustomerID = MstCustomer.CustomerID
WHERE (TrnGRNHdr.SalesReturnTag = 'Y')
GO
/****** Object:  StoredProcedure [dbo].[TrnStockAdjustmentProductPopulate_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

TrnStockAdjustmentProductPopulate_Select '0100100004','0100100002'
*/

--Arnab Dutta
CREATE procedure [dbo].[TrnStockAdjustmentProductPopulate_Select]

	@ProductID int,
	@StockPointID int

As

	Begin
		Declare @IntCnt int

		SELECT @IntCnt=(isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0))
		FROM TrnStockInDtl Where TrnStockInDtl.ProductID=@ProductID
		
		IF @IntCnt>0
		Begin
			SELECT TrnStockInDtl.StockInDtlID,TrnStockInDtl.ProductID,TrnStockInDtl.InDocType,
			TrnStockInDtl.InDocNo,
			TrnStockInDtl.InDocDate,TrnStockInDtl.StockPointID,MstStockPoint.StockPointName,
			(isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0)) as BookStockQty,0 as PhysicalStockQty
			FROM TrnStockInDtl 
			INNER JOIN MstStockPoint ON TrnStockInDtl.StockPointID = MstStockPoint.StockPointID
			Where TrnStockInDtl.ProductID=@ProductID and 
			      TrnStockInDtl.StockPointID=@StockPointID and 	
			(isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0))>0
			order by (isnull(TrnStockInDtl.StockINQty,0)- isnull(TrnStockInDtl.UtilQty,0)) desc
		End
	End
GO
/****** Object:  Table [dbo].[TrnStockAdjustmentDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnStockAdjustmentDtl](
	[StockAdjustmentDtlID] [varchar](18) NOT NULL,
	[StockAdjustmentNo] [varchar](15) NOT NULL,
	[StockInDtlID] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[BookStockQty] [decimal](18, 3) NOT NULL,
	[PhysicalStockQty] [decimal](18, 3) NOT NULL,
	[AdjustStockQty] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnStockAdjustmentDtl] PRIMARY KEY CLUSTERED 
(
	[StockAdjustmentDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnStockAdjustmentDtl] ([StockAdjustmentDtlID], [StockAdjustmentNo], [StockInDtlID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty]) VALUES (N'010017777000001001', N'010017777000001', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnStockAdjustmentDtl] ([StockAdjustmentDtlID], [StockAdjustmentNo], [StockInDtlID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty]) VALUES (N'010017777000002001', N'010017777000002', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnStockAdjustmentDtl] ([StockAdjustmentDtlID], [StockAdjustmentNo], [StockInDtlID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty]) VALUES (N'010017777000003001', N'010017777000003', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnStockAdjustmentDtl] ([StockAdjustmentDtlID], [StockAdjustmentNo], [StockInDtlID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty]) VALUES (N'010017777000004001', N'010017777000004', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnStockAdjustmentDtl] ([StockAdjustmentDtlID], [StockAdjustmentNo], [StockInDtlID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty]) VALUES (N'010017777000005001', N'010017777000005', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnStockAdjustmentDtl] ([StockAdjustmentDtlID], [StockAdjustmentNo], [StockInDtlID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty]) VALUES (N'010017777000006001', N'010017777000006', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnStockAdjustmentDtl] ([StockAdjustmentDtlID], [StockAdjustmentNo], [StockInDtlID], [ProductID], [BookStockQty], [PhysicalStockQty], [AdjustStockQty]) VALUES (N'010017777000007001', N'010017777000007', N'010017777000001', N'0100100004', CAST(3.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
/****** Object:  StoredProcedure [dbo].[TrnStockAdjustment_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnStockAdjustmentHdr

select * from TrnStockAdjustmentDtl where stockadjustmentno='010017777000001'

sp_help TrnStockAdjustmentHdr

sp_help TrnStockAdjustmentDtl


TrnStockAdjustment_Update 	@StockAdjustmentNo='010017777000001',
							@StockAdjustmentDate='02/08/2007',
							@StockPointID='0100100002',
							@ProductIDH='0100100004',
							@BookStockQtyH=3.000,
							@PhysicalStockQtyH=3.000,
							@Remarks='',
							@LogUserId='admin',
							@CompanyID='01',
							@BranchID='001',
							@FinYearID='7777',
							@DetailXML='<NewDataSet>
							  <StockAdjustmentDtl>
							    <StockInDtlID>010017777000001</StockInDtlID>
							    <ProductID>0100100004</ProductID>
							    <BookStockQty>3.000</BookStockQty>
							    <PhysicalStockQty>3.000</PhysicalStockQty>
							    <AdjustStockQty>1.000</AdjustStockQty>
							  </StockAdjustmentDtl>
							</NewDataSet>'

*/

CREATE PROCEDURE [dbo].[TrnStockAdjustment_Update]
(
		@StockAdjustmentNo    	as varchar(15),      
		@StockAdjustmentDate    as Varchar(10),      
		@StockPointID     		as varchar(10),      
		@ProductIDH      		as varchar(10),
		@BookStockQtyH    		as decimal(18,3),
		@PhysicalStockQtyH    	as decimal(18,3),
		@Remarks      			as varchar(200),
		
		@LogUserId      		as Varchar(12),
		@CompanyID      		as varchar(2),
		@BranchID      			as varchar(3),
		@FinYearID      		as varchar(4),
		@DetailXML              as NTEXT
)

AS

	Declare			@intCntr					as int
	Declare			@logMsg						as Varchar(200)
	Declare			@CurDatetime				as datetime
	Declare			@intError					as integer
	Declare			@NewStockAdjustmentNo		as Varchar(15)
	Declare			@NewStockAdjustmentDtlID	as Varchar(18)
	Declare			@AutoGenPrefix				as Varchar(9)

	Declare			@XMLFormat					Int

	Declare 		@StockInDtlID				Varchar(15)
	Declare 		@ProductID					Varchar(10)
	Declare 		@BookStockQty				Decimal(18,3)
	Declare 		@PhysicalStockQty			Decimal(18,3)
	Declare 		@AdjustStockQty				Decimal(18,3)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation

	IF @StockAdjustmentNo=''
	BEGIN
	        select 'Select Stock Adjustment No'
	        return
	END

	IF @StockAdjustmentDate=''
	BEGIN
	        select 'Stock Adjustment date can not be empty'
	        return
	END

	If @BookStockQtyH <= 0
	Begin
		Select 'Book Stock Quantity should be greater than 0'
	return
	End

	If @PhysicalStockQtyH <= 0
	Begin
		Select 'Physical Quantity should be greater than 0'
	return
	End

	If @CompanyId = ''
	Begin
		Select 'Please give the Company'
	return
	End

	If @BranchId = ''
	Begin
		Select 'Please give the Branch'
	return
	End

	If @FinYearID = ''
	Begin
		Select 'Please give the Financial Year'
	return
	End

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet

	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select StockInDtlID,ProductID,BookStockQty,PhysicalStockQty,AdjustStockQty
	From Openxml (@XMLFormat, '/NewDataSet/StockAdjustmentDtl', 2)
	With 
		(
			StockInDtlID				Varchar(15),
			ProductID					Varchar(10),
			BookStockQty				Decimal(18,3),
			PhysicalStockQty			Decimal(18,3),
			AdjustStockQty				Decimal(18,3)

		)


	BEGIN TRANSACTION

	Update		TrnStockAdjustmentHdr
	Set			StockAdjustmentDate=Convert(DateTime,@StockAdjustmentDate,103),
				StockPointID=@StockPointID,
				ProductID=@ProductIDH,
				BookStockQty=@BookStockQtyH,
				PhysicalStockQty=@PhysicalStockQtyH,
				AdjustStockQty=@AdjustStockQty,
				Remarks=@Remarks,
				CompanyID=@CompanyID,
				BranchID=@BranchID,
				FinYearID=@FinYearID
	Where		StockAdjustmentNo=@StockAdjustmentNo

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @StockInDtlID,@ProductID,@BookStockQty,@PhysicalStockQty,@AdjustStockQty

	While (@@Fetch_Status=0)
	Begin	--1

				IF @StockInDtlID=''
				Begin		--2
					select 'Stock Indetail id can not be empty'
					return
				END			--2
		
				IF @StockInDtlID <>''
				Begin		--3
					select  @intcntr = count(*)
					from   	TrnStockInDtl
					where   StockInDtlID=@StockInDtlID
				End			--3
				If @intcntr  <= 0
					Begin
					         	Select 'Invalid StockInDtl id'
								Return
					End
				
				IF @ProductID=''
				Begin
					select 'Product id can not be empty'
					return
				END
		
				IF @ProductID<>''
				Begin
					select  @intcntr = count(*)
					from   	MstProduct
					where   (ProductID = @ProductID)
				END
				If @intcntr  <= 0
					Begin
				         	Select 'Invalid product id'
							Return
					End
		
				IF @BookStockQty <= 0 
				Begin
					select 'Book Stock Quantity should be greater than 0'
					return
				END
		
				IF @PhysicalStockQty <= 0
				Begin
					select 'Physical Stock Quantity should be greater than 0'
					return
				END
		
				Select	@intCntr=Count(*)
				From	TrnStockAdjustmentDtl
				Where	StockAdjustmentNo=@StockAdjustmentNo
				And		ProductID=@ProductID
				And		StockAdjustmentNo In
				(Select	StockAdjustmentNo 
				 From	TrnStockAdjustmentHdr
				 Where	CompanyID=@CompanyID
				 And	BranchID=@BranchID
				 And	FinYearID=@FinYearID
				)

			If @intCntr <=0
			Begin
					exec AutoGenerateID 'TrnStockAdjustmentDtl','StockAdjustmentDtlID',18,@StockAdjustmentNo,@NewStockAdjustmentDtlID output
		
					Insert Into TrnStockAdjustmentDtl
					(StockAdjustmentDtlID,StockAdjustmentNo,StockInDtlID,ProductID,BookStockQty,
					PhysicalStockQty,AdjustStockQty)
					Values
					(@NewStockAdjustmentDtlID,@StockAdjustmentNo,@StockInDtlID,@ProductID,@BookStockQty,
					@PhysicalStockQty,@AdjustStockQty)
			End
			Else
			Begin
					Update		TrnStockAdjustmentDtl
					Set			StockInDtlID=@StockInDtlID,
								ProductID=@ProductID,
								BookStockQty=@BookStockQty,
								PhysicalStockQty=@PhysicalStockQty,
								AdjustStockQty=@AdjustStockQty
					Where		StockAdjustmentNo=@StockAdjustmentNo
					And			StockAdjustmentNo In
					(Select		StockAdjustmentNo
					From		TrnStockAdjustmentHdr
					Where		CompanyID=@CompanyID
					And			BranchID=@BranchID
					And			FinYearID=@FinYearID)
					
			End

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return @intError End

		Fetch Next From CurDetailRecord Into @StockInDtlID,@ProductID,@BookStockQty,@PhysicalStockQty,@AdjustStockQty

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here

	-- Inserting Values into Log Table
	Set @LogMsg= 'Update Stock Adjustment' + @StockAdjustmentNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	Select @StockAdjustmentNo
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseOrder_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--TrnPurchaseOrder_Select ''

-- Author : Tridip -- 26/04/2007

/*

select * from TrnPurchaseOrderHdr
where companyid=03

*/
CREATE PROCEDURE [dbo].[TrnPurchaseOrder_Select]

	@PurchaseOrderNo			as varchar(15),
	@CompanyId				as Varchar(2),
	@BranchId        				as Varchar(3),
	@FinYearID        			as Varchar(4)
	

As 

BEGIN

			If @PurchaseOrderNo <> ''
			Begin
					Select  *  from  TrnPurchaseOrderHdr Where PurchaseOrderNo=@PurchaseOrderNo

					SELECT Count(*) as TotalRows from TrnPurchaseOrderDtl Where  PurchaseOrderNo=@PurchaseOrderNo

					SELECT MstProduct.ProductUOM,TrnPurchaseOrderDtl.PurchaseOrderDtlID,
					TrnPurchaseOrderDtl.PurchaseOrderNo,TrnPurchaseOrderDtl.ProductID,
					TrnPurchaseOrderDtl.ProductQty,
					TrnPurchaseOrderDtl.ProductRate,TrnPurchaseOrderDtl.ProductAmt
					FROM   TrnPurchaseOrderDtl INNER JOIN
					MstProduct ON TrnPurchaseOrderDtl.ProductID = MstProduct.ProductID
					Where TrnPurchaseOrderDtl.PurchaseOrderNo=@PurchaseOrderNo
			End
			Else
			Begin
					Select   PurchaseOrderNo,PurchaseOrderDate
					From	TrnPurchaseOrderHdr
					Where	PurchaseOrderStatus not in ('CAN','CLS')
					And	CompanyId = @CompanyId
					And	BranchId  = @BranchId
					And	FinYearID = @FinYearID
			End

END
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseInvoice_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

TrnPurchaseInvoice_Select
							@GRNIDNos='010017777000001,010017777000003,',
							@PurchaseInvoiceNo='',
							@Mode='',
							@CompanyId='01',
							@BranchId='001',
							@FinYearID='7777'
*/

CREATE procedure [dbo].[TrnPurchaseInvoice_Select]

		@GRNIDNos					Varchar(5000),
		@PurchaseInvoiceNo			Varchar(15),
		@Mode						Varchar(1),

		@CompanyId					Varchar(2),
		@BranchId        			Varchar(3),
		@FinYearID        			Varchar(4)
As

	Declare @SQL Varchar(8000)
	
	Set @SQL='Select		MP.ProductID,MP.ProductName As Product,MP.ProductUOM As Unit,TPOD.ProductRate As PORate,
							Sum(TGRND.ReceiptQty) As GRNQty,Round((TPOD.ProductRate * Sum(TGRND.ReceiptQty)),2) As ProductAmt
			  From			MstProduct MP
			  Inner Join	TrnPurchaseOrderDtl TPOD On	TPOD.ProductID=MP.ProductID
			  Inner Join	TrnPurchaseOrderHdr	TPOH On	TPOH.PurchaseOrderNo=TPOD.PurchaseOrderNo
			  And			TPOH.CompanyID='+@CompanyId+
			  ' And			TPOH.BranchID='+@BranchId+
			  ' And			TPOH.FinYearID='+@FinYearID+
			  ' Inner Join	TrnGRNHdr TGRNH On TGRNH.PurchaseOrderNo=TPOD.PurchaseOrderNo
			  And TGRNH.PurchaseInvNo Is Null
			  And TGRNH.CompanyId='+@CompanyId+
			  ' And TGRNH.BranchId='+@BranchId+
			  ' And TGRNH.FinYearID='+@FinYearID+
			  ' Inner Join	TrnGRNDtl TGRND On TGRND.GRNNo=TGRNH.GRNNo
			  And TGRND.ProductID=MP.ProductID
			  Where MP.CompanyId='+@CompanyId+' And MP.BranchId='+@BranchId


	If @Mode = ''
	Begin
			--print '1'
			If @GRNIDNos = ''
			Begin
					Set @SQL=@SQL + ' Group By MP.ProductID,MP.ProductName,MP.ProductUOM,TPOD.ProductRate'
					Exec(@SQL)
					--print @SQL
			End
			Else
			Begin
					Set @GRNIDNos=Substring(@GRNIDNos,1,len(@GRNIDNos)-1)
					Set @SQL=@SQL + ' And TGRNH.GRNNo In (' + @GRNIDNos + ')'
					Set @SQL=@SQL + ' Group By MP.ProductID,MP.ProductName,MP.ProductUOM,TPOD.ProductRate'
					--print @SQL
					Exec(@SQL)
			End
	End
	Else If @Mode = 'V'
		Begin
				--print '2'
			
				Select		TPIH.PurchaseInvNo,Convert(Varchar(10),TPIH.PurchaseInvDate,103) As PurchaseInvDate,
							MS.SupplierName,Convert(Varchar(10),TPIH.SupInvDate,103) As SupInvDate,
							TPIH.Remarks,Convert(Varchar(10),TPIH.CancelDate,103) As CancelDate,
							TPIH.CancelReason,TPIH.ProductTotal,TPIH.VatRate,TPIH.VatAmt,TPIH.PurchaseInvAmt,
							TPIH.PurchaseOrderNo,TPIH.SupInvNo
				From		TrnPurchaseInvoiceHdr TPIH
				Inner Join	MstSupplier MS On MS.SupplierID=TPIH.SupplierID
				And			MS.CompanyId=@CompanyId
				And			MS.BranchId=@BranchId
				Where		TPIH.PurchaseInvNo=@PurchaseInvoiceNo
				And			TPIH.CompanyId=@CompanyId
				And			TPIH.BranchId=@BranchId
				And			TPIH.FinYearID=@FinYearID

				Select		MstProduct.ProductID,MstProduct.ProductName,MstProduct.ProductUOM,
							TrnPurchaseInvoiceDtl.PurchaseInvDtlID,TrnPurchaseInvoiceDtl.PurchaseInvNo,
							TrnPurchaseInvoiceDtl.ProductQty,TrnPurchaseInvoiceDtl.ProductRate As InvRate,
							TrnPurchaseInvoiceDtl.ProductAmt,TrnPurchaseInvoiceDtl.GRNQty,
							TrnPurchaseInvoiceDtl.PORate
				From		TrnPurchaseInvoiceDtl
				Inner Join	MstProduct ON TrnPurchaseInvoiceDtl.ProductID = MstProduct.ProductID
				And			MstProduct.CompanyId=@CompanyId
				And			MstProduct.BranchId=@BranchId
				Inner Join	TrnPurchaseInvoiceHdr TPIH On TPIH.PurchaseInvNo=TrnPurchaseInvoiceDtl.PurchaseInvNo
				And			TPIH.CompanyId=@CompanyId
				And			TPIH.BranchId=@BranchId
				And			TPIH.FinYearID=@FinYearID
				Where		TrnPurchaseInvoiceDtl.PurchaseInvNo=@PurchaseInvoiceNo
				

		End
		
	Else If @Mode = 'E'
			
			Begin
					--print '3'
					Select		PurchaseInvNo,SupInvNo,PurchaseOrderNo,
								Convert(Varchar(10),PurchaseInvDate,103) As PurchaseInvDate,
								SupplierID,SupInvNo,Convert(Varchar(10),SupInvDate,103) As SupInvDate,
								Remarks,VatRate,VatAmt,ProductTotal,PurchaseInvAmt
					From		TrnPurchaseInvoiceHdr
					Where		PurchaseInvNo=@PurchaseInvoiceNo
					And			TrnPurchaseInvoiceHdr.CompanyId=@CompanyId
					And			TrnPurchaseInvoiceHdr.BranchId=@BranchId
					And			TrnPurchaseInvoiceHdr.FinYearID=@FinYearID
					

					Select		MP.ProductID,MP.ProductName As Product,MP.ProductUOM As Unit,
								TPID.ProductRate,TPID.ProductQty,
								TPID.ProductAmt,TPID.GRNQty,TPID.PORate
					From		TrnPurchaseInvoiceDtl TPID
					Inner join	MstProduct	MP On MP.ProductID=TPID.ProductID
					And			MP.CompanyId=@CompanyId
					And			MP.BranchId=@BranchId
					Inner Join	TrnPurchaseInvoiceHdr TPIH On TPIH.PurchaseInvNo=TPID.PurchaseInvNo
					And			TPIH.CompanyId=@CompanyId
					And			TPIH.BranchId=@BranchId
					And			TPIH.FinYearID=@FinYearID
					Where		TPID.PurchaseInvNo=@PurchaseInvoiceNo

			End
GO
/****** Object:  Table [dbo].[TrnStockOutDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnStockOutDtl](
	[StockOutDtlID] [varchar](15) NOT NULL,
	[StockInDtlID] [varchar](15) NOT NULL,
	[OutDocType] [varchar](3) NOT NULL,
	[OutDocNo] [varchar](20) NOT NULL,
	[OutDocDate] [datetime] NOT NULL,
	[StockPointID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[StockOutQty] [decimal](18, 3) NOT NULL,
	[CancelQty] [decimal](18, 3) NOT NULL,
	[SaleRate] [decimal](18, 2) NOT NULL,
	[VATRate] [decimal](18, 2) NOT NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnStockOutDtl] PRIMARY KEY CLUSTERED 
(
	[StockOutDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnStockOutDtl] UNIQUE NONCLUSTERED 
(
	[StockInDtlID] ASC,
	[OutDocType] ASC,
	[OutDocNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnStockOutDtl] ([StockOutDtlID], [StockInDtlID], [OutDocType], [OutDocNo], [OutDocDate], [StockPointID], [ProductID], [StockOutQty], [CancelQty], [SaleRate], [VATRate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', N'010017777000001', N'DVN', N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'0100100002', N'0100100004', CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'01', N'001', N'7777')
INSERT [dbo].[TrnStockOutDtl] ([StockOutDtlID], [StockInDtlID], [OutDocType], [OutDocNo], [OutDocDate], [StockPointID], [ProductID], [StockOutQty], [CancelQty], [SaleRate], [VATRate], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', N'010017777000002', N'DVN', N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'0100100004', N'0100100004', CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnStockMatch_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  Procedure [dbo].[TrnStockMatch_Update]
AS
BEGIN

	update TrnCurrentStock
	set 	TrnCurrentStock.StockInQty = x.InQty , 
		TrnCurrentStock.StockOutQty = x.OutQty
	from 	(
			select TrnStockInDtl.ProductId,TrnStockInDtl.StockPointID,TrnStockInDtl.CompanyID,TrnStockInDtl.BranchID,TrnStockInDtl.FinYearID,
				isnull(sum(TrnStockInDtl.StockInQty),0) as InQty,
				isnull(sum(TrnStockInDtl.UtilQty),0) as OutQty		
			From	TrnStockInDtl
			Group by TrnStockInDtl.ProductId,TrnStockInDtl.StockPointID,TrnStockInDtl.CompanyID,TrnStockInDtl.BranchID,TrnStockInDtl.FinYearID
		) as x
	
	Where	x.ProductId = TrnCurrentStock.ProductID
	And	x.StockPointID = TrnCurrentStock.StockPointID
	And	x.CompanyID = TrnCurrentStock.CompanyID
	And	x.BranchID = TrnCurrentStock.BranchID
	And	x.FinYearID = TrnCurrentStock.FinYearID
END
GO
/****** Object:  StoredProcedure [dbo].[TrnStockInDtl_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnStockInDtl where companyid='01' and branchid='001'
order by productid ASC

select * from TrnStockInDtl where companyid='01' and branchid='001'
and productid='0100100003'


select * from mststockpoint where stockpointid='01001003'
0100100006

TrnStockInDtl_Select '0100100003','01','001','7777'

select * from TrnCurrentStock

*/


CREATE procedure [dbo].[TrnStockInDtl_Select]

	@ProductID			Varchar(10),
	@CompanyID			Varchar(2),
	@BranchID			Varchar(3),
	@FinYearID			Varchar(4)

As

	Select		TSD.ProductID,(Sum(TSD.StockInQty)-Sum(TSD.UtilQty)) As BalanceQty
	From		TrnStockInDtl TSD
	Inner Join	MstStockPoint MSP On MSP.StockPointID=TSD.StockPointID
	And			MSP.StockPointType='V'
	And			MSP.CompanyID=@CompanyID
	And			MSP.BranchID=@BranchID
	Where		TSD.CompanyID=@CompanyID
	And			TSD.BranchID=@BranchID
	And			TSD.FinYearID=@FinYearID
	And			TSD.ProductID=@ProductID
	Group By	ProductID
GO
/****** Object:  StoredProcedure [dbo].[TrnStockTransferGrid_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TrnStockTransferGrid_Select]
(
	@StockTransferNo varchar(15)
)
 AS

Begin
	SELECT dbo.TrnStockTransferHdr.StockTransferDate, dbo.TrnStockTransferHdr.FromStockPointID, dbo.TrnStockTransferHdr.ToStockPointID, 
        dbo.TrnStockTransferHdr.Remarks, dbo.TrnStockTransferHdr.StockTransferStatus, dbo.MstStockPoint.StockPointName AS StockPointFrom, 
        MstStockPoint_1.StockPointName AS StockPointTo
	FROM dbo.TrnStockTransferHdr INNER JOIN
        dbo.MstStockPoint ON dbo.TrnStockTransferHdr.FromStockPointID = dbo.MstStockPoint.StockPointID INNER JOIN
        dbo.MstStockPoint MstStockPoint_1 ON dbo.TrnStockTransferHdr.ToStockPointID = MstStockPoint_1.StockPointID
	Where TrnStockTransferHdr.StockTransferNo=@StockTransferNo

	SELECT   TrnStockTransferDtl.StockTransferNo,TrnStockTransferDtl.StockTransferDtlID,TrnStockTransferDtl.ProductID, MstProduct.ProductName,
	MstProduct.ProductUOM as Unit,TrnStockTransferDtl.Rate,  
	TrnStockTransferDtl.BalanceStockQty as BalQty, 
	TrnStockTransferDtl.TransferQty
	FROM TrnStockTransferDtl INNER JOIN
	MstProduct ON TrnStockTransferDtl.ProductID = MstProduct.ProductID
	Where TrnStockTransferDtl.StockTransferNo=@StockTransferNo

End
GO
/****** Object:  View [dbo].[vw_MstSupplierRate]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MstSupplierRate]
AS
SELECT     dbo.MstSupplierRate.SupplierRateID, dbo.MstSupplier.SupplierName, dbo.MstProduct.ProductName, dbo.MstSupplierRate.EffectiveDate, 
                      dbo.MstSupplierRate.SupplierRate, dbo.MstSupplierRate.BranchID, dbo.MstSupplierRate.CompanyID
FROM         dbo.MstSupplier INNER JOIN
                      dbo.MstSupplierRate ON dbo.MstSupplier.SupplierID = dbo.MstSupplierRate.SupplierID INNER JOIN
                      dbo.MstProduct ON dbo.MstSupplierRate.ProductID = dbo.MstProduct.ProductID
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
         Begin Table = "MstSupplier"
            Begin Extent = 
               Top = 117
               Left = 261
               Bottom = 225
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "MstSupplierRate"
            Begin Extent = 
               Top = 6
               Left = 440
               Bottom = 114
               Right = 592
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "MstProduct"
            Begin Extent = 
               Top = 77
               Left = 617
               Bottom = 185
               Right = 774
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3690
         Alias = 900
         Table = 2265
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 720
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MstSupplierRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MstSupplierRate'
GO
/****** Object:  View [dbo].[vw_TrnGRNList]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE View [dbo].[vw_TrnGRNList]
as



SELECT     TrnGRNHdr.GRNNo, TrnGRNHdr.GRNDate, TrnGRNHdr.PurchaseOrderNo, MstSupplier.SupplierID, MstSupplier.SupplierName, 
                      MstStockPoint.StockPointID, MstStockPoint.StockPointName, GRNStatus AS status, 
                      CASE GRNStatus WHEN 'NUT' THEN 'Not Utilised' WHEN 'UTL' THEN 'Utilised' WHEN 'PUT' THEN 'Part Utilised' WHEN 'CAN' THEN 'Cancel' WHEN 'PCL'
                       THEN 'Part Close' END AS GRNStatus, TrnGRNHdr.FinYearID, TrnGRNHdr.BranchID, TrnGRNHdr.CompanyID
FROM         TrnGRNHdr INNER JOIN
                      MstStockPoint ON TrnGRNHdr.StockPointID = MstStockPoint.StockPointID INNER JOIN
                      MstSupplier ON TrnGRNHdr.SupplierID = MstSupplier.SupplierID
WHERE     TrnGRNHdr.SalesReturnTag = 'N'
GO
/****** Object:  StoredProcedure [dbo].[TrnStockAdjustment_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from TrnStockAdjustmentHdr
select * from TrnStockAdjustmentDtl
sp_help TrnStockAdjustmentHdr
TrnStockAdjustment_Select '010017777000001','E','01','001','7777'

*/


CREATE procedure [dbo].[TrnStockAdjustment_Select]

	@StockAdjustmentNo		Varchar(15),
	@Mode					Varchar(1)='',
	@CompanyID				Varchar(2),
	@BranchID				Varchar(3),
	@FinYearID				Varchar(4)

AS


	If @Mode = 'E' Or @Mode = 'V'
	Begin
			SELECT			TSAH.StockAdjustmentNo,TSAH.StockPointID,TSAH.ProductID,
							Convert(Varchar(10),TSAH.StockAdjustmentDate,103) As StockAdjustmentDate,
							MP.ProductName,MSP.StockPointName,TSAH.PhysicalStockQty,
							TSAH.BookStockQty,TSAH.Remarks
			FROM			TrnStockAdjustmentHdr TSAH
							Inner Join TrnStockAdjustmentDtl TSAD ON TSAH.StockAdjustmentNo = TSAD.StockAdjustmentNo
							Inner Join MstStockPoint MSP ON TSAH.StockPointID = MSP.StockPointID
			And				MSP.CompanyID=@CompanyID
			And				MSP.BranchID=@BranchID
							Inner Join MstProduct MP ON TSAD.ProductID = MP.ProductID
			And				MP.CompanyID=@CompanyID
			And				MP.BranchID=@BranchID
			WHERE			TSAH.StockAdjustmentNo = @StockAdjustmentNo
			And				TSAH.CompanyID=@CompanyID
			And				TSAH.BranchID=@BranchID
			And				TSAH.FinYearID=@FinYearID


			SELECT			TSAD.StockInDtlID, TSID.InDocType, TSID.InDocNo,Convert(Varchar(10),TSID.InDocDate,103) As InDocDate,
							TSAD.BookStockQty, TSAD.PhysicalStockQty
			FROM			TrnStockAdjustmentHdr TSAH
							INNER JOIN TrnStockAdjustmentDtl TSAD ON TSAH.StockAdjustmentNo = TSAD.StockAdjustmentNo
							INNER JOIN TrnStockInDtl TSID ON TSAD.StockInDtlID = TSID.StockInDtlID
			WHERE			TSAH.StockAdjustmentNo = @StockAdjustmentNo
			And				TSAH.CompanyID=@CompanyID
			And				TSAH.BranchID=@BranchID
			And				TSAH.FinYearID=@FinYearID
	End
GO
/****** Object:  StoredProcedure [dbo].[TrnStockAdjustment_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 



/*  
 
TrnStockAdjustment_Insert   
  @StockAdjustmentNo='',      
  @StockAdjustmentDate='07/31/2007',      
  @StockPointID='0100100002',      
  @ProductID='0100100004',      
  @BookStockQty=3,  
  @PhysicalStockQty=2,      
  @Remarks='',   
  
  @LogUserId='admin',      
  @CompanyID='01',      
  @BranchID='001',      
  @FinYearID='7777',  
  @DetailXML=  
  '<NewDataSet>  
    <TrnStockAdjustmentDtl>  
      <StockInDtlID>010017777000001</StockInDtlID>  
      <ProductID>0100100004</ProductID>  
      <BookStockQty>3.000</BookStockQty>  
      <PhysicalStockQty>2</PhysicalStockQty>  
      <AdjustStockQty>1.000</AdjustStockQty>  
    </TrnStockAdjustmentDtl>  
  </NewDataSet>'  
  

select * from TrnStockAdjustmentHdr

select * from TrnStockAdjustmentDtl


delete from TrnStockAdjustmentHdr

delete from TrnStockAdjustmentDtl
  
*/  
  
CREATE PROCEDURE [dbo].[TrnStockAdjustment_Insert]  
(      
	@StockAdjustmentNo    as varchar(15),      
	@StockAdjustmentDate    as datetime,      
	@StockPointID     as varchar(10),      
	@ProductID      as varchar(10),      
	@BookStockQty     as decimal(18,3),  
	@PhysicalStockQty    as decimal(18,3),      
	@Remarks      as varchar(200),   
	
	@LogUserId      as Varchar(12),      
	@CompanyID      as varchar(2),      
	@BranchID      as varchar(3),      
	@FinYearID      as varchar(4),  
	@DetailXML                as NTEXT  
)  
      
as      
      
 Declare @NewStockAdjustmentID as varchar(15)      
 Declare @AutoGenPrefix   as varchar(9)      
 Declare @StockAdjustmentStatus  as varchar     
 Declare @NewStockAdjustmentDtlID as varchar(18)  
 Declare @AdjustStockQty  as decimal(18,3)  
 Declare @StockInDtlID  as varchar(15)  
 Declare @XMLFormat Int      
 Declare @intError  as integer      
 Declare @logMsg    as Varchar(200)      
 Declare @CurDatetime as datetime       
      
  
set @AutoGenPrefix =  @CompanyId + @BranchId+@FinYearID

print @FinYearID
print @AutoGenPrefix

exec  AutoGenerateID 'TrnStockAdjustmentHdr' , 'StockAdjustmentNo' , 15 , @AutoGenPrefix , @NewStockAdjustmentID output  
      
insert into TrnStockAdjustmentHdr      
(StockAdjustmentNo,StockAdjustmentDate,StockPointID,ProductID,BookStockQty,PhysicalStockQty,  
Remarks,StockAdjustmentStatus,CompanyID,BranchID,FinYearID)      
values  
(@NewStockAdjustmentID,@StockAdjustmentDate,@StockPointID,@ProductID,@BookStockQty,@PhysicalStockQty,      
@Remarks,'SAD',@CompanyID,@BranchID,@FinYearID)  

Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXML      
      
      
 -- Create Cursor from XML Table      
      
  
  
 Declare CurDetailRecord      
 Cursor For      
 Select StockInDtlID,ProductID,BookStockQty,PhysicalStockQty,AdjustStockQty      
 From Openxml (@XMLFormat, '/NewDataSet/TrnStockAdjustmentDtl', 2)      
 With      
 (      
   
  StockInDtlID  Varchar(15),      
  ProductID  Varchar(10),      
  BookStockQty  decimal(18,3),      
  PhysicalStockQty decimal(18,3),      
  AdjustStockQty  decimal(18,3)  
   
 )      
      
      
 BEGIN TRANSACTION      
      
exec  AutoGenerateID 'TrnStockAdjustmentDtl',StockAdjustmentDtlID,18,@NewStockAdjustmentID,@NewStockAdjustmentDtlID output  
  
 Open CurDetailRecord  
 Fetch Next From CurDetailRecord Into @StockInDtlID,@ProductID,@BookStockQty,@PhysicalStockQty,@AdjustStockQty  
  
While @@Fetch_Status=0  
Begin  
  
 insert into TrnStockAdjustmentDtl  
 (StockAdjustmentDtlID,StockAdjustmentNo,StockInDtlID,ProductID,BookStockQty,PhysicalStockQty,AdjustStockQty)  
 values  
 (@NewStockAdjustmentDtlID,@NewStockAdjustmentID,@StockInDtlID,@ProductID,@BookStockQty,@PhysicalStockQty,  
 @AdjustStockQty)  
  
 /*print 'StockInDtlID  : '+Convert(varchar,@StockInDtlID)  
     print 'ProductID  : '+Convert(varchar,@ProductID)  
     print 'BookStockQty  : '+Convert(varchar,@BookStockQty)  
     print 'PhysicalStockQty : '+Convert(varchar,@PhysicalStockQty)  
     print 'AdjustStockQty  : '+Convert(varchar,@AdjustStockQty)*/  
      
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
      
 Fetch Next From CurDetailRecord Into @StockInDtlID,@ProductID,@BookStockQty,@PhysicalStockQty,@AdjustStockQty  
End  
  
Close CurDetailRecord      
Deallocate CurDetailRecord      
      
 --- Validation end for detail part from here      
      
      
 -- Inserting Values into Log Table      
 Set @LogMsg= 'Insert Stock Adjustment Details' + @StockAdjustmentNo  
 Set @CurDateTime = getdate()      
 --Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg      
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
       
 COMMIT TRANSACTION  
 select @NewStockAdjustmentID
GO
/****** Object:  View [dbo].[vw_TrnDeliveryList]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE View [dbo].[vw_TrnDeliveryList] as
SELECT TrnDeliveryNoteHdr.DeliveryNoteNo, TrnDeliveryNoteHdr.DeliveryNoteDate, 
MstCustomer.CustomerName,TrnDeliveryNoteHdr.ProformaInvNo, TrnDeliveryNoteHdr.DespatchMode,
TrnDeliveryNoteHdr.DeliveryNoteStatus as Status,
CASE TrnDeliveryNoteHdr.DeliveryNoteStatus
WHEN 'NUT' THEN 'Not Utilised' 
WHEN 'UTL' THEN 'Utilised' 
WHEN 'PUT' THEN 'Part Utilised' 
WHEN 'CAN' THEN 'Cancel' 
WHEN 'PCL' THEN 'Part Close' 
END AS DeliveryNoteStatus,
TrnDeliveryNoteHdr.CompanyID,
TrnDeliveryNoteHdr.BranchID,
TrnDeliveryNoteHdr.FinYearID
FROM MstCustomer INNER JOIN
TrnDeliveryNoteHdr ON MstCustomer.CustomerID = TrnDeliveryNoteHdr.CustomerID
GO
/****** Object:  View [dbo].[vw_TrnPurchaseReturn]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE View [dbo].[vw_TrnPurchaseReturn] as

SELECT TrnDeliveryNoteHdr.DeliveryNoteNo,TrnDeliveryNoteHdr.DeliveryNoteDate, 
MstSupplier.SupplierName,TrnDeliveryNoteHdr.ProformaInvNo, 
TrnDeliveryNoteHdr.DespatchMode,TrnDeliveryNoteHdr.DeliveryNoteStatus, 
CASE DeliveryNoteStatus 
WHEN 'NUT' THEN 'Not Utilised' 
WHEN 'UTL' THEN 'Utilised' 
WHEN 'PUT' THEN 'Part Utilised' 
WHEN 'CAN' THEN 'Cancel' 
WHEN 'PCL'
THEN 'Part Close' 
END AS InvoiceStatus,
TrnDeliveryNoteHdr.CompanyID,TrnDeliveryNoteHdr.BranchID,TrnDeliveryNoteHdr.FinYearID
FROM TrnDeliveryNoteHdr INNER JOIN
MstSupplier ON TrnDeliveryNoteHdr.SupplierID = MstSupplier.SupplierID
Where TrnDeliveryNoteHdr.PurchaseReturnTag='Y'
GO
/****** Object:  View [dbo].[vw_TrnStockAdjustment_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnStockAdjustment_Select]
AS
SELECT     dbo.TrnStockAdjustmentHdr.StockAdjustmentNo, dbo.TrnStockAdjustmentHdr.StockPointID, dbo.TrnStockAdjustmentHdr.ProductID, 
                      dbo.MstProduct.ProductName, dbo.MstStockPoint.StockPointName, dbo.TrnStockAdjustmentHdr.PhysicalStockQty, 
                      dbo.TrnStockAdjustmentHdr.BookStockQty, dbo.TrnStockAdjustmentHdr.Remarks
FROM         dbo.TrnStockAdjustmentHdr INNER JOIN
                      dbo.TrnStockAdjustmentDtl ON dbo.TrnStockAdjustmentHdr.StockAdjustmentNo = dbo.TrnStockAdjustmentDtl.StockAdjustmentNo INNER JOIN
                      dbo.MstStockPoint ON dbo.TrnStockAdjustmentHdr.StockPointID = dbo.MstStockPoint.StockPointID INNER JOIN
                      dbo.MstProduct ON dbo.TrnStockAdjustmentDtl.ProductID = dbo.MstProduct.ProductID
GO
/****** Object:  StoredProcedure [dbo].[TrnJobProductIssue_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrnJobProductIssue_Insert]

	@JobNo						Varchar(15),
	@ProductTotalAmt			Decimal(18,2),

	@DetailXml					Ntext,

	@LogUserId					Varchar(12),
	@CompanyID					Varchar(2),
	@BranchID					Varchar(3),
	@FinYearID					Varchar(4)


As


	Declare			@intCntr						int
	Declare			@logMsg							Varchar(200)
	Declare			@CurDatetime					datetime
	Declare			@intError						integer
	Declare			@NewJobProductIssueDtlID		Varchar(18)
	Declare			@NewStockOutDtlID				Varchar(15)
	Declare			@NewCurrentStockID				Varchar(15)
	Declare			@AutoGenPrefix					Varchar(9)
	Declare			@StockInDtlID					Varchar(15)
	Declare			@InDocNo						Varchar(20)


	Declare			@XMLFormat						Int

	Declare			@IssueDate						Varchar(10)
	Declare			@StockPointID					Varchar(10)
	Declare			@ProductID						Varchar(10)
	Declare			@Rate							Decimal(18,2)
	Declare			@BalanceQty						Decimal(18,3)
	Declare			@IssueQty						Decimal(18,3)
	Declare			@Amount							Decimal(18,2)

	Declare			@StockInQty						Decimal(18,3)
	Declare			@UtilQty						Decimal(18,3)
	Declare			@RemainingQty					Decimal(18,3)
	Declare			@VatRate						Decimal(18,3)
	Declare			@TempIssQty						Decimal(18,3)
	Declare			@StockOutQty					Decimal(18,3)

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Set @AutoGenPrefix=@CompanyId + @BranchId + @FinYearID

	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select IssueDate,StockPointID,ProductID,Rate,BalanceQty,IssueQty,Amount
	From Openxml (@XMLFormat, '/NewDataSet/ProductIssueDetails', 2)
	With
		(
			
			IssueDate			Varchar(10),
			StockPointID		Varchar(10),
			ProductID			Varchar(10),
			Rate				decimal(18,2),
			BalanceQty			decimal(18,0),
			IssueQty			decimal(18,2),
			Amount				decimal(18,2)

		)

	BEGIN TRANSACTION

	--select * from TrnJobProductIssueDtl

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @IssueDate,@StockPointID,@ProductID,@Rate,@BalanceQty,@IssueQty,@Amount

	While (@@Fetch_Status=0)
	Begin


		If @IssueDate = ''
		Begin
			select 'Please Give Issue Date'
			return
		END

		IF @StockPointID =''
		Begin
			select 'Please Give Stock Point'
			return
		END

		IF @StockPointID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstStockPoint
			where   (StockPointID = @StockPointID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Stock Point ID'
				return
			end
		END

		IF @ProductID =''
		Begin
			select 'Please Give Product'
			return
		END

		IF @ProductID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Product ID'
				return
			end
		END

		IF @Rate <= 0
		Begin
			select 'Rate can not be empty'
			return
		END

		IF @BalanceQty <= 0 
		Begin
			select 'Please Give No Balance Qty.'
			return
		END

		IF @IssueQty <= 0 
		Begin
			select 'Please Give Issue Qty.'
			return
		END
		
		IF @Amount <= 0
		Begin
			select 'Amount can not be empty'
			return
		END

	exec AutoGenerateID 'TrnJobProductIssueDtl' , 'JobProductIssueDtlID' , 18 , @AutoGenPrefix , @NewJobProductIssueDtlID output

	Insert Into TrnJobProductIssueDtl
	(JobProductIssueDtlID,JobNo,IssueDate,stockPointID,ProductID,Rate,BalanceStockQty,IssueQty,ProductAmt)
	Values
	(@NewJobProductIssueDtlID,@JobNo,Convert(Datetime,@IssueDate,103),@StockPointID,@ProductID,@Rate,
	 @BalanceQty,@IssueQty,@Amount)

	-------------- Updating table TrnJobHdr ------------------------------------------------------------------

	Update		TrnJobHdr
	Set			ProductIssueTotal=ProductIssueTotal+@Amount
	Where		JobNo=@JobNo
	And			CompanyID=@CompanyID
	And			BranchID=@BranchID
	And			FinYearID=@FinYearID

	-------------- End of Updating table TrnJobHdr ------------------------------------------------------------

	-------------------------------------Stock Effect----------------------------------------------------------

	Set	@TempIssQty=@IssueQty


	Declare cStock Cursor
	For
	Select	StockInDtlID,(StockInQty-UtilQty) As RemainingQty,VATRate
	From	TrnStockInDtl
	Where	StockPointID=@StockPointID
	And		ProductID=@ProductID
	And		CompanyID=@CompanyID
	And		BranchID=@BranchID
	And		FinYearID=@FinYearID
	And		(StockInQty-UtilQty) > 0
	Order	By InDocDate

	Open cStock
	Fetch Next From cStock Into @StockInDtlID,@RemainingQty,@VatRate

	Set @intCntr=0
	While @@Fetch_Status=0
	Begin
		If @TempIssQty > 0
		Begin
	/*
			Setting The Stock Out Quantity For Updating TrnStockInDtl,TrnStockOutDtl,
			TrnCurrentStock Table
	*/
			If @RemainingQty >= @TempIssQty
			Begin
				Set	@StockOutQty=@TempIssQty
			End
			Else
			Begin
				Set	@StockOutQty=@RemainingQty
			End

	-------- Updating TrnStockInDtl the table------------------------------------------------

				Update	TrnStockInDtl
				Set		UtilQty=UtilQty+@StockOutQty
				Where	StockInDtlID=@StockInDtlID
				And		StockPointID=@StockPointID
				And		ProductID=@ProductID
				And		CompanyID=@CompanyID
				And		BranchID=@BranchID
				And		FinYearID=@FinYearID

	--------End of Updating TrnStockInDtl the table-----------------------------------------

	-------- Inserting TrnStockOutDtl the table------------------------------------------------

	
			exec AutoGenerateID 'TrnStockOutDtl','StockOutDtlID' , 15 , @AutoGenPrefix,@NewStockOutDtlID output

			Insert Into TrnStockOutDtl(StockOutDtlID,StockInDtlID,OutDocType,OutDocNo,OutDocDate,StockPointID,
			ProductID,StockOutQty,SaleRate,VATRate,CompanyID,BranchID,FinYearID)
			Values(@NewStockOutDtlID,@StockInDtlID,'ISU',@NewJobProductIssueDtlID,Convert(Datetime,@IssueDate,103)
			,@StockPointID,@ProductID,
			@IssueQty,@Rate,@VatRate,@CompanyID,@BranchID,@FinYearID)
			-------- End of Inserting TrnStockOutDtl the table------------------------------------------------

	---------------End of Stock Effect--------------------------------------------------------------------
	
	-------- Updating TrnCurrentStock the table------------------------------------------------

			Update	TrnCurrentStock
			Set		StockOutQty=StockOutQty+@IssueQty
			Where	StockPointID=@StockPointID
			And		ProductID=@ProductID
			And		CompanyID=@CompanyID
			And		BranchID=@BranchID
			And		FinYearID=@FinYearID

	-------- End of Updating TrnCurrentStock the table------------------------------------------------

			Set		@TempIssQty=@TempIssQty-@StockOutQty
		End
	Fetch Next From cStock Into @StockInDtlID,@RemainingQty,@VatRate
	End
	Close cStock
	Deallocate cStock

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Fetch Next From CurDetailRecord Into @IssueDate,@StockPointID,@ProductID,@Rate,@BalanceQty,@IssueQty,@Amount

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Job Product Issue Details' + @NewJobProductIssueDtlID
	Set @CurDateTime = getdate()
	--Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @JobNo
GO
/****** Object:  Table [dbo].[TrnInvoiceHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnInvoiceHdr](
	[InvoiceNo] [varchar](15) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[InvoiceType] [varchar](8) NOT NULL,
	[DeliveryNoteNo] [varchar](15) NULL,
	[JobNo] [varchar](15) NULL,
	[CustomerID] [varchar](10) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[BillingAddress] [varchar](200) NOT NULL,
	[BillingCity] [varchar](50) NULL,
	[BillingPin] [varchar](15) NULL,
	[Remarks] [varchar](200) NULL,
	[ProductTotalAmt] [decimal](18, 2) NULL,
	[VATRate] [decimal](18, 2) NULL,
	[VATAmt] [decimal](18, 2) NULL,
	[InvoiceAmt] [decimal](18, 2) NULL,
	[InvoiceStatus] [varchar](3) NOT NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [varchar](200) NULL,
	[CompanyID] [varchar](2) NOT NULL,
	[BranchID] [varchar](3) NOT NULL,
	[FinYearID] [varchar](4) NOT NULL,
 CONSTRAINT [PK_TrnInvoiceHdr] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnInvoiceHdr] ([InvoiceNo], [InvoiceDate], [InvoiceType], [DeliveryNoteNo], [JobNo], [CustomerID], [CustomerName], [BillingAddress], [BillingCity], [BillingPin], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [InvoiceAmt], [InvoiceStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000001', CAST(0x0000996E00000000 AS DateTime), N'SALES', N'010017777000001', NULL, N'0100100001', N'Tridip Bhattacharya', N'7/4 kualalumpur.', N'kolkata', N'7220154', N'vcncvn', CAST(1800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), N'NUT', NULL, NULL, N'01', N'001', N'7777')
INSERT [dbo].[TrnInvoiceHdr] ([InvoiceNo], [InvoiceDate], [InvoiceType], [DeliveryNoteNo], [JobNo], [CustomerID], [CustomerName], [BillingAddress], [BillingCity], [BillingPin], [Remarks], [ProductTotalAmt], [VATRate], [VATAmt], [InvoiceAmt], [InvoiceStatus], [CancelDate], [CancelReason], [CompanyID], [BranchID], [FinYearID]) VALUES (N'010017777000002', CAST(0x0000997500000000 AS DateTime), N'SERVICE', NULL, N'010017777000001', N'0100100001', N'Tridip Bhattacharya', N'Bangur Avenue, Block - A
Kolkata - 700055', N'Kolkata', N'700055', N'Good', CAST(12441.93 AS Decimal(18, 2)), CAST(12.60 AS Decimal(18, 2)), CAST(1505.47 AS Decimal(18, 2)), CAST(13947.40 AS Decimal(18, 2)), N'NUT', NULL, NULL, N'01', N'001', N'7777')
/****** Object:  StoredProcedure [dbo].[TrnServiceInvoice_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from TrnInvoiceHdr
*/


CREATE PROCEDURE [dbo].[TrnServiceInvoice_Cancel]

	@InvNo						varchar(15),
	@CancelDate					varchar(10),
	@CancelReason				varchar(200),
	@LogUserId    	 			varchar(12),
	@CompanyId  	 			varchar(2),
	@BranchId        			varchar(3),
	@FinYearID        			varchar(4)


As 
 

	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	--sp_help TrnInvoiceHdr

	select  @intcntr = count(*)
	from   	TrnInvoiceHdr
	where   (InvoiceStatus = 'NUT' and InvoiceNo=@InvNo)


	if @intcntr  <= 0
	begin
	      	select 'Error : Invoice Status is not [NUT] so this can not be canceled'
	        return
	end

	BEGIN TRANSACTION   

	Update	TrnInvoiceHdr
	Set		InvoiceStatus='CAN',
			CancelDate=Convert(datetime,@CancelDate,103),
			CancelReason=@CancelReason 
	Where	InvoiceNo=@InvNo


	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Cancel Service Invoice' + @InvNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @InvNo
GO
/****** Object:  StoredProcedure [dbo].[TrnSalesReturn_Insert]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 12/07/2007
/*
<NewDataSet>
	<SalesReturn>
	<ProductID>0000000001</ProductID>
	<Rate>4.000</Rate>
	<InvQty>1</InvQty>
	<ReturnQty>1</ReturnQty>
	<Amount>1</Amount>
	</SalesReturn>
</NewDataSet>

*/

CREATE PROCEDURE [dbo].[TrnSalesReturn_Insert]
(
	@GRNNo				as varchar(15)=null,
	@GRNDate			as varchar(10),
	@InvoiceNo			as varchar(15)=null,
	@InvoiceDate			as varchar(10),
	@DeliveryNo			as varchar(15)=null,
	@DeliveryNoDate		as varchar(10),
	@StockPointID			as varchar(10)=null,
	@DeliveredBy	  		as varchar(50) = null,
	@VehicleNo	  		as varchar(30) = null,
	@Remarks  			as varchar(200) = null,
	@VatRate			as decimal(18,2)=0,
	@VatAmt			as decimal(18,2)=0,
	@SubTotal			as decimal(18,3)=0,
	@InvTotal			as decimal(18,3)=0,
	@DetailXml			as NTEXT,

	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId	        		as varchar(3),
	@FinYearID        		as varchar(4)
)
As 
 
Begin

	
	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer
	
	Declare @CustomerID  as Varchar(10)
	Declare @NewGRNNo as varchar(15)
	Declare @NweGRNDtlID as varchar(18)
	Declare @NewStockInDtlID as varchar(15)
	Declare @NewCurrentStockID as varchar(15)

	Declare @AutoGenPrefix as varchar(9)

	Declare @XMLFormat Int

	Declare @ProductID as Varchar(10)
	Declare @Rate as Decimal(18,3)
	Declare @InvQty as Decimal(18,3)
	Declare @ReturnQty as Decimal(18,2)
	Declare @Amount as Decimal(18,3)


	Declare @ProductQty as Decimal(18,3)
	Declare @UtilQty as Decimal(18,3)


	-- Setting Counter to zero
	set @intCntr = 0

	SELECT @intcntr = count(*),@CustomerID=MstCustomer.CustomerID
	FROM TrnInvoiceHdr INNER JOIN MstCustomer 
	ON TrnInvoiceHdr.CustomerID=MstCustomer.CustomerID
	Where TrnInvoiceHdr.InvoiceStatus in ('NUT','PUT')
	and TrnInvoiceHdr.InvoiceNo=@InvoiceNo
	group by MstCustomer.CustomerID

	if @intcntr  <= 0
	begin
	        select 'Error : Invalid Invoice No or Invoice No Utilised/Cancel/Close'
	        return
	end

	IF @GRNDate=''
	BEGIN
	        select 'Error : GRN date can not be empty'
	        return
	END

	select  @intcntr = count(*)
	from   	TrnDeliveryNoteHdr
	where   (DeliveryNoteNo=@DeliveryNo)

	if @intcntr  <= 0
	begin
	        select 'Error : Invalid Delivery Note No'
	        return
	end

	select  @intcntr = count(*)
	from   	MstStockPoint
	where   (StockPointID = @StockPointID)

	if @intcntr  <= 0
	begin
	        select 'Error : Invalid Stock Point ID'
	        return
	end


	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select ProductID,Rate,InvQty,ReturnQty,Amount
	From Openxml (@XMLFormat, '/NewDataSet/SalesReturn', 2)
	With 
	(
		ProductID Varchar(10),
		Rate Decimal(18,3),
		InvQty Decimal(18,3),
		ReturnQty decimal(18,2),
		Amount decimal(18,2)
	)


	BEGIN TRANSACTION   

	-- Auto Generate New GRNNo
	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnGRNHDR' , 'GRNNo' , 15 , @AutoGenPrefix , @NewGRNNo output     
	declare @tdate as datetime


	Insert Into TrnGRNHdr
	(
		GRNNo,
		GRNDate,
		SalesReturnTag,
		SupplierID,
		CustomerID,
		PurchaseOrderNo,
		InvoiceNo,
		RefDeliveryNoteNo,
		RefDeliveryNoteDate,
		StockPointID,
		DeliveredBy,
		VehicleNo,
		Remarks,
		VatRate,
		VatAmount,
		SubTotal,
		InvTotal,
		GRNStatus,
		CancelDate,
		CancelReason,
		CompanyID,
		BranchID,
		FinYearID

	)
	Values
	(
		@NewGRNNo,
		Convert(datetime,@GRNDate,103),
		'Y',
		null,
		@CustomerID,
		null,
		null,
		@DeliveryNo,
		Convert(datetime,@DeliveryNoDate,103),
		@StockPointID,
		@DeliveredBy,
		@VehicleNo,
		@Remarks,
		@VatRate,
		@VatAmt,
		@SubTotal,
		@InvTotal,
		'NUT',
		null,
		null,
		@CompanyId,
		@BranchId,
		@FinYearID
	)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ProductID,@Rate,@InvQty,@ReturnQty,@Amount

	While (@@Fetch_Status=0)
	Begin

		IF @ProductID=''
		Begin
			select 'Error : Product id can not be empty'
			return
		END

		IF @ProductID<>''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Error : Invalid product id'
				return
			end
		END


		IF isnull(@Rate,0) <=0
		Begin
			select 'Error : Rate can not be empty or less than 0'
			return
		END

		IF isnull(@InvQty,0) <=0
		Begin
			select 'Error : Invoice Qty can not be empty or less than 0'
			return
		END

		IF isnull(@ReturnQty,0) <=0
		Begin
			select 'Error : Return Qty can not be empty or less than 0'
			return
		END

		IF isnull(@Amount,0) <=0
		Begin
			select 'Error : Amount can not be empty or less than 0'
			return
		END

		-- Auto Generate New GRNDtlID
		exec  AutoGenerateID 'TrnGRNDTL' , 'GRNDtlID' , 18  , @NewGRNNo,@NweGRNDtlID output  

		INSERT into TrnGRNDtl  (GRNDtlID,GRNNo,ProductID,BalancePOQty,InvoiceQty,ReceiptQty,Amount)
		Values (@NweGRNDtlID,@NewGRNNo,@ProductID,0,@InvQty,@ReturnQty,@Amount)	

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		---**********
		set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
		exec  AutoGenerateID 'TrnStockInDtl' , 'StockInDtlID' , 15 , @AutoGenPrefix , @NewStockInDtlID output     



		Insert Into TrnStockInDtl
		(
			GRNNo,
			GRNDate,
			StockInDtlID,
			InDocType,
			InDocNo,
			InDocDate,
			StockPointID,
			ProductID,
			StockINQty,
			PurchaseRate,
			VATRate,
			CompanyID,
			BranchID,
			FinYearID
		)
		Values
		(
			@NewGRNNo,
			@GRNDate,
			@NewStockInDtlID,
			'SRT',
			@NewGRNNo,
			Convert(datetime,@GRNDate,103),
			@StockPointID,
			@ProductID,
			@ReturnQty,
			@Rate,
			0,
			@CompanyId,
			@BranchId,
			@FinYearID
		)

		Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

		Select  @intcntr = count(*)
		From   	TrnCurrentStock
		Where   ProductID=@ProductID and StockPointID=@StockPointID and 
		CompanyId=@CompanyId and BranchId=@BranchId and FinYearID=@FinYearID


		Set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
		exec  AutoGenerateID 'TrnCurrentStock' , 'CurrentStockID' , 15 , @AutoGenPrefix , @NewCurrentStockID output     

		IF @intcntr  <= 0
		Begin
			Insert Into TrnCurrentStock
			(
				CurrentStockID,
				StockPointID,
				ProductID,
				OpeningStockQty,
				StockInQty,
				StockOutQty,
				ClosingStockQty,
				CompanyID,
				BranchID,
				FinYearID
			)
			Values
			(
				@NewCurrentStockID,
				@StockPointID,
				@ProductID,
				0,
				@ReturnQty,
				0,
				0,
				@CompanyId,
				@BranchId,
				@FinYearID
			)

			select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
		
		End
		Else
		Begin
			Update TrnCurrentStock 
			Set StockInQty=StockInQty+@ReturnQty 		
			Where   ProductID=@ProductID and StockPointID=@StockPointID and 
			CompanyId=@CompanyId and BranchId=@BranchId and FinYearID=@FinYearID
 		End

		Fetch Next From CurDetailRecord Into @ProductID,@Rate,@InvQty,@ReturnQty,@Amount

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord
	--- Validation end for detail part from here


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Insert Sales Return' + @NewGRNNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewGRNNo
  

 END
GO
/****** Object:  StoredProcedure [dbo].[TrnSalesInvoice_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 26/06/2007  
 
  
CREATE PROCEDURE [dbo].[TrnSalesInvoice_Cancel]  
(  
	@SalesInvNo  		as varchar(15)=null,  
	@DeliveryNo  		as varchar(15)=null, 
	@CancelDate		as varchar(10),  
	@CancelReason		as varchar(200),  

	@LogUserId        	as varchar(12),  
	@CompanyId      	as varchar(2),  
	@BranchId           	as varchar(3),  
	@FinYearID          	as varchar(4)  
)  
As   
   
Begin  

	Declare @logMsg as Varchar(200)  
	Declare @CurDatetime as datetime   
	Declare @intError as integer  
	
	BEGIN TRANSACTION
	Update TrnInvoiceHdr Set InvoiceStatus='CAN',CancelDate=Convert(datetime,@CancelDate,103),
	CancelReason=@CancelReason
	Where InvoiceNo=@SalesInvNo
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  

	Update TrnDeliveryNoteHdr Set DeliveryNoteStatus='NUT'
	Where DeliveryNoteNo=@DeliveryNo

	 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
 
	 -- Inserting Values into Log Table   
	 Set @LogMsg= 'Insert Sales Invoice' + @SalesInvNo  
	 Set @CurDateTime = getdate()  
	 Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg  
	 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
	   
	 COMMIT TRANSACTION  
	 select @SalesInvNo  
    
 END
GO
/****** Object:  StoredProcedure [dbo].[rptPurchaseReturn_SelectHdr]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rptPurchaseReturn_SelectHdr]
(
	@PRetNo	as varchar(15)=null
)
as

Begin
	SELECT TrnDeliveryNoteHdr.DeliveryNoteNo,TrnDeliveryNoteHdr.DeliveryNoteDate, 
	MstSupplier.SupplierName,TrnDeliveryNoteHdr.ShippingAddress, 
	TrnDeliveryNoteHdr.ShippingCity,TrnDeliveryNoteHdr.ShippingPin,TrnDeliveryNoteHdr.DespatchMode, 
	TrnDeliveryNoteHdr.DeliveredBy,TrnDeliveryNoteHdr.GRNNo,TrnDeliveryNoteHdr.VehicleNo, 
	TrnDeliveryNoteHdr.Remarks,TrnDeliveryNoteHdr.ProductTotalAmt,TrnDeliveryNoteHdr.VATRate, 
	TrnDeliveryNoteHdr.VATAmt,TrnDeliveryNoteHdr.TotalAmt,TrnDeliveryNoteHdr.CompanyID, 
	TrnDeliveryNoteHdr.BranchID,dbo.TrnDeliveryNoteHdr.FinYearID,TrnGRNHdr.RefDeliveryNoteNo as ChallanNo, 
	TrnGRNHdr.RefDeliveryNoteDate as ChallanDate
	FROM TrnDeliveryNoteHdr INNER JOIN
	MstSupplier ON TrnDeliveryNoteHdr.SupplierID = MstSupplier.SupplierID INNER JOIN
	TrnGRNHdr ON TrnDeliveryNoteHdr.GRNNo = TrnGRNHdr.GRNNo
	Where TrnDeliveryNoteHdr.DeliveryNoteNo=@PRetNo and TrnDeliveryNoteHdr.PurchaseReturnTag='Y'
End
GO
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNoteNo_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[TrnDeliveryNoteNo_Select]
(
	@CompanyId	Varchar(2),
	@BranchId 	Varchar(3),
	@FinYearID	Varchar(4)
)
as

Begin
	Select DeliveryNoteNo from TrnDeliveryNoteHdr
	Where DeliveryNoteStatus in ('NUT') and
	CompanyID=@CompanyID and 
	BranchID=@BranchID and 
	FinYearID=@FinYearID
End
GO
/****** Object:  StoredProcedure [dbo].[TrnJobProductIssue_Update]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrnJobProductIssue_Update]

	@JobNo						Varchar(15),
	@ProductTotalAmt			Decimal(18,2),

	@DetailXml					Ntext,

	@LogUserId					Varchar(12),
	@CompanyID					Varchar(2),
	@BranchID					Varchar(3),
	@FinYearID					Varchar(4)


As


	Declare			@intCntr						int
	Declare			@logMsg							Varchar(200)
	Declare			@CurDatetime					datetime
	Declare			@intError						integer
	Declare			@NewJobProductIssueDtlID		Varchar(18)
	Declare			@NewStockOutDtlID				Varchar(15)
	Declare			@NewCurrentStockID				Varchar(15)
	Declare			@AutoGenPrefix					Varchar(9)
	Declare			@StockInDtlID					Varchar(15)
	Declare			@InDocType						Varchar(3)
	Declare			@InDocNo						Varchar(20)
	Declare			@InDocDate						DateTime


	Declare			@XMLFormat						Int

	Declare			@IssueDate						Varchar(10)
	Declare			@StockPointID					Varchar(10)
	Declare			@ProductID						Varchar(10)
	Declare			@Rate							Decimal(18,2)
	Declare			@BalanceQty						Decimal(18,3)
	Declare			@IssueQty						Decimal(18,3)
	Declare			@Amount							Decimal(18,2)

	Declare			@StockInQty						Decimal(18,3)
	Declare			@UtilQty						Decimal(18,3)
	Declare			@RemainingQty					Decimal(18,3)
	Declare			@VatRate						Decimal(18,3)
	Declare			@TempIssQty						Decimal(18,3)
	Declare			@StockOutQty					Decimal(18,3)
	Declare			@TempStockInDtlID				Varchar(15)
	Declare			@CntStockOutDtl					Int
	Declare			@JobProductIssueDtlID			Varchar(18)
	

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Set @AutoGenPrefix=@CompanyId + @BranchId + @FinYearID

	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select JobProductIssueDtlID,IssueDate,StockPointID,ProductID,Rate,BalanceQty,IssueQty,Amount
	From Openxml (@XMLFormat, '/NewDataSet/ProductIssueDetails', 2)
	With
		(
			JobProductIssueDtlID	Varchar(18),
			IssueDate				Varchar(10),
			StockPointID			Varchar(10),
			ProductID				Varchar(10),
			Rate					decimal(18,2),
			BalanceQty				decimal(18,0),
			IssueQty				decimal(18,2),
			Amount					decimal(18,2)

		)

	BEGIN TRANSACTION

	--select * from TrnJobProductIssueDtl


	Delete	From TrnJobProductIssueDtl
	Where	JobNo=@JobNo And JobNo+StockPointID+ProductID+Convert(Varchar,IssueDate,112)
	Not In
			(
				Select @JobNo+StockPointID+ProductID+Convert(Varchar,Convert(Datetime,IssueDate,103),112)
				From Openxml (@XMLFormat, '/NewDataSet/ProductIssueDetails', 2)
				With
					(
						IssueDate			Varchar(10),
						StockPointID		Varchar(10),
						ProductID			Varchar(10)						
					)

			)

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @JobProductIssueDtlID,@IssueDate,@StockPointID,@ProductID,@Rate,@BalanceQty,@IssueQty,@Amount

	While (@@Fetch_Status=0)
	Begin


		If @IssueDate = ''
		Begin
			select 'Please Give Issue Date'
			return
		END

		IF @StockPointID =''
		Begin
			select 'Please Give Stock Point'
			return
		END

		IF @StockPointID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstStockPoint
			where   (StockPointID = @StockPointID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Stock Point ID'
				return
			end
		END

		IF @ProductID =''
		Begin
			select 'Please Give Product'
			return
		END

		IF @ProductID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstProduct
			where   (ProductID = @ProductID)
	
			if @intcntr  <= 0
			begin
			         	select 'Invalid Product ID'
				return
			end
		END

		IF @Rate <= 0
		Begin
			select 'Rate can not be empty'
			return
		END

		IF @BalanceQty <= 0
		Begin
			select 'Please Give No Balance Qty.'
			return
		END

		IF @IssueQty <= 0
		Begin
			select 'Please Give Issue Qty.'
			return
		END
		

		IF @Amount <= 0
		Begin
			select 'Amount can not be empty'
			return
		END
	
	Select	@intCntr=Count(*)
	From	TrnJobProductIssueDtl
	Where	JobNo=@JobNo
	And		IssueDate=Convert(DateTime,@IssueDate,103)
	And		StockPointID=@StockPointID
	And		ProductID=@ProductID
	And		JobNo In
	(Select	JobNo 
	 From	TrnJobHdr
	 Where	CompanyID=@CompanyID
	 And	BranchID=@BranchID
	 And	FinYearID=@FinYearID
	)

	If @intCntr <=0
	Begin
			exec AutoGenerateID 'TrnJobProductIssueDtl' , 'JobProductIssueDtlID' , 18 , @AutoGenPrefix , @NewJobProductIssueDtlID output
			Insert Into TrnJobProductIssueDtl
			(JobProductIssueDtlID,JobNo,IssueDate,stockPointID,ProductID,Rate,BalanceStockQty,IssueQty,ProductAmt)
			Values
			(@NewJobProductIssueDtlID,@JobNo,Convert(Datetime,@IssueDate,103),@StockPointID,@ProductID,@Rate,
			 @BalanceQty,@IssueQty,@Amount)
	End
	Else
	Begin
			Update	TrnJobProductIssueDtl
			Set		Rate=@Rate,
					BalanceStockQty=@BalanceQty,
					IssueQty=@IssueQty,
					ProductAmt=@Amount
			Where	JobNo=@JobNo
			And		IssueDate=Convert(DateTime,@IssueDate,103)
			And		StockPointID=@StockPointID
			And		ProductID=@ProductID
			And		JobNo In
			(Select	JobNo 
			 From	TrnJobHdr
			 Where	CompanyID=@CompanyID
			 And	BranchID=@BranchID
			 And	FinYearID=@FinYearID
			)
	End

	-------------------------------------Stock Reversing----------------------------------------------------------

			Select	@CntStockOutDtl=Count(StockOutDtlID)
			From	TrnStockOutDtl
			Where	StockPointID=@StockPointID
			And		StockOutQty=@IssueQty
			And		ProductID=@ProductID
			And		CompanyID=@CompanyID
			And		BranchID=@BranchID
			And		FinYearID=@FinYearID

			If @CntStockOutDtl > 0
			Begin

						Select		@TempStockInDtlID=StockInDtlID
						From		TrnStockOutDtl
						Where		StockPointID=@StockPointID
						And			OutDocNo=@JobProductIssueDtlID
						And			OutDocType='ISU'
						And			ProductID=@ProductID
						And			CompanyID=@CompanyID
						And			BranchID=@BranchID
						And			FinYearID=@FinYearID

						Delete		From	TrnStockOutDtl
						Where		StockPointID=@StockPointID
						And			OutDocNo=@JobProductIssueDtlID
						And			OutDocType='ISU'
						And			ProductID=@ProductID
						And			CompanyID=@CompanyID
						And			BranchID=@BranchID
						And			FinYearID=@FinYearID


						Update		TrnStockInDtl
						Set			UtilQty=UtilQty-@IssueQty
						Where		StockPointID=@StockPointID
						And			StockInDtlID=@TempStockInDtlID
						And			ProductID=@ProductID
						And			CompanyID=@CompanyID
						And			BranchID=@BranchID
						And			FinYearID=@FinYearID


						Update		TrnCurrentStock
						Set			StockOutQty=StockOutQty-@IssueQty
						Where		StockPointID=@StockPointID
						And			ProductID=@ProductID
						And			CompanyID=@CompanyID
						And			BranchID=@BranchID
						And			FinYearID=@FinYearID
			End

					

	-------------------------------------End of Stock Reversing------------------------------------------------
	-------------------------------------Stock Effect----------------------------------------------------------

	Set	@TempIssQty=@IssueQty


	Declare cStock Cursor
	For
	Select	StockInDtlID,InDocType,InDocNo,InDocDate,(StockInQty-UtilQty) As RemainingQty,VATRate
	From	TrnStockInDtl
	Where	StockPointID=@StockPointID
	And		ProductID=@ProductID
	And		CompanyID=@CompanyID
	And		BranchID=@BranchID
	And		FinYearID=@FinYearID
	And		(StockInQty-UtilQty) > 0
	Order	By InDocDate

	Open cStock
	Fetch Next From cStock Into @StockInDtlID,@InDocType,@InDocNo,@InDocDate,@RemainingQty,@VatRate

	Set @intCntr=0
	While @@Fetch_Status=0
	Begin
		If @TempIssQty > 0
		Begin
	/*
			Setting The Stock Out Quantity For Updating TrnStockInDtl,TrnStockOutDtl,
			TrnCurrentStock Table
	*/
			If @RemainingQty >= @TempIssQty
			Begin
				Set	@StockOutQty=@TempIssQty
			End
			Else
			Begin
				Set	@StockOutQty=@RemainingQty
			End

	-------- Updating TrnStockInDtl the table------------------------------------------------

				Update	TrnStockInDtl
				Set		UtilQty=UtilQty+@StockOutQty
				Where	StockInDtlID=@StockInDtlID
				And		StockPointID=@StockPointID
				And		ProductID=@ProductID
				And		CompanyID=@CompanyID
				And		BranchID=@BranchID
				And		FinYearID=@FinYearID

	--------End of Updating TrnStockInDtl the table-----------------------------------------

	-------- Inserting TrnStockOutDtl the table------------------------------------------------

			--If @NewJobProductIssueDtlID=null
				--Begin
					--Set @NewJobProductIssueDtlID=@JobProductIssueDtlID
				--End

			exec AutoGenerateID 'TrnStockOutDtl','StockOutDtlID' , 15 , @AutoGenPrefix,@NewStockOutDtlID output

			Insert Into TrnStockOutDtl(StockOutDtlID,StockInDtlID,OutDocType,OutDocNo,OutDocDate,StockPointID,
			ProductID,StockOutQty,SaleRate,VATRate,CompanyID,BranchID,FinYearID)
			Values(@NewStockOutDtlID,@StockInDtlID,'ISU',@JobProductIssueDtlID,Convert(Datetime,@IssueDate,103)
			,@StockPointID,@ProductID,
			@IssueQty,@Rate,@VatRate,@CompanyID,@BranchID,@FinYearID)
			-------- End of Inserting TrnStockOutDtl the table------------------------------------------------

	
	-------- Updating TrnCurrentStock the table------------------------------------------------

			Update	TrnCurrentStock
			Set		StockOutQty=StockOutQty+@IssueQty
			Where	StockPointID=@StockPointID
			And		ProductID=@ProductID
			And		CompanyID=@CompanyID
			And		BranchID=@BranchID
			And		FinYearID=@FinYearID

	-------- End of Updating TrnCurrentStock the table------------------------------------------------

			Set		@TempIssQty=@TempIssQty-@StockOutQty
		End

	Fetch Next From cStock Into @StockInDtlID,@InDocType,@InDocNo,@InDocDate,@RemainingQty,@VatRate
	End

	Close cStock
	Deallocate cStock

	---------------End of Stock Effect--------------------------------------------------------------------


	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Fetch Next From CurDetailRecord Into @JobProductIssueDtlID,@IssueDate,@StockPointID,@ProductID,@Rate,@BalanceQty,@IssueQty,@Amount

	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here

	-- Inserting Values into Log Table
	Set @LogMsg= 'Updating Job Product Issue Details' + @NewJobProductIssueDtlID
	Set @CurDateTime = getdate()
	--Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @JobNo
GO
/****** Object:  StoredProcedure [dbo].[TrnGRNNo_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--Developed By Tridip Bhattacharjee

--Select * From TrnGRNHdr

CREATE procedure [dbo].[TrnGRNNo_Select]
(
	@GRNNo		Varchar(15)
)
As


	Begin
		SELECT TrnGRNHdr.GRNDate, TrnGRNHdr.PurchaseOrderNo, TrnGRNHdr.StockPointID, TrnGRNHdr.RefDeliveryNoteNo, 
		TrnGRNHdr.RefDeliveryNoteDate, TrnGRNHdr.DeliveredBy, TrnGRNHdr.VehicleNo, TrnGRNHdr.Remarks, 
		MstSupplier.SupplierName, TrnPurchaseOrderHdr.PurchaseOrderDate,
		TrnGRNHdr.GRNStatus,TrnGRNHdr.CancelDate,TrnGRNHdr.CancelReason 
		FROM TrnGRNHdr INNER JOIN
		MstSupplier ON TrnGRNHdr.SupplierID = MstSupplier.SupplierID INNER JOIN
		TrnPurchaseOrderHdr ON TrnGRNHdr.PurchaseOrderNo = TrnPurchaseOrderHdr.PurchaseOrderNo
		Where GRNNo=@GRNNo
	
		SELECT  TrnGRNDtl.GRNDtlID, TrnGRNDtl.GRNNo, TrnGRNDtl.ProductID, ISNULL(TrnPurchaseOrderDtl.ProductQty, 0) 
                      	- ISNULL(TrnPurchaseOrderDtl.UtilQty, 0) + ISNULL(TrnGRNDtl.ReceiptQty, 0) AS Qty, TrnGRNDtl.ReceiptQty RcptQty, 
                      	MstProduct.ProductName, MstProduct.ProductUOM as Unit, TrnPurchaseOrderDtl.ProductRate as rate
		FROM  TrnGRNDtl INNER JOIN
		TrnPurchaseOrderDtl ON TrnGRNDtl.ProductID = TrnPurchaseOrderDtl.ProductID INNER JOIN
		TrnGRNHdr ON TrnPurchaseOrderDtl.PurchaseOrderNo = TrnGRNHdr.PurchaseOrderNo AND 
		TrnGRNDtl.GRNNo = TrnGRNHdr.GRNNo INNER JOIN
		MstProduct ON TrnGRNDtl.ProductID = MstProduct.ProductID
		Where  TrnGRNHdr.GRNNo=@GRNNo
	End
GO
/****** Object:  StoredProcedure [dbo].[PurchaseReturndetail_Select]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Developed By Tridip
CREATE procedure [dbo].[PurchaseReturndetail_Select]
(
	@GRNNo     as varchar(15)
)
as
Begin
	SELECT MstSupplier.SupplierName, MstSupplier.SupplierAddress, MstSupplier.SupplierCity, 
	MstSupplier.SupplierPin,TrnGRNHdr.RefDeliveryNoteNo, TrnGRNHdr.RefDeliveryNoteDate
	FROM TrnGRNHdr INNER JOIN
	MstSupplier ON TrnGRNHdr.SupplierID = MstSupplier.SupplierID
	Where TrnGRNHdr.GRNNo=@GRNNo

/*
	SELECT TrnGRNDtl.ProductID,MstProduct.ProductName,MstProduct.ProductUOM as Unit,
	TrnPurchaseOrderDtl.ProductRate as Rate,TrnGRNDtl.ReceiptQty as GRNQty,0 as RetQty,
	(isnull(TrnGRNDtl.ReceiptQty,0) * isnull(TrnPurchaseOrderDtl.ProductRate,0)) as Amount
	FROM TrnGRNDtl INNER JOIN
	MstProduct ON TrnGRNDtl.ProductID =MstProduct.ProductID INNER JOIN
	TrnPurchaseOrderDtl ON MstProduct.ProductID =TrnPurchaseOrderDtl.ProductID
	Where TrnGRNDtl.GRNNo=@GRNNo
*/

	SELECT TrnGRNDtl.ProductID, MstProduct.ProductName, MstProduct.ProductUOM AS Unit, TrnPurchaseOrderDtl.ProductRate AS Rate, 
	TrnGRNDtl.ReceiptQty AS GRNQty, 0 AS RetQty, ISNULL(TrnGRNDtl.ReceiptQty, 0) * ISNULL(TrnPurchaseOrderDtl.ProductRate, 0) 
	AS Amount FROM TrnGRNDtl INNER JOIN MstProduct ON TrnGRNDtl.ProductID = MstProduct.ProductID INNER JOIN
	TrnGRNHdr ON TrnGRNDtl.GRNNo = TrnGRNHdr.GRNNo INNER JOIN TrnPurchaseOrderHdr ON TrnGRNHdr.PurchaseOrderNo = TrnPurchaseOrderHdr.PurchaseOrderNo INNER JOIN
	TrnPurchaseOrderDtl ON TrnPurchaseOrderHdr.PurchaseOrderNo = TrnPurchaseOrderDtl.PurchaseOrderNo AND 
	TrnGRNDtl.ProductID = TrnPurchaseOrderDtl.ProductID
	Where TrnGRNDtl.GRNNo=@GRNNo
End
GO
/****** Object:  Table [dbo].[TrnDeliveryNoteDtl]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnDeliveryNoteDtl](
	[DeliveryNoteDtlID] [varchar](18) NOT NULL,
	[DeliveryNoteNo] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[GRNQty] [decimal](18, 3) NOT NULL,
	[BalanceProInvQty] [decimal](18, 3) NOT NULL,
	[DeliveryQty] [decimal](18, 3) NOT NULL,
	[ProductAmt] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TrnDeliveryNoteDtl] PRIMARY KEY CLUSTERED 
(
	[DeliveryNoteDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnDeliveryNoteDtl] UNIQUE NONCLUSTERED 
(
	[DeliveryNoteNo] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnDeliveryNoteDtl] ([DeliveryNoteDtlID], [DeliveryNoteNo], [ProductID], [Rate], [GRNQty], [BalanceProInvQty], [DeliveryQty], [ProductAmt]) VALUES (N'010017777000001001', N'010017777000001', N'0100100004', CAST(1100.00 AS Decimal(18, 2)), CAST(0.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(0.00 AS Decimal(18, 2)))
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNote_Cancel]    Script Date: 02/28/2018 23:58:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Tridip -- 11/06/2007
/*
<NewDataSet>
	<DeliveryDetail>
		<ProductID>0300700001</ProductID>
		<Rate>500.00</Rate>
		<BalinvQty>5.000</BalinvQty>
		<DelQty>2</DelQty>
			<LiftDetail>
				<ProductID>0300700001</ProductID>
				<StockInDtlID>030077777000008</StockInDtlID>
				<InDocType>GRN</InDocType>
				<InDocNo>030077777000004</InDocNo>
				<DocDate>06/06/2007</DocDate>
				<StockPointID>00000023</StockPointID>
				<BalQty>2.000</BalQty>
				<LiftQty>2</LiftQty>
			</LiftDetail>
	</DeliveryDetail>
	<DeliveryDetail>
		<ProductID>0300700002</ProductID>
		<Rate>1400.00</Rate>
		<BalinvQty>2.000</BalinvQty>
		<DelQty>2</DelQty>
			<LiftDetail>
				<ProductID>0300700002</ProductID>
				<StockInDtlID>030077777000009</StockInDtlID>
				<InDocType>GRN</InDocType>
				<InDocNo>030077777000004</InDocNo>
				<DocDate>06/06/2007</DocDate>
				<StockPointID>00000023</StockPointID>
				<BalQty>2.000</BalQty>
				<LiftQty>2</LiftQty>
			</LiftDetail>
	</DeliveryDetail>
</NewDataSet>
*/


CREATE PROCEDURE [dbo].[TrnDeliveryNote_Cancel]
(
	@DVNNo			as varchar(15)=null,
	@DVNDate			as varchar(10),
	@ProformaInvNo		as varchar(15)=null,
	@ShippingAddress		as varchar(200)=null,
	@ModeofDespatch		as varchar(20),
	@ShippingCity			as varchar(50) = null,
	@ShippingPin			as varchar(15) = null,
	@DeliveredBy	  		as varchar(50) = null,
	@VehicleNo	  		as varchar(30) = null,
	@Remarks  			as varchar(200) = null,
	@CancelDate			as varchar(10),
	@CancelReason		as varchar(200),
	@DetailXml			as NTEXT,
	@LogUserId    	 		as varchar(12),
	@CompanyId  	 		as varchar(2),
	@BranchId        			as varchar(3),
	@FinYearID        		as varchar(4)

)
As 
 
Begin

	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime	
	Declare @intError as integer

	Declare @StoreQty as Decimal(18,3)
	Declare @OutQty as Decimal(18,3)
	Declare @DeliveryNoteStatus as varchar(3)

	-- Setting Counter to zero
	set @intCntr = 0


	--- Validation start for detail part from here
	--Prepare input values as an XML documnet

	IF Convert(datetime,@CancelDate,103) <  Convert(datetime,@DVNDate,103)
	Begin
		select 'Error : Cancel date mismatch'
		return
	END

	Select 	@DeliveryNoteStatus = DeliveryNoteStatus
	from	TrnDeliveryNoteHdr 
	Where 	DeliveryNoteNo = @DVNNo
	
	IF @DeliveryNoteStatus in ('UTL','CAN')
	Begin
		select 'Error : This Delivery Not Can not be Cancel'
		return
	END

	IF Convert(datetime,@CancelDate,103) <  Convert(datetime,@DVNDate,103)
	Begin
		select 'Error : Cancel date mismatch'
		return
	END

	BEGIN TRANSACTION   

	-- Update Delivery order details
	Update TrnDeliveryNoteHdr
	Set	DeliveryNoteStatus = 'CAN',
		CancelDate = Convert(datetime,@CancelDate,103),
		CancelReason = @CancelReason
	where	DeliveryNoteNo = @DVNNo
	
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	update 	TrnStockOutDtl
	set	CancelQty = isnull(StockOutQty,0)
	Where	OutDocType = 'DVN'
	and	OutDocNo = @DVNNo

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
 	
	Update 	TrnStockInDtl
	set	TrnStockInDtl.UtilQty = isnull(TrnStockInDtl.UtilQty,0) - isnull(TrnStockOutDtl.CancelQty,0)
	from	TrnStockOutDtl
	Where	TrnStockOutDtl.OutDocType = 'DVN'
	and	TrnStockOutDtl.OutDocNo = @DVNNo
	and	TrnStockInDtl.StockInDtlID = TrnStockOutDtl.StockInDtlID
	
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Update 	TrnCurrentStock
	set	TrnCurrentStock.StockOutQty = isnull(TrnCurrentStock.StockOutQty,0) - isnull(CancQty,0)
	from	( Select isnull(sum(TrnStockOutDtl.CancelQty),0) as CancQty, TrnStockInDtl.CompanyID, TrnStockInDtl.BranchID, TrnStockInDtl.ProductID, TrnStockInDtl.StockPointID
		  from	TrnStockOutDtl, TrnStockInDtl
		  Where	TrnStockOutDtl.OutDocType = 'DVN'
		  and	TrnStockOutDtl.OutDocNo = @DVNNo
		  and	TrnStockInDtl.StockInDtlID = TrnStockOutDtl.StockInDtlID
		  Group by TrnStockInDtl.CompanyID, TrnStockInDtl.BranchID, TrnStockInDtl.ProductID, TrnStockInDtl.StockPointID
		) as X 
	 Where	TrnCurrentStock.CompanyID =  X.CompanyID
	  and	TrnCurrentStock.BranchID =  X.BranchID
	  and	TrnCurrentStock.FinYearID = @FinYearID
	  and	TrnCurrentStock.ProductID =  X.ProductID
	  and	TrnCurrentStock.StockPointID =  X.StockPointID

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Update 	TrnProforrmaInvoiceDtl
	set	UtilQty = isnull(TrnStockInDtl.UtilQty,0) - isnull(TrnStockOutDtl.CancelQty,0)
	from	TrnDeliveryNoteDtl, TrnDeliveryNoteHdr
	Where	TrnDeliveryNoteDtl.DeliveryNoteNo = TrnDeliveryNoteHdr.DeliveryNoteNo
	and	TrnDeliveryNoteHdr.ProforrmaInvoiceNo = TrnProforrmaInvoiceDtl.ProforrmaInvoiceNo
	and	TrnProforrmaInvoiceDtl.ProductID = TrnDeliveryNoteDtl.ProductID
	and	TrnProforrmaInvoiceDtl.DeliveryNoteNo = @DVNNo

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End			
	
	Select 	@StoreQty=sum(ProductQty),
		@OutQty=sum(UtilQty)
	from TrnProformaInvoiceDtl Where ProformaInvNo=@ProformaInvNo
	Group By ProformaInvNo

	IF @StoreQty=@OutQty
	Begin
		Update TrnProformaInvoiceHdr Set ProformaInvStatus='UTL' Where ProformaInvNo=@ProformaInvNo
	End
	Else
	Begin
		Update TrnProformaInvoiceHdr Set ProformaInvStatus='PUT' Where ProformaInvNo=@ProformaInvNo
	End

	-- Inserting Values into Log Table	
	Set @LogMsg= 'Cancel Delivery Note' + @DVNNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @DVNNo  

 END
GO
/****** Object:  StoredProcedure [dbo].[rptGRNDtl_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[rptGRNDtl_Select]
(
	 @GRNNo  varchar(15)
)
 AS

BEGIN
		SELECT  TrnGRNDtl.GRNDtlID, TrnGRNDtl.GRNNo, TrnGRNDtl.ProductID, ISNULL(TrnPurchaseOrderDtl.ProductQty, 0) 
                      	- ISNULL(TrnPurchaseOrderDtl.UtilQty, 0) + ISNULL(TrnGRNDtl.ReceiptQty, 0) AS Qty, TrnGRNDtl.ReceiptQty RcptQty, 
                      	MstProduct.ProductName, MstProduct.ProductUOM as Unit, TrnPurchaseOrderDtl.ProductRate as rate
		FROM  TrnGRNDtl INNER JOIN
		TrnPurchaseOrderDtl ON TrnGRNDtl.ProductID = TrnPurchaseOrderDtl.ProductID INNER JOIN
		TrnGRNHdr ON TrnPurchaseOrderDtl.PurchaseOrderNo = TrnGRNHdr.PurchaseOrderNo AND 
		TrnGRNDtl.GRNNo = TrnGRNHdr.GRNNo INNER JOIN
		MstProduct ON TrnGRNDtl.ProductID = MstProduct.ProductID
		Where  TrnGRNHdr.GRNNo=@GRNNo
END
GO
/****** Object:  StoredProcedure [dbo].[rptDeliveryNoteHeader_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[rptDeliveryNoteHeader_Select]
(
	@DeliveryNoteNo varchar(15)
)
 AS

Begin
	SELECT TrnDeliveryNoteHdr.DeliveryNoteNo,TrnDeliveryNoteHdr.DeliveryNoteDate, TrnDeliveryNoteHdr.ProformaInvNo, TrnDeliveryNoteHdr.CustomerID, 
	TrnDeliveryNoteHdr.ShippingAddress, TrnDeliveryNoteHdr.ShippingCity, TrnDeliveryNoteHdr.ShippingPin, 
	TrnDeliveryNoteHdr.DespatchMode, TrnDeliveryNoteHdr.DeliveredBy, TrnDeliveryNoteHdr.VehicleNo, TrnDeliveryNoteHdr.Remarks, 
	MstCustomer.CustomerName
	FROM TrnDeliveryNoteHdr INNER JOIN
	MstCustomer ON TrnDeliveryNoteHdr.CustomerID = MstCustomer.CustomerID
	Where TrnDeliveryNoteHdr.DeliveryNoteNo=@DeliveryNoteNo


End
GO
/****** Object:  StoredProcedure [dbo].[rptDeliveryNoteDtl_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rptDeliveryNoteDtl_Select]
(
	@DeliveryNoteNo varchar(15)
)
AS

Begin
	SELECT TrnDeliveryNoteDtl.DeliveryNoteNo,TrnDeliveryNoteDtl.DeliveryNoteDtlID,TrnDeliveryNoteDtl.ProductID, MstProduct.ProductName,
	MstProduct.ProductUOM as Unit,TrnDeliveryNoteDtl.Rate,  
	TrnDeliveryNoteDtl.BalanceProInvQty as BalQty, 
	TrnDeliveryNoteDtl.DeliveryQty
	FROM TrnDeliveryNoteDtl INNER JOIN
	MstProduct ON TrnDeliveryNoteDtl.ProductID = MstProduct.ProductID
	Where TrnDeliveryNoteDtl.DeliveryNoteNo=@DeliveryNoteNo
End
GO
/****** Object:  StoredProcedure [dbo].[TrnInvoice_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrnInvoice_Select]
(
	@CompanyID		Varchar(2),
	@BranchID		Varchar(3),
	@FinYrID		varchar(4)
)
as
	Begin
		SELECT	InvoiceNo FROM TrnInvoiceHdr 
		where	InvoiceType='SALES' 
		And	InvoiceStatus not in ('CAN')
		And	CompanyID=@CompanyID
		And	BranchID=@BranchID
		And	FinYearID=@FinYrID
	End
GO
/****** Object:  Table [dbo].[TrnInvoiceServiceDtl]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnInvoiceServiceDtl](
	[InvoiceServiceDtlID] [varchar](18) NOT NULL,
	[Particulars] [varchar](100) NULL,
	[InvoiceNo] [varchar](15) NOT NULL,
	[ServiceItemID] [varchar](10) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[InvoiceQty] [decimal](18, 3) NOT NULL,
	[ServiceAmt] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TrnInvoiceServiceDtl] PRIMARY KEY CLUSTERED 
(
	[InvoiceServiceDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnInvoiceServiceDtl] UNIQUE NONCLUSTERED 
(
	[InvoiceNo] ASC,
	[ServiceItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnInvoiceServiceDtl] ([InvoiceServiceDtlID], [Particulars], [InvoiceNo], [ServiceItemID], [Rate], [InvoiceQty], [ServiceAmt]) VALUES (N'010017777000002001', N'asdas', N'010017777000002', N'0100100001', CAST(11303.47 AS Decimal(18, 2)), CAST(1.000 AS Decimal(18, 3)), CAST(11303.47 AS Decimal(18, 2)))
INSERT [dbo].[TrnInvoiceServiceDtl] ([InvoiceServiceDtlID], [Particulars], [InvoiceNo], [ServiceItemID], [Rate], [InvoiceQty], [ServiceAmt]) VALUES (N'010017777000002002', N'Indranil''s Testing', N'010017777000002', N'0100100003', CAST(569.23 AS Decimal(18, 2)), CAST(2.000 AS Decimal(18, 3)), CAST(1138.46 AS Decimal(18, 2)))
/****** Object:  StoredProcedure [dbo].[TrnServiceInvoice_Update]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

sp_help TrnInvoiceHdr

select * from TrnInvoiceHdr


sp_help TrnInvoiceServiceDtl

sp_help TrnInvoiceHdr

tbl.Columns.Add("ServiceItemID");
tbl.Columns.Add("Particulars");
tbl.Columns.Add("Rate");
tbl.Columns.Add("InvQty");
tbl.Columns.Add("ServiceAmt");


<NewDataSet>
  <ServiceInvoiceDetails>
    <ServiceItemID>0100100001</ServiceItemID>
    <Particulars>asdas</Particulars>
    <Rate>11303.47</Rate>
    <InvQty>1.000</InvQty>
    <ServiceAmt>11303.47</ServiceAmt>
  </ServiceInvoiceDetails>
  <ServiceInvoiceDetails>
    <ServiceItemID>0100100003</ServiceItemID>
    <Particulars>asdas</Particulars>
    <Rate>52.50</Rate>
    <InvQty>2.000</InvQty>
    <ServiceAmt>105.00</ServiceAmt>
  </ServiceInvoiceDetails>
</NewDataSet>


Delete from TrnInvoiceServiceDtl
Where 	InvoiceNo = '010017777000002'
and ServiceItemID not in (Select ServiceItemID
	 from OPENXML (@XMLFormat, '/NewDataSet/ServiceInvoiceDetails', 2)
	 with (	ServiceItemID  varchar(10)))


*/


CREATE PROCEDURE [dbo].[TrnServiceInvoice_Update]

	@InvNo						Varchar(15),
	@InvDate					Varchar(10),
	@JobNo						Varchar(15),
	@CustomerID					Varchar(10),
	@CustomerName				Varchar(50),
	@BillingAddress				Varchar(200),
	@BillingCity				Varchar(50),
	@BillingPin					Varchar(15),
	@Remarks  					Varchar(200),

	@VATRate					Decimal(18,2),
	@VATAmt						Decimal(18,2),
	@ProductTotal				Decimal(18,2),
	@SIInvAmt					Decimal(18,2),

	@DetailXml					Ntext,
	

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)

As


	Declare @intCntr as int
	Declare @logMsg as Varchar(200)
	Declare @CurDatetime as datetime
	Declare @intError as integer
	Declare @NewInvoiceNo as varchar(15)
	Declare @NewInvoiceServiceDtlID as varchar(18)
	Declare @AutoGenPrefix as varchar(9)
	
	Declare @XMLFormat Int
	Declare @ServiceItemID as Varchar(10)
	Declare @Particulars as varchar(100)
	Declare @Rate as Decimal(18,2)
	Declare @InvQty as Decimal(18,3)
	Declare @ServiceAmt as Decimal(18,2)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here

	IF @InvDate=''
	BEGIN
	        select 'ERROR : Please give Invoice Date'
	        return
	END

	IF @JobNo=''
	BEGIN
	        select 'ERROR : Please give Job No.'
	        return
	END

	IF @JobNo<>''
	BEGIN
		select  @intcntr = count(*)
		from   	TrnJobHdr
		where   (JobNo = @JobNo)
		And		CompanyID=CompanyID
		And		BranchID=@BranchID
		And		FinYearID=@FinYearID

		if @intcntr  <= 0
		begin
		    select 'ERROR : Invalid Job No.'
			return
		end
	END

	IF @CustomerID=''
	BEGIN
	        select 'ERROR : Please Give Customer ID'
	        return
	END

	IF @CustomerID <>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstCustomer
		where   (CustomerID = @CustomerID)
		And		CompanyID=@CompanyID
		And		BranchID=@BranchID

		if @intcntr  <= 0
		begin
		    select 'ERROR : Invalid Customer ID'
			return
		end
	END

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml

	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select ServiceItemID,Particulars,Rate,InvQty,ServiceAmt
	From Openxml (@XMLFormat, '/NewDataSet/ServiceInvoiceDetails', 2)
	With 
		(

			ServiceItemID Varchar(10),
			Particulars Varchar(100),
			Rate decimal(18,2),
			InvQty decimal(18,3),
			ServiceAmt decimal(18,2)

		)


	BEGIN TRANSACTION

	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnInvoiceHdr' , 'InvoiceNo' , 15 , @AutoGenPrefix , @NewInvoiceNo output


	Update	TrnInvoiceHdr
	Set		InvoiceDate=Convert(Datetime,@InvDate,103),
			JobNo=@JobNo,
			CustomerID=@CustomerID,
			CustomerName=@CustomerName,
			BillingAddress=@BillingAddress,
			BillingCity=@BillingCity,
			BillingPin=@BillingPin,
			Remarks=@Remarks,
			ProductTotalAmt=@ProductTotal,
			VATRate=@VATRate,
			VATAmt=@VATAmt,
			InvoiceAmt=@SIInvAmt,
			CompanyID=@CompanyID,
			BranchID=@BranchID,
			FinYearID=@FinYearID
	Where	InvoiceNo=@InvNo

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	/*Delete from TrnInvoiceServiceDtl
	Where 	InvoiceNo = @InvNo
	and ServiceItemID not in 
			(Select ServiceItemID
			 from OPENXML (@XMLFormat, '/NewDataSet/ServiceInvoiceDetails', 2)
			 with 
					(
						ServiceItemID  varchar(10)
			
					)
			)*/
	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ServiceItemID,@Particulars,@Rate,@InvQty,@ServiceAmt

	While (@@Fetch_Status=0)
	Begin

		IF @ServiceItemID = ''
		Begin
			select 'ERROR : Please give Service Item ID'
			return
		END

		IF @ServiceItemID <> ''
		Begin
			select  @intcntr = count(*)
			from   	MstServiceItem
			where   (ServiceItemID = @ServiceItemID)
			And		CompanyID=@CompanyID
			And		BranchID=@BranchID
	
			if @intcntr  <= 0
			begin
			         	select 'ERROR : Invalid Service Item ID'
				return
			end
		END

		--select * from TrnInvoiceServiceDtl
		--sp_help TrnInvoiceServiceDtl
		Select		@intcntr = count(*)
		From   		TrnInvoiceServiceDtl
		Inner Join	TrnInvoiceHdr TIH On TIH.InvoiceNo=TrnInvoiceServiceDtl.InvoiceNo
		And			CompanyID=@CompanyID
		And			BranchID=@BranchID
		And			FinYearID=@FinYearID
		Where		TrnInvoiceServiceDtl.InvoiceNo = @InvNo
		

		IF @intcntr  <= 0
			Begin

				exec  AutoGenerateID 'TrnInvoiceServiceDtl' , 'InvoiceServiceDtlID' , 18  , @InvNo,@NewInvoiceServiceDtlID output

				INSERT TrnInvoiceServiceDtl
				(InvoiceServiceDtlID,Particulars,InvoiceNo,ServiceItemID,Rate,InvoiceQty,ServiceAmt)
				Values
				(@NewInvoiceServiceDtlID,@Particulars,@InvNo,@ServiceItemID,@Rate,@InvQty,@ServiceAmt)
			End
		Else
			Begin
				Update	TrnInvoiceServiceDtl
				Set 	Particulars=@Particulars,
						Rate=@Rate,
						InvoiceQty=@InvQty,
						ServiceAmt=@ServiceAmt
				Where	InvoiceNo=@InvNo
				And		ServiceItemID=@ServiceItemID
			End
		

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Fetch Next From CurDetailRecord Into @ServiceItemID,@Particulars,@Rate,@InvQty,@ServiceAmt
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table	
	Set @LogMsg= 'Update Service Invoice' + @InvNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @InvNo
GO
/****** Object:  StoredProcedure [dbo].[TrnServiceInvoice_Insert]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
sp_help TrnInvoiceHdr

select * from TrnInvoiceHdr


sp_help TrnInvoiceServiceDtl

*/

CREATE procedure [dbo].[TrnServiceInvoice_Insert]

	@InvNo						Varchar(15),
	@InvDate					Varchar(10),
	@JobNo						Varchar(15),
	@CustomerID					Varchar(10),
	@CustomerName				Varchar(50),
	@BillingAddress				Varchar(200),
	@BillingCity				Varchar(50),
	@BillingPin					Varchar(15),
	@Remarks  					Varchar(200),

	@VATRate					Decimal(18,2),
	@VATAmt						Decimal(18,2),
	@ProductTotal				Decimal(18,2),
	@SIInvAmt					Decimal(18,2),

	@DetailXml					Ntext,
	

	@LogUserId					Varchar(12),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4)

As



Begin

	Declare			@intCntr					as int
	Declare			@logMsg						as Varchar(200)
	Declare			@CurDatetime				as datetime	
	Declare			@intError					as integer
	Declare			@NewInvoiceNo				as Varchar(15)
	Declare			@NewInvoiceServiceDtlID		as Varchar(18)
	Declare			@AutoGenPrefix				as Varchar(9)

	Declare			@XMLFormat	Int

	Declare			@ServiceItemID		Varchar(10)
	Declare			@Particulars		Varchar(50)
	Declare			@Rate				Decimal(18,2)
	Declare			@InvQty				Decimal(18,3)
	Declare			@ServiceAmt			Decimal(18,2)

	-- Setting Counter to zero
	set @intCntr = 0

	--- Validation start for Master part from here	
	-- Checking the Primary key violation	

	select  @intcntr = count(*)
	from   	TrnInvoiceHdr
	where   (InvoiceNo = @InvNo)

	if @intcntr  > 0
	begin
	        select 'ERROR : Invoice No already exists'
	        return
	end

	IF @InvDate=''
	BEGIN
	        select 'ERROR : Invoice date can not be empty'
	        return
	END

	IF @CustomerID=''
	BEGIN
	        select 'ERROR : Give CustomerID'
	        return
	END

	IF @CustomerID<>''
	BEGIN
		select  @intcntr = count(*)
		from   	MstCustomer
		where   (CustomerID = @CustomerID)

		if @intcntr  <= 0
		begin
         	select 'ERROR : Invalid Customer ID'
			return
		end
	END

	IF @CustomerName=''
	BEGIN
	        select 'ERROR : Give Customer Name'
	        return
	END

	If @SIInvAmt <= 0
		Begin
			Select 'ERROR : Service Invoice Amount can not be empty'
	        return
		End

	If @CompanyId = ''
		Begin
			Select 'ERROR : Please give the Company'
	        return
		End

	If @BranchId = ''
		Begin
			Select 'ERROR : Please give the Branch'
	        return
		End

	If @FinYearID = ''
		Begin
			Select 'ERROR : Please give the Financial Year'
	        return
		End

	--- Validation end for Master part from here

	--- Validation start for detail part from here
	--Prepare input values as an XML documnet


	Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml


	-- Create Cursor from XML Table

	Declare CurDetailRecord
	Cursor For
	Select ServiceItemID,Particulars,Rate,InvQty,ServiceAmt
	From Openxml (@XMLFormat, '/NewDataSet/ServiceInvoiceDetails', 2)
	With 
		(
			ServiceItemID	Varchar(10),
			Particulars		Varchar(50),
			Rate			decimal(18,2),
			InvQty			decimal(18,3),
			ServiceAmt		decimal(18,2)
		)


	BEGIN TRANSACTION   

	-- Auto Generate New ProformaInvoice No
	set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID
	exec  AutoGenerateID 'TrnInvoiceHdr' , 'InvoiceNo' , 15 , @AutoGenPrefix , @NewInvoiceNo output

	Insert Into TrnInvoiceHdr
	(InvoiceNo,InvoiceDate,InvoiceType,JobNo,CustomerID,CustomerName,BillingAddress,BillingCity,BillingPin,
	Remarks,ProductTotalAmt,VATRate,VATAmt,InvoiceAmt,InvoiceStatus,CompanyID,BranchID,FinYearID)
	Values
	(@NewInvoiceNo,Convert(Datetime,@InvDate,103),'SERVICE',@JobNo,@CustomerID,@CustomerName,@BillingAddress,
	@BillingCity,@BillingPin,@Remarks,@ProductTotal,@VATRate,@VATAmt,@SIInvAmt,'NUT',@CompanyID,@BranchID,@FinYearID)

	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Open CurDetailRecord
	Fetch Next From CurDetailRecord Into @ServiceItemID,@Particulars,@Rate,@InvQty,@ServiceAmt

	While (@@Fetch_Status=0)
	Begin

		IF @ServiceItemID=''
		Begin
			select 'ERROR : Service Item id can not be empty'
			return
		END

		IF @ServiceItemID <>''
		Begin
			select  @intcntr = count(*)
			from   	MstServiceItem
			where   (ServiceItemID = @ServiceItemID)
	
			if @intcntr  <= 0
			begin
			         select 'ERROR : Invalid Service ItemID'
				return
			end
		END

		IF @Rate <= 0 
		Begin
			select 'ERROR : Rate can not be empty'
			return
		END

		IF @InvQty <= 0 
		Begin
			select 'ERROR : Quantity can not be empty'
			return
		END

		IF @ServiceAmt <= 0
		Begin
			select 'ERROR : Amount can not be empty'
			return
		END
	
		-- Auto Generate New PurchaseOrderDtlID
		exec  AutoGenerateID 'TrnInvoiceServiceDtl' ,'InvoiceServiceDtlID',18,@NewInvoiceNo,@NewInvoiceServiceDtlID output

		INSERT TrnInvoiceServiceDtl(InvoiceServiceDtlID,Particulars,InvoiceNo,ServiceItemID,Rate,
		InvoiceQty,ServiceAmt)
		Values (@NewInvoiceServiceDtlID,@Particulars,@NewInvoiceNo,@ServiceItemID,@Rate,@InvQty,@ServiceAmt)	

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End

	Fetch Next From CurDetailRecord Into @ServiceItemID,@Particulars,@Rate,@InvQty,@ServiceAmt
	End
	
	Close CurDetailRecord
	Deallocate CurDetailRecord

	--- Validation end for detail part from here


	-- Inserting Values into Log Table
	Set @LogMsg= 'Insert Service Invoice' + @NewInvoiceNo
	Set @CurDateTime = getdate()
	Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End
	
	COMMIT TRANSACTION
	select @NewInvoiceNo
  
END
GO
/****** Object:  Table [dbo].[TrnInvoiceSaleDtl]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnInvoiceSaleDtl](
	[InvoiceSaleDtlID] [varchar](18) NOT NULL,
	[InvoiceNo] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[InvoiceQty] [decimal](18, 3) NOT NULL,
	[ProductAmt] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TrnInvoiceSaleDtl] PRIMARY KEY CLUSTERED 
(
	[InvoiceSaleDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnInvoiceSaleDtl] UNIQUE NONCLUSTERED 
(
	[InvoiceNo] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnInvoiceSaleDtl] ([InvoiceSaleDtlID], [InvoiceNo], [ProductID], [Rate], [InvoiceQty], [ProductAmt]) VALUES (N'010017777000001001', N'010017777000001', N'0100100004', CAST(900.00 AS Decimal(18, 2)), CAST(2.000 AS Decimal(18, 3)), CAST(1800.00 AS Decimal(18, 2)))
/****** Object:  StoredProcedure [dbo].[TrnSalesInvoice_Insert]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 25/06/2007  
/*  
<NewDataSet>
 	<InvoiceDetail>
 		<ProductID>0300700001</ProductID>
 		<Unit>KG</Unit>
 		<Rate>15.00</Rate>
 		<Qty>2.000</Qty>
 		<Amount>30.00000</Amount>
 	</InvoiceDetail>
</NewDataSet>
*/  
  
  
CREATE PROCEDURE [dbo].[TrnSalesInvoice_Insert]  
(  
	@SalesInvNo  		as varchar(15)=null,  
	@SalesInvDate  		as  varchar(10),  
	@DeliveryNo  		as varchar(15)=null, 
	@BillingAddress 	as varchar(200)=null, 
	@BillingCity 		as varchar(50)=null, 
	@BillingPin 		as varchar(15)=null, 
	@Remarks 		as varchar(200)=null, 
	@SubVATRate   		as Decimal(18,3),  
	@SubVATAmt   		as Decimal(18,3),  
	@ProductTotalAmt  	as Decimal(18,3),  
	@InvoiceAmt	  	as Decimal(18,3),  
	@DetailXml   		as NTEXT,  
	
	@LogUserId        	as varchar(12),  
	@CompanyId      	as varchar(2),  
	@BranchId           	as varchar(3),  
	@FinYearID          	as varchar(4)  
)  
As   
   
Begin  
 Declare @intCntr as int  
 Declare @logMsg as Varchar(200)  
 Declare @CurDatetime as datetime   
 Declare @intError as integer  

 Declare @NewInvoiceNo as varchar(15)  
 Declare @NewInvoiceSaleDtlID as varchar(18)  
 Declare @AutoGenPrefix as varchar(9)  
  
 Declare @XMLFormat Int  

 Declare @ProductID as Varchar(10)  
 Declare @Unit as varchar(50)  
 Declare @Rate as Decimal(18,2)  
 Declare @Qty as Decimal(18,3)  
 Declare @Amount as Decimal(18,2)  
  
 Declare @DeliveryNoteDate  as datetime  
 Declare @CustomerID  as Varchar(10)
 Declare @CustomerName  as Varchar(100)
 -- Setting Counter to zero  
 set @intCntr = 0  
  
 --- Validation start for Master part from here   
 -- Checking the Primary key violation   

	 IF isnull(@DeliveryNo,'')=''  
	 BEGIN  
	         select 'Error : Delivery no can not be empty'  
	         return  
	 END  
  
	select  @intcntr =count(*),@DeliveryNoteDate=TrnDeliveryNoteHdr.DeliveryNoteDate,
	@CustomerID=TrnDeliveryNoteHdr.CustomerID,@CustomerName=mstCustomer.CustomerName
	from TrnDeliveryNoteHdr,mstCustomer
	Where TrnDeliveryNoteHdr.CustomerID=mstCustomer.CustomerID and 
	TrnDeliveryNoteHdr.DeliveryNoteNo=@DeliveryNo and 
	TrnDeliveryNoteHdr.DeliveryNoteStatus in ('NUT')
	group by TrnDeliveryNoteHdr.DeliveryNoteDate,
	TrnDeliveryNoteHdr.CustomerID,mstCustomer.CustomerName

  
	 if @intcntr  <= 0  
	 begin  
	         select 'Error : This delivery note does not exists'  
	         return  
	 end  
  
	 IF isnull(@SalesInvDate,'')=''  
	 BEGIN  
	         select 'Error : Sales invoice date can not be empty'  
	         return  
	 END  

	 IF convert(varchar,convert(datetime,@SalesInvDate,103),112) < convert(varchar,@DeliveryNoteDate,112)  
	 BEGIN  
	         select 'Error : Sales invoice date can not be less than delivery note Date'  
	         return  
	 END  
	  
 --- Validation end for Master part from here  
  
 --- Validation start for detail part from here  
 --Prepare input values as an XML documnet  
  
  
 Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml  
  
 -- Create Cursor from XML Table  
  
 Declare CurDetailRecord  
 Cursor For  
 Select productid,unit,rate,qty,amount  
 From Openxml (@XMLFormat, '/NewDataSet/InvoiceDetail', 2)  
 With   
  (  
	   ProductID Varchar(10),  
	   Unit Varchar(50),  
	   Rate decimal(18,2),  
	   Qty decimal(18,3),  
	   Amount decimal(18,2)  
  )  
  
  
 BEGIN TRANSACTION     
  
 -- Auto Generate New PurchaseOrderNo  
 set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID  
 exec  AutoGenerateID 'TrnInvoiceHdr' , 'InvoiceNo' , 15 , @AutoGenPrefix , @NewInvoiceNo output       
  
 Insert Into TrnInvoiceHdr  
 (
	InvoiceNo,
	InvoiceDate,
	InvoiceType,
	DeliveryNoteNo,
	JobNo,
	CustomerID,
	CustomerName,
	BillingAddress,
	BillingCity,
	BillingPin,
	Remarks,
	ProductTotalAmt,
	VATRate,
	VATAmt,
	InvoiceAmt,
	InvoiceStatus,
	CancelDate,
	CancelReason,
	CompanyID,
	BranchID,
	FinYearID
)  
Values  
(
	@NewInvoiceNo,
	Convert(datetime,@SalesInvDate,103),
	'SALES',
	@DeliveryNo,
	null,
	@CustomerID,
	@CustomerName,
	@BillingAddress,
	@BillingCity,
	@BillingPin,
	@Remarks,  
	@ProductTotalAmt,
	@SubVATRate,
	@SubVATAmt,
	@InvoiceAmt,
	'NUT',
	null,
	null,
	@CompanyID,
	@BranchID,
	@FinYearID
)  
  
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
 
 Update TrnDeliveryNoteHdr Set DeliveryNoteStatus='UTL'
 Where DeliveryNoteNo=@DeliveryNo

 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  

 Open CurDetailRecord  
 Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount  
  
 While (@@Fetch_Status=0)  
 Begin  
  
	  IF isnull(@ProductID,'')=''  
	  Begin  
	   select 'Error : Product id can not be empty'  
	   return  
	  END  
	  
	  IF isnull(@ProductID,'')<>''  
	  Begin  
	   select  @intcntr = count(*)  
	   from    MstProduct  
	   where   (ProductID = @ProductID)  
	   
	   if @intcntr  <= 0  
	   begin  
	          select 'Error : Invalid product id'  
	   return  
	   end  
	  END  
	  
	  IF isnull(@Unit,'')=''   
	  Begin  
	   select 'Error : Unit can not be empty'  
	   return  
	  END  
	  
	  IF isnull(@Rate,0)=0   
	  Begin  
	   select 'Error : Rate can not be empty'  
	   return  
	  END  

	  IF isnull(@Qty,0)=0   
	  Begin  
	   select 'Error : Qty can not be empty'  
	   return  
	  END  

	  IF isnull(@Amount,0)=0   
	  Begin  
	   select 'Error : Amount can not be empty'  
	   return  
	  END  
  
  -- Auto Generate New PurchaseOrderDtlID  
	exec  AutoGenerateID 'TrnInvoiceSaleDtl','InvoiceSaleDtlID',18,@NewInvoiceNo,@NewInvoiceSaleDtlID output    
  
	INSERT TrnInvoiceSaleDtl  
	(
		InvoiceSaleDtlID,
		InvoiceNo,
		ProductID,
		Rate, 
		InvoiceQty,
		ProductAmt
	)  
	Values 
	(
		@NewInvoiceSaleDtlID,
		@NewInvoiceNo,
		@ProductID,
		@Rate,
		@Qty,
		@Amount
	)   
  
	select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
  
	Fetch Next From CurDetailRecord Into @ProductID,@Unit,@Rate,@Qty,@Amount  
 End  
   
 Close CurDetailRecord  
 Deallocate CurDetailRecord  
  
 --- Validation end for detail part from here  
  
  
 -- Inserting Values into Log Table   
 Set @LogMsg= 'Insert Sales Invoice' + @NewInvoiceNo  
 Set @CurDateTime = getdate()  
 Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg  
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
   
 COMMIT TRANSACTION  
 select @NewInvoiceNo  
    
 END


select * from TrnInvoiceHdr
GO
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNoteNoWiseDtl_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE procedure [dbo].[TrnDeliveryNoteNoWiseDtl_Select]
(
	@DeliveryNoteNo	Varchar(15)
)
as

Begin
	SELECT MstCustomer.CustomerName,MstCustomer.BillingAddress,MstCustomer.BillingCity, 
	MstCustomer.BillingPin FROM MstCustomer INNER JOIN
	TrnDeliveryNoteHdr ON MstCustomer.CustomerID = TrnDeliveryNoteHdr.CustomerID
	Where  TrnDeliveryNoteHdr.DeliveryNoteNo=@DeliveryNoteNo


	SELECT MstProduct.ProductID,MstProduct.ProductName,MstProduct.ProductUOM as Unit, 
	MstProductRate.UnitSaleRate as Rate,TrnDeliveryNoteDtl.DeliveryQty Qty,
	ROUND((isnull(MstProductRate.UnitSaleRate,0)*isnull(TrnDeliveryNoteDtl.DeliveryQty,0)),2) as Amount
	FROM MstProduct INNER JOIN
	TrnDeliveryNoteDtl ON MstProduct.ProductID = TrnDeliveryNoteDtl.ProductID 
	INNER JOIN TrnDeliveryNoteHdr ON TrnDeliveryNoteDtl.DeliveryNoteNo = TrnDeliveryNoteHdr.DeliveryNoteNo 
	INNER JOIN MstProductRate ON MstProduct.ProductID = MstProductRate.ProductID
	Where  TrnDeliveryNoteHdr.DeliveryNoteNo=@DeliveryNoteNo

End
GO
/****** Object:  Table [dbo].[TrnDeliveryNoteLiftDtl]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnDeliveryNoteLiftDtl](
	[DeliveryNoteLiftDtlID] [varchar](18) NOT NULL,
	[DeliveryNoteDtlID] [varchar](18) NOT NULL,
	[DeliveryNoteNo] [varchar](15) NOT NULL,
	[StockInDtlID] [varchar](15) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[BalanceStockInQty] [decimal](18, 3) NOT NULL,
	[LiftQty] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_TrnDeliveryNoteLiftDtl] PRIMARY KEY CLUSTERED 
(
	[DeliveryNoteLiftDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TrnDeliveryNoteLiftDtl] UNIQUE NONCLUSTERED 
(
	[DeliveryNoteDtlID] ASC,
	[StockInDtlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TrnDeliveryNoteLiftDtl] ([DeliveryNoteLiftDtlID], [DeliveryNoteDtlID], [DeliveryNoteNo], [StockInDtlID], [ProductID], [BalanceStockInQty], [LiftQty]) VALUES (N'010017777000001001', N'010017777000001001', N'010017777000001', N'010017777000001', N'0100100004', CAST(5.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)))
INSERT [dbo].[TrnDeliveryNoteLiftDtl] ([DeliveryNoteLiftDtlID], [DeliveryNoteDtlID], [DeliveryNoteNo], [StockInDtlID], [ProductID], [BalanceStockInQty], [LiftQty]) VALUES (N'010017777000001002', N'010017777000001001', N'010017777000001', N'010017777000002', N'0100100004', CAST(2.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)))
/****** Object:  StoredProcedure [dbo].[TrnPurchaseReturn_Insert]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 29/06/2007  

/*  
<NewDataSet>  
	<PurchaseReturn>  
		  <ProductID>0300700001</ProductID>  
		  <Rate>500.00</Rate>  
		  <GRNQty>5.000</GRNQty>  
		  <ReturnQty>2</ReturnQty>  
		  <Amount>2</Amount>  
	</PurchaseReturn>  
</NewDataSet>  

*/  
  
  
CREATE PROCEDURE [dbo].[TrnPurchaseReturn_Insert]  
(  
	 @PRetNo	   	as varchar(15)=null,  
	 @PRetDate	   	as varchar(10),  
	 @GRNNo		 as varchar(15)=null,  
	 @ShippingAddress  	as varchar(200)=null,  
	 @ShippingCity   	as varchar(50) = null,  
	 @ShippingPin   		as varchar(15) = null,  
	 @ChallanNo	   	as varchar(30) = null,  
	 @ChallanDate	   	as varchar(10) = null,  
	 @ModeofDespatch  	as varchar(20),  
	 @VehicleNo     		as varchar(30) = null,  
	 @DeliveredBy     	as varchar(50) = null,  
	 @Remarks     		as varchar(200) = null,  
	 @VatRate		as Decimal(18,3)=0,
	 @VatAmt		as Decimal(18,3)=0,
	 @SubTotal		as Decimal(18,3)=0,
	 @InvoiceAmt		as Decimal(18,3)=0,
	 @DetailXml   		as NTEXT,  
	
	 @LogUserId        	as varchar(12),  
	 @CompanyId      	as varchar(2),  
	 @BranchId           	as varchar(3),  
	 @FinYearID          	as varchar(4)  
)  

As   
   
Begin  
  
 Declare @intCntr 		as int  
 Declare @logMsg 		as Varchar(200)  
 Declare @CurDatetime 		as datetime   
 Declare @intError 		as integer  
  
 Declare @NewPRetNo 		as varchar(15)  
 Declare @NewPRetNoDtlID	as varchar(18)  
 Declare @NewPRetNoLiftDtlID 	as varchar(18)  
 Declare @NewStockOutID 	as varchar(15)  
 Declare @SupplierID  		as Varchar(10)  
 Declare @GRNDate	  	as datetime  
  
 Declare @AutoGenPrefix 	as varchar(9)  
  
 Declare @XMLFormat Int  
  
 Declare @ProductID 		as Varchar(10)  
 Declare @Rate 			as Decimal(18,3)  
 Declare @GRNQty 		as Decimal(18,2)  
 Declare @RetQty 		as Decimal(18,3)  
 Declare @Amount 		as Decimal(18,3)    
  
 Declare @StockInDtlID 		as varchar(15)  
 Declare @InDocType 		as varchar(3)  
 Declare @InDocNo 		as varchar(20)  
 Declare @InDocDate 		as varchar(10)  
 Declare @StockPointID 		as varchar(10)  
 Declare @StockinQty 		as Decimal(18,3)  
 Declare @UtilQty 		as Decimal(18,3)  
  
 Declare @tmpDelQty 		as Decimal(18,3)  
 Declare @tmpLiftQty 		as Decimal(18,3)  
  
 Declare @StoreQty 		as Decimal(18,3)  
 Declare @OutQty 		as Decimal(18,3)  
  
 -- Setting Counter to zero  
 set @intCntr = 0  
  
 --- Validation start for Master part from here   
 -- Checking the Primary key violation   
  
	IF isnull(@GRNNo,'')=''  
	BEGIN  
	        select 'Error : GRN No can not be empty'  
	        return  
	END  
	  
	Select @intcntr = count(*),  
	@GRNDate=GRNDate,  
	@SupplierID=SupplierID  
	from TrnGRNHdr  
	where (GRNNo = @GRNNo and  GRNStatus in ('NUT'))  
	Group By GRNDate,SupplierID  
  
	 if @intcntr  <= 0  
	 begin  
	         select 'Error : Invalid GRN no or GRN no Utilised/Cancel/Close'  
	         return  
	 end  
	  
	 IF isnull(@PRetDate,'')=''  
	 BEGIN  
	         select 'Error : Purchase return date can not be empty'  
	         return  
	 END  
	   
	 IF convert(varchar,convert(datetime,@PRetDate,103),112) < convert(varchar,@GRNDate,112)  
	 BEGIN  
	         select 'Error : Purchase return date can not be less than GRN Date'  
	         return  
	 END  
	  
	 IF isnull(@ShippingAddress,'')=''  
	 BEGIN  
	         select 'Error : Shipping Address can not be empty'  
	         return  
	 END  
  
	 Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml  
  
---------Create Cursor from XML Table  
  
	 Declare CurDetailRecord  
	 Cursor For  
	 Select ProductID,Rate,GRNQty,ReturnQty,Amount
	 From Openxml (@XMLFormat, '/NewDataSet/PurchaseReturn', 2)  
	 With   
	  (  
	   ProductID Varchar(10),  
	   Rate Decimal(18,3),  
	   GRNQty Decimal(18,3),  
	   ReturnQty Decimal(18,3),  
	   Amount decimal(18,2)  
	  )  
  
	 BEGIN TRANSACTION     
	  
	 -- Auto Generate New GRNNo  
	 set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID  
	 exec  AutoGenerateID 'TrnDeliveryNoteHdr' , 'DeliveryNoteNo' , 15 , @AutoGenPrefix , @NewPRetNo output       
	  
	 Insert Into TrnDeliveryNoteHdr  
	 (  
	  DeliveryNoteNo,  
	  DeliveryNoteDate,  
	  PurchaseReturnTag,  
	  SupplierID,  
	  CustomerID,  
	  ProformaInvNo, 
	  GRNNo,
	  ShippingAddress,
	  ShippingCity,
	  ShippingPin,
	  DespatchMode, 
	  DeliveredBy,  
	  VehicleNo,  
	  Remarks,  
	  DeliveryNoteStatus,  
	  CancelDate,  
	  CancelReason,  
	  VATRate,
	  VATAmt,
	  ProductTotalAmt,
	  TotalAmt,
	  CompanyID,  
	  BranchID,  
	  FinYearID  
	 )  
	 Values  
	 (  
	  @NewPRetNo,  
	  Convert(datetime,@PRetDate,103),  
	  'Y',  
	  @SupplierID,  
	  null,  
	  null,  
	  @GRNNo,
	  @ShippingAddress,
	  @ShippingCity,  
	  @ShippingPin,  
	  @ModeofDespatch,
	  @DeliveredBy,  
	  @VehicleNo,  
	  @Remarks,  
	  'NUT',  
	  null,  
	  null,  
	  @VatRate,
	  @VatAmt,
	  @SubTotal,
	  @InvoiceAmt,
	  @CompanyId,  
	  @BranchId,  
	  @FinYearID  
	 )  
	  
	 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
	  
	 Open CurDetailRecord  
	 Fetch Next From CurDetailRecord Into @ProductID,@Rate,@GRNQty,@RetQty,@Amount  
	  
	 While (@@Fetch_Status=0)  
	 Begin  

	  
	  IF isnull(@ProductID,'')=''  
	  Begin  
	   ROLLBACK TRANSACTION  
	   	Select 'Error : Product can not be empty'  
	   return  
	  END  
	  
	  IF isnull(@ProductID,'')<>''  
	  Begin  
	   select  @intcntr = count(*)  
	   from    MstProduct  
	   where   (ProductID = @ProductID)  
	   
	   if @intcntr  <= 0  
	   begin  
	    ROLLBACK TRANSACTION  
	            select 'Error : product does not exist'  
	    return  
	   end  
	  END  
	  
	  
	  IF isnull(@Rate,0) <=0  
	  Begin  
	   ROLLBACK TRANSACTION  
	   select 'Error : Rate can not be empty or less than 0'  
	   return  
	  END  
	  
	  IF isnull(@GRNQty,0) <=0  
	  Begin  
	   ROLLBACK TRANSACTION  
	   select 'Error : GRN Qty can not be empty or less than 0'  
	   return  
	  END  
	  
	  IF isnull(@RetQty,0) <=0  
	  Begin  
	   ROLLBACK TRANSACTION  
	   select 'Error : Return Qty can not be empty or less than 0'  
	   return  
	  END  

	  IF isnull(@Amount,0) <=0  
	  Begin  
	   ROLLBACK TRANSACTION  
	   select 'Error : Amount can not be empty or less than 0'  
	   return  
	  END  

	  exec  AutoGenerateID 'TrnDeliveryNoteDtl','DeliveryNoteDtlID',18,@NewPRetNo,@NewPRetNoDtlID output    
	  
	  Insert into TrnDeliveryNoteDtl  
	  (  
	   DeliveryNoteDtlID,  
	   DeliveryNoteNo,  
	   ProductID,  
	   Rate,  
	   BalanceProInvQty,  
	   DeliveryQty,  
	   GRNQty,
	   ProductAmt
	  )  
	  Values  
	  (  
	   @NewPRetNoDtlID,  
	   @NewPRetNo,  
	   @ProductID,  
	   @Rate,  
	   0,  
	   @RetQty,  
	   @GRNQty,
	   @Amount
	  )  
	  
	  select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
	  
	  --**********Second Cursor Start  
		Declare CurLiftDetailRecord  
		Cursor For  
		Select StockInDtlID,InDocType,InDocNo,inDocDate,StockPointID,StockinQty,UtilQty  
		from trnstockindtl where InDocType='GRN' and InDocNo=@GRNNo  

		Open CurLiftDetailRecord  
		Fetch Next From CurLiftDetailRecord Into @StockInDtlID,@InDocType,@InDocNo,
		@InDocDate,@StockPointID,@StockinQty,@UtilQty
	    
		While (@@Fetch_Status=0)  
		Begin  
		
		IF isnull(@StockInDtlID,'') =''  
		Begin  
		ROLLBACK TRANSACTION  
		select 'Error : Stock In Detail id can not be empty or less than 0'  
		return  
		END  
		
		IF isnull(@InDocType,'') =''  
		Begin  
		ROLLBACK TRANSACTION  
		select 'Error : Doc Type can not be empty or less than 0'  
		return  
		END  
		
		IF isnull(@InDocNo,'') =''  
		Begin  
		ROLLBACK TRANSACTION  
		select 'Error : Doc no can not be empty or less than 0'  
		return  
		END  
		
		IF isnull(@InDocDate,'') =''  
		Begin  
		ROLLBACK TRANSACTION  
		select 'Error : Doc date can not be empty or less than 0'  
		return  
		END  
		
		IF isnull(@StockPointID,'') =''  
		Begin  
		ROLLBACK TRANSACTION  
		select 'Error : Stock Point can not be empty or less than 0'  
		return  
		END  
		
		select  @intcntr = count(*)  
		from    MstStockPoint  
		where   (StockPointID = @StockPointID)  
		
		if @intcntr  <= 0  
		begin  
		ROLLBACK TRANSACTION  
		    select 'Error : Invalid Stock Point selected'  
		    return  
		end  
	
		exec  AutoGenerateID 'TrnDeliveryNoteLiftDtl','DeliveryNoteLiftDtlID',18,@NewPRetNo,@NewPRetNoLiftDtlID output    
		Insert into TrnDeliveryNoteLiftDtl  
		(  
			DeliveryNoteLiftDtlID,  
			DeliveryNoteDtlID,  
			DeliveryNoteNo,  
			StockInDtlID,  
			ProductID,  
			BalanceStockInQty,  
			LiftQty  
		)  
		Values  
		(  
			@NewPRetNoLiftDtlID,  
			@NewPRetNoDtlID,
			@NewPRetNo,  
			@StockInDtlID,  
			@ProductID,  
			@GRNQty,  
			@RetQty  
		)  

		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
		
		set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID  
		exec  AutoGenerateID 'TrnStockOutDtl' , 'StockOutDtlID' , 15 , @AutoGenPrefix , @NewStockOutID output       
		--Doubts where it will be placed in outer cursor or inner  
		Insert Into TrnStockOutDtl  
		(  
			StockOutDtlID,  
			StockInDtlID,  
			OutDocType,  
			OutDocNo,  
			OutDocDate,  
			StockPointID,  
			ProductID,  
			StockOutQty,  
			SaleRate,  
			VATRate,  
			CompanyID,  
			BranchID,  
			FinYearID  
		)  
		Values  
		(  
			@NewStockOutID,  
			@StockInDtlID,  
			'PRT',  
			@NewPRetNo,  
			Convert(datetime,@PRetDate,103),  
			@StockPointID,  
			@ProductID,  
			@RetQty,  
			@Rate,  
			@VatRate,  
			@CompanyId,  
			@BranchId,  
			@FinYearID  
		)  
		
		Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
		
		Select  @intcntr = count(*)  
		From    TrnCurrentStock  
		Where   ProductID=@ProductID   
		and  	StockPointID=@StockPointID   
		and  	CompanyId=@CompanyId   
		and  	BranchId=@BranchId   
		and  	FinYearID=@FinYearID  
		
		-- ## check BALANCE Qty       
		Select @StoreQty=isnull(StockInQty,0),@OutQty=isnull(UtilQty,0)  
		From TrnStockInDtl Where StockInDtlID=@StockInDtlID  
		
		IF isnull(@StoreQty,0) < isnull(@OutQty,0)           
		Begin  
		ROLLBACK TRANSACTION  
		select 'Error : Utilised Qty can''t be more than StockinQty'  
		return  
		End  
		
		Update TrnStockInDtl   
		Set  UtilQty=isnull(UtilQty,0) + isnull(@RetQty,0)  
		Where  StockInDtlID=@StockInDtlID  
		
		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
		
		-- ## check BALANCE Qty    
		
		Select  @StoreQty=isnull(OpeningStockQty,0) +  isnull(StockInQty,0) - isnull(StockOutQty,0)  
		From  	TrnCurrentStock   
		Where  	ProductID=@ProductID    
		and  	StockPointID=@StockPointID   
		and 	CompanyID=@CompanyID   
		and  	BranchID=@BranchID   
		and  	FinYearID=@FinYearID  
		
		IF isnull(@StoreQty,0) <  isnull(@RetQty,0)         
		Begin  
		ROLLBACK TRANSACTION  
			select 'Error : Utilised Qty can''t be more than Return Qty'  
		return  
		End  
		
		
		Update TrnCurrentStock   
		Set  StockOutQty=isnull(StockOutQty,0) + isnull(@RetQty,0)     
		Where  ProductID=@ProductID   
		and  StockPointID=@StockPointID   
		and CompanyID=@CompanyID   
		and  BranchID=@BranchID   
		and  FinYearID=@FinYearID  
		select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
		
		Fetch Next From CurLiftDetailRecord Into @StockInDtlID,@InDocType,@InDocNo,
		@InDocDate,@StockPointID,@StockinQty,@UtilQty

		End  
		Close CurLiftDetailRecord  
		Deallocate CurLiftDetailRecord  
	  Fetch Next From CurDetailRecord Into @ProductID,@Rate,@GRNQty,@RetQty,@Amount  
	 End  
	   
	 Close CurDetailRecord  
	 Deallocate CurDetailRecord  
	  
	 -- Inserting Values into Log Table   
	 Set @LogMsg= 'Insert Purchase Return' + @NewPRetNo  
	 Set @CurDateTime = getdate()  
	 Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg  
	 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
	   
	 COMMIT TRANSACTION  
	 select @NewPRetNo  
	    
	  
	 END
GO
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNote_Insert]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author : Tridip -- 11/06/2007  

/*  
<NewDataSet>  
 <DeliveryDetail>  
  <ProductID>0300700001</ProductID>  
  <Rate>500.00</Rate>  
  <BalinvQty>5.000</BalinvQty>  
  <DelQty>2</DelQty>  
   <LiftDetail>  
    <ProductID>0300700001</ProductID>  
    <StockInDtlID>030077777000008</StockInDtlID>  
    <InDocType>GRN</InDocType>  
    <InDocNo>030077777000004</InDocNo>  
    <DocDate>06/06/2007</DocDate>  
    <StockPointID>00000023</StockPointID>  
    <BalQty>2.000</BalQty>  
    <LiftQty>2</LiftQty>  
   </LiftDetail>  
 </DeliveryDetail>  
 <DeliveryDetail>  
  <ProductID>0300700002</ProductID>  
  <Rate>1400.00</Rate>  
  <BalinvQty>2.000</BalinvQty>  
  <DelQty>2</DelQty>  
   <LiftDetail>  
    <ProductID>0300700002</ProductID>  
    <StockInDtlID>030077777000009</StockInDtlID>  
    <InDocType>GRN</InDocType>  
    <InDocNo>030077777000004</InDocNo>  
    <DocDate>06/06/2007</DocDate>  
    <StockPointID>00000023</StockPointID>  
    <BalQty>2.000</BalQty>  
    <LiftQty>2</LiftQty>  
   </LiftDetail>  
 </DeliveryDetail>  
</NewDataSet>  
*/  
  
  
CREATE PROCEDURE [dbo].[TrnDeliveryNote_Insert]  
(  
 @DVNNo   as varchar(15)=null,  
 @DVNDate   as varchar(10),  
 @ProformaInvNo  as varchar(15)=null,  
 @ShippingAddress  as varchar(200)=null,  
 @ModeofDespatch  as varchar(20),  
 @ShippingCity   as varchar(50) = null,  
 @ShippingPin   as varchar(15) = null,  
 @DeliveredBy     as varchar(50) = null,  
 @VehicleNo     as varchar(30) = null,  
 @Remarks     as varchar(200) = null,  
 @DetailXml   as NTEXT,  
 @LogUserId        as varchar(12),  
 @CompanyId      as varchar(2),  
 @BranchId           as varchar(3),  
 @FinYearID          as varchar(4)  
  
)  
As   
   
Begin  
  
 Declare @intCntr as int  
 Declare @logMsg as Varchar(200)  
 Declare @CurDatetime as datetime   
 Declare @intError as integer  
  
 Declare @NewDVNNo as varchar(15)  
 Declare @NewDVNDtlID as varchar(18)  
 Declare @NweDVNLiftDtlID as varchar(18)  
 Declare @NewStockOutID as varchar(15)  
 Declare @CustomerID  as Varchar(10)  
 Declare @ProformaInvDate  as datetime  
  
 Declare @AutoGenPrefix as varchar(9)  
  
 Declare @XMLFormat Int  
  
 Declare @ProductID as Varchar(10)  
 Declare @Rate as Decimal(18,3)  
 Declare @BalinvQty as Decimal(18,2)  
 Declare @DelQty as Decimal(18,3)  
  
  
 Declare @StockInDtlID as varchar(15)  
 Declare @InDocType as varchar(3)  
 Declare @InDocNo as varchar(20)  
 Declare @InDocDate as varchar(10)  
 Declare @StockPointID as varchar(10)  
 Declare @BalQty as Decimal(18,3)  
 Declare @LiftQty as Decimal(18,3)  
  
 Declare @tmpDelQty as Decimal(18,3)  
 Declare @tmpLiftQty as Decimal(18,3)  
  
 Declare @StoreQty as Decimal(18,3)  
 Declare @OutQty as Decimal(18,3)  
  
 -- Setting Counter to zero  
 set @intCntr = 0  
  
 --- Validation start for Master part from here   
 -- Checking the Primary key violation   
  
 IF isnull(@ProformaInvNo,'')=''  
 BEGIN  
         select 'Error : Proforma Invoice No can not be empty'  
         return  
 END  
  
 select   @intcntr = count(*),  
  @ProformaInvDate=ProformaInvDate,  
  @CustomerID=CustomerID  
 from    TrnProformaInvoiceHdr  
 where   (ProformaInvNo = @ProformaInvNo   
 and  ProformaInvStatus in ('NUT','PUT'))  
 Group By ProformaInvDate,CustomerID  
  
 if @intcntr  <= 0  
 begin  
         select 'Error : Invalid Proforma Invoice no or Proforma Invoice no Utilised/Cancel/Close'  
         return  
 end  
  
 IF isnull(@DVNDate,'')=''  
 BEGIN  
         select 'Error : Delivery Note date can not be empty'  
         return  
 END  
   
 IF convert(varchar,convert(datetime,@DVNDate,103),112) < convert(varchar,@ProformaInvDate,112)  
 BEGIN  
         select 'Error : Delivery Note date can not be less than Proforma Invoice Date'  
         return  
 END  
  
 IF isnull(@ShippingAddress,'')=''  
 BEGIN  
         select 'Error : Shipping Address can not be empty'  
         return  
 END  
  
 IF isnull(@ModeofDespatch,'')=''  
 BEGIN  
         select 'Error : Despatch Mode can not be empty'  
         return  
 END  
  
 --- Validation end for Master part from here  
  
 --- Validation start for detail part from here  
 --Prepare input values as an XML documnet  
  
  
 Exec sp_xml_preparedocument @XMLFormat OUTPUT, @DetailXml  
  
 -- Create Cursor from XML Table  
  
 Declare CurDetailRecord  
 Cursor For  
 Select ProductID,Rate,BalinvQty,DelQty  
 From Openxml (@XMLFormat, '/NewDataSet/DeliveryDetail', 2)  
 With   
  (  
   ProductID Varchar(10),  
   Rate Decimal(18,3),  
   BalinvQty Decimal(18,3),  
   DelQty decimal(18,2)  
  )  
  
 Declare CurLiftDetailRecord  
 Cursor For  
 Select StockInDtlID,InDocType,InDocNo,DocDate,StockPointID,BalQty,LiftQty  
 From Openxml (@XMLFormat, '/NewDataSet/DeliveryDetail/LiftDetail', 3)  
 With   
  (  
   StockInDtlID Varchar(15),  
   InDocType Varchar(13),  
   InDocNo Varchar(20),  
   DocDate Varchar(10),  
   StockPointID Varchar(10),  
   BalQty decimal(18,2),  
   LiftQty decimal(18,2)  
  )  
  
  
 BEGIN TRANSACTION     
  
 -- Auto Generate New GRNNo  
 set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID  
 exec  AutoGenerateID 'TrnDeliveryNoteHdr' , 'DeliveryNoteNo' , 15 , @AutoGenPrefix , @NewDVNNo output       
  
 Insert Into TrnDeliveryNoteHdr  
 (  
  DeliveryNoteNo,  
  DeliveryNoteDate,  
  PurchaseReturnTag,  
  SupplierID,  
  CustomerID,  
  ProformaInvNo, 
  GRNNo,
  ShippingAddress,
  ShippingCity,
  ShippingPin,
  DespatchMode, 
  DeliveredBy,  
  VehicleNo,  
  Remarks,  
  DeliveryNoteStatus,  
  CancelDate,  
  CancelReason,  
  CompanyID,  
  BranchID,  
  FinYearID  
 )  
 Values  
 (  
  @NewDVNNo,  
  Convert(datetime,@DVNDate,103),  
  'N',  
  null,  
  @CustomerID,  
  @ProformaInvNo,  
  null,
  @ShippingAddress,
  @ShippingCity,  
  @ShippingPin,  
  @ModeofDespatch,
  @DeliveredBy,  
  @VehicleNo,  
  @Remarks,  
  'NUT',  
  null,  
  null,  
  @CompanyId,  
  @BranchId,  
  @FinYearID  
 )  
  
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
  
 Open CurDetailRecord  
 Fetch Next From CurDetailRecord Into @ProductID,@Rate,@BalinvQty,@DelQty  
  
 While (@@Fetch_Status=0)  
 Begin  
  
  IF isnull(@ProductID,'')=''  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : Product can not be empty'  
   return  
  END  
  
  IF isnull(@ProductID,'')<>''  
  Begin  
   select  @intcntr = count(*)  
   from    MstProduct  
   where   (ProductID = @ProductID)  
   
   if @intcntr  <= 0  
   begin  
    ROLLBACK TRANSACTION  
            select 'Error : product does not exist'  
    return  
   end  
  END  
  
  
  IF isnull(@Rate,0) <=0  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : Rate can not be empty or less than 0'  
   return  
  END  
  
  IF isnull(@BalinvQty,0) <=0  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : P.Inv.Qty can not be empty or less than 0'  
   return  
  END  
  
  IF isnull(@DelQty,0) <=0  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : Delivered Qty can not be empty or less than 0'  
   return  
  END  
  
  IF isnull(@DelQty,0) > isnull(@BalinvQty,0)  
  Begin  
   ROLLBACK TRANSACTION  
   select 'Error : Delivered Qty can not be more than balance qty'  
   return  
  END  
    
  Set @tmpDelQty=@DelQty  
  -- Auto Generate New GRNDtlID  
  exec  AutoGenerateID 'TrnDeliveryNoteDtl' , 'DeliveryNoteDtlID' , 18  , @NewDVNNo,@NewDVNDtlID output    
  
  Insert into TrnDeliveryNoteDtl  
  (  
   DeliveryNoteDtlID,  
   DeliveryNoteNo,  
   ProductID,  
   Rate,  
   BalanceProInvQty,  
   DeliveryQty,  
   GRNQty  
  )  
  Values  
  (  
   @NewDVNDtlID,  
   @NewDVNNo,  
   @ProductID,  
   @Rate,  
   @BalinvQty,  
   @DelQty,  
   0      
  )  
  
  select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
  
  --**********Second Cursor Start  
   Open CurLiftDetailRecord  
   Fetch Next From CurLiftDetailRecord Into @StockInDtlID,@InDocType,@InDocNo,@InDocDate,@StockPointID,@BalQty,@LiftQty  
    
   While (@@Fetch_Status=0)  
   Begin  
  
    IF isnull(@StockInDtlID,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Stock In Detail id can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@InDocType,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Doc Type can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@InDocNo,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Doc no can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@InDocDate,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Doc date can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@StockPointID,'') =''  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Stock Point can not be empty or less than 0'  
     return  
    END  
  
    select  @intcntr = count(*)  
    from    MstStockPoint  
    where   (StockPointID = @StockPointID)  
     
    if @intcntr  <= 0  
    begin  
     ROLLBACK TRANSACTION  
            select 'Error : Invalid Stock Point selected'  
            return  
    end  
  
    IF isnull(@BalQty,0) < 0  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Balance Qty can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@LiftQty,0) < 0  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Lift Qty can not be empty or less than 0'  
     return  
    END  
  
    IF isnull(@LiftQty,0) > isnull(@BalQty,0)  
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Delivered Qty can not be more than balance qty'  
     return  
    END  
      
    Set @tmpLiftQty=isnull(@tmpLiftQty,0)+isnull(@LiftQty,0)  
    exec  AutoGenerateID 'TrnDeliveryNoteLiftDtl','DeliveryNoteLiftDtlID',18,@NewDVNNo,@NweDVNLiftDtlID output    
    Insert into TrnDeliveryNoteLiftDtl  
    (  
     DeliveryNoteLiftDtlID,  
     DeliveryNoteDtlID,  
     DeliveryNoteNo,  
     StockInDtlID,  
     ProductID,  
     BalanceStockInQty,  
     LiftQty  
    )  
    Values  
    (  
     @NweDVNLiftDtlID,  
     @NewDVNDtlID,  
     @NewDVNNo,  
     @StockInDtlID,  
     @ProductID,  
     @BalQty,  
     @LiftQty  
    )  
    select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
   
    set @AutoGenPrefix = @CompanyId + @BranchId + @FinYearID  
    exec  AutoGenerateID 'TrnStockOutDtl' , 'StockOutDtlID' , 15 , @AutoGenPrefix , @NewStockOutID output       
    --Doubts where it will be placed in outer cursor or inner  
    Insert Into TrnStockOutDtl  
    (  
     StockOutDtlID,  
     StockInDtlID,  
     OutDocType,  
     OutDocNo,  
     OutDocDate,  
     StockPointID,  
     ProductID,  
     StockOutQty,  
     SaleRate,  
     VATRate,  
     CompanyID,  
     BranchID,  
     FinYearID  
    )  
    Values  
    (  
     @NewStockOutID,  
     @StockInDtlID,  
     'DVN',  
     @NewDVNNo,  
     Convert(datetime,@DVNDate,103),  
     @StockPointID,  
     @ProductID,  
     @LiftQty,  
     @Rate,  
     0,  
     @CompanyId,  
     @BranchId,  
     @FinYearID  
    )  
    
    Select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
    
    Select  @intcntr = count(*)  
    From    TrnCurrentStock  
    Where   ProductID=@ProductID   
    and  StockPointID=@StockPointID   
    and  CompanyId=@CompanyId   
    and  BranchId=@BranchId   
    and  FinYearID=@FinYearID  
      
    -- ## check BALANCE Qty       
    Select @StoreQty=isnull(StockInQty,0),@OutQty=isnull(UtilQty,0)  
    From TrnStockInDtl Where StockInDtlID=@StockInDtlID  
      
    IF isnull(@StoreQty,0) < isnull(@OutQty,0)           
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Utilised Qty can''t be more than StockinQty'  
     return  
    End  
  
    Update TrnStockInDtl   
    Set  UtilQty=isnull(UtilQty,0) + isnull(@LiftQty,0)  
    Where  StockInDtlID=@StockInDtlID  
      
    select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
  
    -- ## check BALANCE Qty    
     
    Select  	@StoreQty=isnull(OpeningStockQty,0) +  isnull(StockInQty,0) - isnull(StockOutQty,0)  
    From  	TrnCurrentStock   
    Where  	ProductID=@ProductID    
    and  	StockPointID=@StockPointID   
    and 	CompanyID=@CompanyID   
    and  	BranchID=@BranchID   
    and  	FinYearID=@FinYearID  
  
    IF isnull(@StoreQty,0) <  isnull(@LiftQty,0)         
    Begin  
     ROLLBACK TRANSACTION  
     select 'Error : Utilised Qty can''t be more than Lift Qty'  
     return  
    End  
  
      
    Update TrnCurrentStock   
    Set  StockOutQty=isnull(StockOutQty,0) + @LiftQty  
    Where  ProductID=@ProductID   
    and  StockPointID=@StockPointID   
    and CompanyID=@CompanyID   
    and  BranchID=@BranchID   
    and  FinYearID=@FinYearID  
    select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
    
    Fetch Next From CurLiftDetailRecord Into @StockInDtlID,@InDocType,@InDocNo,@InDocDate,@StockPointID,@BalQty,@LiftQty  
   End  
   Close CurLiftDetailRecord  
   Deallocate CurLiftDetailRecord  
     
  
   -- ## check BALANCE Qty       
   Select  @StoreQty=isnull(ProductQty,0),  
   @OutQty=isnull(UtilQty,0)  
   From  TrnProformaInvoiceDtl   
   Where  ProformaInvNo=@ProformaInvNo   
   and  ProductID=@ProductID  
  
   IF isnull(@StoreQty,0) < isnull(@OutQty,0)           
   Begin  
    ROLLBACK TRANSACTION  
    select 'Error : Product Qty can''t be more than UtilQty'  
    return  
   End  
  
   Update TrnProformaInvoiceDtl   
   Set  UtilQty=isnull(UtilQty,0) + @DelQty  
   Where  ProformaInvNo=@ProformaInvNo   
   and  ProductID=@ProductID  
   select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
  
   -- ## check Deleivery qty with Total lift qty.  
   if @tmpLiftQty <> @tmpDelQty  
   Begin  
    ROLLBACK TRANSACTION  
    select 'Error : Delivered Qty and lift qty must be same'  
    return  
   End  
   Set @tmpLiftQty=0  
  
  Fetch Next From CurDetailRecord Into @ProductID,@Rate,@BalinvQty,@DelQty  
 End  
   
 Close CurDetailRecord  
 Deallocate CurDetailRecord  
 --- Validation end for detail part from here  
   
 Update TrnProformaInvoiceHdr   
 Set  ProformaInvStatus='PUT'  
 Where ProformaInvNo=@ProformaInvNo  
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End    
  
  
 Select @StoreQty=sum(ProductQty),@OutQty=sum(UtilQty)  
 from TrnProformaInvoiceDtl Where ProformaInvNo=@ProformaInvNo  
 Group By ProformaInvNo  
  
 IF @StoreQty=@OutQty  
 Begin  
  Update TrnProformaInvoiceHdr Set ProformaInvStatus='UTL' Where ProformaInvNo=@ProformaInvNo  
 End  
 Else  
 Begin  
  Update TrnProformaInvoiceHdr Set ProformaInvStatus='PUT' Where ProformaInvNo=@ProformaInvNo  
 End  
  
 -- Inserting Values into Log Table   
 Set @LogMsg= 'Insert Delivery Note' + @NewDVNNo  
 Set @CurDateTime = getdate()  
 Exec UserLog_Insert  @CurDateTime, @LogUserID, @LogMsg  
 select @intError = @@error if @intError <> 0  Begin ROLLBACK TRANSACTION return  @intError End  
   
 COMMIT TRANSACTION  
 select @NewDVNNo  
    
  
 END
GO
/****** Object:  StoredProcedure [dbo].[InventryxDBData_Delete]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Author : Arnab -- 13/07/2007
Create  PROCEDURE [dbo].[InventryxDBData_Delete]
as
BEGIN

delete from TrnInvoiceServiceDtl


delete from TrnInvoiceSaleDtl


delete from TrnInvoiceHdr


delete from TrnJobProductIssueLiftDtl


delete from TrnJobProductIssueDtl


delete from TrnJobLabWorkDtl


delete from TrnJobHdr


delete from TrnDeliveryNoteLiftDtl


delete from TrnDeliveryNoteDtl


delete from TrnDeliveryNoteHdr


delete from TrnProformaInvoiceDtl


delete from TrnProformaInvoiceHdr


delete from TrnStockTransferLiftDtl


delete from TrnStockTransferDtl


delete from TrnStockTransferHdr


delete from TrnStockOutDtl


delete from TrnStockInDtl


delete from TrnCurrentStock


delete from TrnPurchaseInvoiceDtl


delete from TrnPurchaseInvoiceHdr


delete from TrnGRNDtl


delete from TrnGRNHdr


delete from TrnPurchaseOrderDtl


delete from TrnPurchaseOrderHdr


delete from MstCustomer 


delete from MstDepartment


delete from MstSupplierRate


delete from MstSupplier


delete from MstProductRate


delete from MstProduct


delete from MstProductGroup


delete from MstManufacturer


delete from MstStockPoint


delete from MstLabourCategory


delete from MstServiceItem where ServiceType not in ('LWC','MCC')


delete from MstUserAccess Where UserID not in ('ADMIN', 'SUPADMIN')


delete from UserLog


delete from UserLogIN


delete from MstUser Where UserID not in ('ADMIN', 'SUPADMIN')


delete from MstBranch where BranchID NOT IN ('000','001')


delete from MstCompany where CompanyID NOT IN ('00','01')

END
GO
/****** Object:  StoredProcedure [dbo].[rptPurchaseReturn_SelectDtl]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rptPurchaseReturn_SelectDtl]
(
	@PRetNo	as varchar(15)=null
)
as
Begin
	SELECT TrnDeliveryNoteDtl.DeliveryNoteNo,MstProduct.ProductID,MstProduct.ProductName,MstProduct.ProductUOM as Unit,
	TrnDeliveryNoteDtl.Rate,TrnDeliveryNoteDtl.GRNQty,TrnDeliveryNoteDtl.DeliveryQty as RetQty, 
	TrnDeliveryNoteDtl.ProductAmt as Amount
	FROM TrnDeliveryNoteHdr INNER JOIN
	TrnDeliveryNoteDtl ON TrnDeliveryNoteHdr.DeliveryNoteNo = TrnDeliveryNoteDtl.DeliveryNoteNo INNER JOIN
	MstProduct ON TrnDeliveryNoteDtl.ProductID = MstProduct.ProductID
	Where TrnDeliveryNoteHdr.DeliveryNoteNo=@PRetNo
End
GO
/****** Object:  StoredProcedure [dbo].[rptSalesReturn_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[rptSalesReturn_Select]
(
	@GRNNo varchar(15)
)
as

SELECT TrnGRNHdr.GRNNo,TrnGRNHdr.GRNDate,TrnGRNHdr.InvoiceNo,TrnInvoiceHdr.InvoiceDate, 
TrnGRNHdr.RefDeliveryNoteDate AS DeliveryNoteDate,TrnGRNHdr.RefDeliveryNoteNo AS DeliveryNoteNo, 
MstStockPoint.StockPointName,MstCustomer.CustomerName,TrnGRNHdr.DeliveredBy,TrnGRNHdr.VehicleNo, 
TrnGRNHdr.Remarks,TrnGRNHdr.VatRate,TrnGRNHdr.VatAmount,TrnGRNHdr.SubTotal,TrnGRNHdr.InvTotal
FROM  TrnGRNHdr INNER JOIN
TrnInvoiceHdr ON TrnGRNHdr.InvoiceNo = TrnInvoiceHdr.InvoiceNo INNER JOIN
MstStockPoint ON TrnGRNHdr.StockPointID = MstStockPoint.StockPointID INNER JOIN
MstCustomer ON TrnGRNHdr.CustomerID = MstCustomer.CustomerID INNER JOIN
TrnDeliveryNoteHdr ON MstCustomer.CustomerID = TrnDeliveryNoteHdr.CustomerID
WHERE (TrnGRNHdr.SalesReturnTag = 'Y') AND (TrnGRNHdr.GRNNo = @GRNNo)
GO
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNoteGrid_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TrnDeliveryNoteGrid_Select]
(
	@DeliveryNoteNo varchar(15)
)
 AS

Begin
	SELECT TrnDeliveryNoteHdr.DeliveryNoteDate, TrnDeliveryNoteHdr.ProformaInvNo, TrnDeliveryNoteHdr.CustomerID, 
	TrnDeliveryNoteHdr.ShippingAddress, TrnDeliveryNoteHdr.ShippingCity, TrnDeliveryNoteHdr.ShippingPin, 
	TrnDeliveryNoteHdr.DespatchMode, TrnDeliveryNoteHdr.DeliveredBy, TrnDeliveryNoteHdr.VehicleNo, TrnDeliveryNoteHdr.Remarks, 
	MstCustomer.CustomerName
	FROM TrnDeliveryNoteHdr INNER JOIN
	MstCustomer ON TrnDeliveryNoteHdr.CustomerID = MstCustomer.CustomerID
	Where TrnDeliveryNoteHdr.DeliveryNoteNo=@DeliveryNoteNo

	SELECT   TrnDeliveryNoteDtl.DeliveryNoteNo,TrnDeliveryNoteDtl.DeliveryNoteDtlID,TrnDeliveryNoteDtl.ProductID, MstProduct.ProductName,
	MstProduct.ProductUOM as Unit,TrnDeliveryNoteDtl.Rate,  
	TrnDeliveryNoteDtl.BalanceProInvQty as BalQty, 
	TrnDeliveryNoteDtl.DeliveryQty
	FROM TrnDeliveryNoteDtl INNER JOIN
	MstProduct ON TrnDeliveryNoteDtl.ProductID = MstProduct.ProductID
	Where TrnDeliveryNoteDtl.DeliveryNoteNo=@DeliveryNoteNo

End
GO
/****** Object:  StoredProcedure [dbo].[rptSalesInvoice_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--Developed By Tridip
CREATE procedure [dbo].[rptSalesInvoice_Select]
(
	@SalesInvoiceNo	Varchar(15)
)
As

Begin
	SELECT InvoiceNo,InvoiceDate,DeliveryNoteNo,CustomerName,BillingAddress,BillingCity,
	BillingPin, Remarks, ProductTotalAmt, VATRate,VATAmt,InvoiceAmt FROM TrnInvoiceHdr
	Where  UPPER(RTRIM(InvoiceType))='SALES' and InvoiceNo=@SalesInvoiceNo
End
GO
/****** Object:  View [dbo].[vw_TrnSalesInvList]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_TrnSalesInvList]
AS
SELECT     InvoiceNo, InvoiceDate, CustomerName, InvoiceAmt, CompanyID, BranchID, FinYearID, InvoiceStatus AS Status, 
                      CASE InvoiceStatus WHEN 'NUT' THEN 'Not Utilised' WHEN 'UTL' THEN 'Utilised' WHEN 'PUT' THEN 'Part Utilised' WHEN 'CAN' THEN 'Cancel' WHEN 'PCL'
                       THEN 'Part Close' END AS InvoiceStatus
FROM         TrnInvoiceHdr
Where UPPER(RTRIM(InvoiceType))='SALES'
GO
/****** Object:  View [dbo].[vw_TrnInvoiceHdr]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TrnInvoiceHdr]

AS

		Select		InvoiceNo,InvoiceDate,CustomerName,ProductTotalAmt,InvoiceStatus,
					CompanyID,BranchID,FinYearID
		From		TrnInvoiceHdr
		Where		InvoiceType='SERVICE'
GO
/****** Object:  StoredProcedure [dbo].[TrnPurchaseReturn_SelectVw]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Developed By Tridip
CREATE procedure [dbo].[TrnPurchaseReturn_SelectVw]
(
	 @PRetNo	as varchar(15)=null
)
as

SELECT TrnDeliveryNoteHdr.DeliveryNoteNo,TrnDeliveryNoteHdr.DeliveryNoteDate, 
MstSupplier.SupplierName,TrnDeliveryNoteHdr.ShippingAddress, 
TrnDeliveryNoteHdr.ShippingCity,TrnDeliveryNoteHdr.ShippingPin,TrnDeliveryNoteHdr.DespatchMode, 
TrnDeliveryNoteHdr.DeliveredBy,TrnDeliveryNoteHdr.GRNNo,TrnDeliveryNoteHdr.VehicleNo, 
TrnDeliveryNoteHdr.Remarks,TrnDeliveryNoteHdr.ProductTotalAmt,TrnDeliveryNoteHdr.VATRate, 
TrnDeliveryNoteHdr.VATAmt,TrnDeliveryNoteHdr.TotalAmt,TrnDeliveryNoteHdr.CompanyID, 
TrnDeliveryNoteHdr.BranchID,dbo.TrnDeliveryNoteHdr.FinYearID,TrnGRNHdr.RefDeliveryNoteNo as ChallanNo, 
TrnGRNHdr.RefDeliveryNoteDate as ChallanDate
FROM TrnDeliveryNoteHdr INNER JOIN
MstSupplier ON TrnDeliveryNoteHdr.SupplierID = MstSupplier.SupplierID INNER JOIN
TrnGRNHdr ON TrnDeliveryNoteHdr.GRNNo = TrnGRNHdr.GRNNo
Where TrnDeliveryNoteHdr.DeliveryNoteNo=@PRetNo and TrnDeliveryNoteHdr.PurchaseReturnTag='Y'


SELECT TrnDeliveryNoteDtl.DeliveryNoteNo,MstProduct.ProductID,MstProduct.ProductName,MstProduct.ProductUOM as Unit,
TrnDeliveryNoteDtl.Rate,TrnDeliveryNoteDtl.GRNQty,TrnDeliveryNoteDtl.DeliveryQty as RetQty, 
TrnDeliveryNoteDtl.ProductAmt as Amount
FROM TrnDeliveryNoteHdr INNER JOIN
TrnDeliveryNoteDtl ON TrnDeliveryNoteHdr.DeliveryNoteNo = TrnDeliveryNoteDtl.DeliveryNoteNo INNER JOIN
MstProduct ON TrnDeliveryNoteDtl.ProductID = MstProduct.ProductID
Where TrnDeliveryNoteHdr.DeliveryNoteNo=@PRetNo
GO
/****** Object:  StoredProcedure [dbo].[TrnServiceInvoice_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from TrnInvoiceHdr

select * from TrnInvoiceServiceDtl where invoiceno='010017777000002'

TrnServiceInvoice_Select '010017777000002','01','001','7777','E'

*/


CREATE procedure [dbo].[TrnServiceInvoice_Select]

	@InvNo						Varchar(15),
	@CompanyId					Varchar(2),
	@BranchId        			Varchar(3),
	@FinYearID        			Varchar(4),
	@Mode						Varchar(1)

As

	
	If @Mode = 'E'
	Begin
			Select		TIH.InvoiceNo,Convert(Varchar(10),TIH.InvoiceDate,103) As InvoiceDate,TIH.JobNo,
						MC.CustomerName,MC.CustomerID,TIH.BillingAddress,TIH.BillingCity,TIH.BillingPin,TIH.Remarks,
						TIH.ProductTotalAmt,TIH.VATRate,TIH.VATAmt,
						TIH.InvoiceStatus,Convert(Varchar(10),TIH.CancelDate,103) As CancelDate,TIH.CancelReason,
						TIH.InvoiceAmt,TIH.ProductTotalAmt
			From		TrnInvoiceHdr TIH
			Inner Join	MstCustomer MC On MC.CustomerID=TIH.CustomerID
			And			MC.CompanyId=@CompanyId
			And			MC.BranchId=@BranchId
			Where		InvoiceNo=@InvNo
			And			TIH.CompanyId=@CompanyId
			And			TIH.BranchId=@BranchId
			And			TIH.FinYearID=@FinYearID


			Select		MSI.ServiceItemID
			From		TrnInvoiceServiceDtl TISD
			Inner Join	MstServiceItem MSI On MSI.ServiceItemID=TISD.ServiceItemID
			And			MSI.CompanyId=@CompanyId
			And			MSI.BranchId=@BranchId
			Inner Join	TrnInvoiceHdr TIH On TIH.InvoiceNo=TISD.InvoiceNo
			And			TIH.CompanyId=@CompanyId
			And			TIH.BranchId=@BranchId
			And			TIH.FinYearID=@FinYearID
			Where		TISD.InvoiceNo=@InvNo


			Select		MSI.ServiceItemID,MSI.ServiceType,MSI.ServiceItemName,TISD.Particulars,TISD.Rate,
						TISD.InvoiceQty As InvQty,TISD.ServiceAmt
			From		TrnInvoiceServiceDtl TISD
			Inner Join	MstServiceItem MSI On MSI.ServiceItemID=TISD.ServiceItemID
			And			MSI.CompanyId=@CompanyId
			And			MSI.BranchId=@BranchId
			Inner Join	TrnInvoiceHdr TIH On TIH.InvoiceNo=TISD.InvoiceNo
			And			TIH.CompanyId=@CompanyId
			And			TIH.BranchId=@BranchId
			And			TIH.FinYearID=@FinYearID
			Where		TISD.InvoiceNo=@InvNo

			Select		MSI.ServiceItemID,MSI.ServiceType,MSI.ServiceItemName,TISD.Particulars,TISD.Rate,
						TISD.InvoiceQty As InvQty,TISD.ServiceAmt
			From		TrnInvoiceServiceDtl TISD
			Inner Join	MstServiceItem MSI On MSI.ServiceItemID=TISD.ServiceItemID
			And			MSI.CompanyId=@CompanyId
			And			MSI.BranchId=@BranchId
			Inner Join	TrnInvoiceHdr TIH On TIH.InvoiceNo=TISD.InvoiceNo
			And			TIH.CompanyId=@CompanyId
			And			TIH.BranchId=@BranchId
			And			TIH.FinYearID=@FinYearID
			Where		TISD.InvoiceNo=@InvNo
	End	

	If @Mode = 'V'
	Begin
			Select		InvoiceNo,Convert(Varchar(10),InvoiceDate,103) As InvoiceDate,JobNo,CustomerID,CustomerName,
						BillingAddress,BillingCity,BillingPin,Remarks,ProductTotalAmt,VATRate,VATAmt,
						InvoiceStatus,Convert(Varchar(10),CancelDate,103) As CancelDate,CancelReason,InvoiceAmt,
						ProductTotalAmt
			From		TrnInvoiceHdr
			Where		InvoiceNo=@InvNo
			And			CompanyId=@CompanyId
			And			BranchId=@BranchId
			And			FinYearID=@FinYearID


			Select		MSI.ServiceItemName,TISD.Particulars,TISD.Rate,TISD.InvoiceQty,TISD.ServiceAmt
			From		TrnInvoiceServiceDtl TISD
			Inner Join	MstServiceItem MSI On MSI.ServiceItemID=TISD.ServiceItemID
			And			MSI.CompanyId=@CompanyId
			And			MSI.BranchId=@BranchId
			Inner Join	TrnInvoiceHdr TIH On TIH.InvoiceNo=TISD.InvoiceNo
			And			TIH.CompanyId=@CompanyId
			And			TIH.BranchId=@BranchId
			And			TIH.FinYearID=@FinYearID
			Where		TISD.InvoiceNo=@InvNo
	End
GO
/****** Object:  StoredProcedure [dbo].[TrnSalesInv_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--Developed By Tridip
CREATE procedure [dbo].[TrnSalesInv_Select]
(
	@SalesInvoiceNo	Varchar(15)
)
As

Begin
	SELECT InvoiceDate,DeliveryNoteNo,CustomerName,BillingAddress,BillingCity,
	BillingPin, Remarks, ProductTotalAmt, VATRate,VATAmt,InvoiceAmt FROM TrnInvoiceHdr
	Where  UPPER(RTRIM(InvoiceType))='SALES' and InvoiceNo=@SalesInvoiceNo
	
	SELECT TrnInvoiceSaleDtl.ProductID,MstProduct.ProductName,MstProduct.ProductUOM as Unit,
	TrnInvoiceSaleDtl.Rate,TrnInvoiceSaleDtl.InvoiceQty as Qty,TrnInvoiceSaleDtl.ProductAmt as Amount
	FROM TrnInvoiceSaleDtl INNER JOIN
	MstProduct ON TrnInvoiceSaleDtl.ProductID = MstProduct.ProductID
	Where InvoiceNo=@SalesInvoiceNo
End
GO
/****** Object:  StoredProcedure [dbo].[TrnInvoiceDetail_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE procedure [dbo].[TrnInvoiceDetail_Select]
(
	@InvoiceNo		Varchar(15)
)
as
Begin
	SELECT TrnInvoiceHdr.InvoiceDate,TrnInvoiceHdr.DeliveryNoteNo, 
	TrnDeliveryNoteHdr.DeliveryNoteDate,MstCustomer.CustomerName
	FROM TrnInvoiceHdr INNER JOIN
	TrnDeliveryNoteHdr ON TrnInvoiceHdr.DeliveryNoteNo = TrnDeliveryNoteHdr.DeliveryNoteNo 
	INNER JOIN MstCustomer ON TrnInvoiceHdr.CustomerID = MstCustomer.CustomerID
	Where TrnInvoiceHdr.InvoiceType='SALES' and TrnInvoiceHdr.InvoiceNo=@InvoiceNo


	SELECT TrnInvoiceSaleDtl.ProductID,MstProduct.ProductName,MstProduct.ProductUOM AS Unit,
	TrnInvoiceSaleDtl.InvoiceNo,TrnInvoiceSaleDtl.Rate,TrnInvoiceSaleDtl.InvoiceQty, 
	0 as RetQty,TrnInvoiceSaleDtl.ProductAmt as Amount
	FROM TrnInvoiceSaleDtl INNER JOIN
	MstProduct ON TrnInvoiceSaleDtl.ProductID = MstProduct.ProductID
	Where TrnInvoiceSaleDtl.InvoiceNo=@InvoiceNo

End
GO
/****** Object:  StoredProcedure [dbo].[rptSalesReturnDetail_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[rptSalesReturnDetail_Select]
(
	@GRNNo varchar(15)
)
as

SELECT TrnGRNDtl.ProductID, MstProduct.ProductName, MstProduct.ProductUOM AS Unit, TrnInvoiceSaleDtl.Rate, 
TrnGRNDtl.InvoiceQty,TrnGRNDtl.ReceiptQty AS RetQty, TrnGRNDtl.Amount
FROM TrnInvoiceSaleDtl INNER JOIN
MstProduct ON TrnInvoiceSaleDtl.ProductID = MstProduct.ProductID INNER JOIN
TrnGRNDtl ON MstProduct.ProductID = TrnGRNDtl.ProductID
Where TrnGRNDtl.GRNNo = @GRNNo
GO
/****** Object:  StoredProcedure [dbo].[rptSalesInvoiceDtl_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--Developed By Tridip
CREATE procedure [dbo].[rptSalesInvoiceDtl_Select]
(
	@SalesInvoiceNo	Varchar(15)
)
As

Begin
	SELECT TrnInvoiceSaleDtl.ProductID,MstProduct.ProductName,MstProduct.ProductUOM as Unit,
	TrnInvoiceSaleDtl.Rate,TrnInvoiceSaleDtl.InvoiceQty as Qty,TrnInvoiceSaleDtl.ProductAmt as Amount
	FROM TrnInvoiceSaleDtl INNER JOIN
	MstProduct ON TrnInvoiceSaleDtl.ProductID = MstProduct.ProductID
	Where InvoiceNo=@SalesInvoiceNo
End
GO
/****** Object:  StoredProcedure [dbo].[TrnDeliveryNoteGridDtl_Select]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TrnDeliveryNoteGridDtl_Select]
(
	@DeliveryNoteNo varchar(15),
	@DeliveryNoteDtlID varchar(18)
)
 AS

Begin
	SELECT	TrnStockInDtl.StockInDtlID,TrnStockInDtl.InDocType, TrnStockInDtl.InDocNo, 
			TrnStockInDtl.InDocDate, TrnStockInDtl.StockPointID, 
	       		MstStockPoint.StockPointName, TrnDeliveryNoteLiftDtl.BalanceStockInQty as BalQty, 
			TrnDeliveryNoteLiftDtl.LiftQty
	FROM   	TrnDeliveryNoteLiftDtl INNER JOIN
			TrnStockInDtl ON TrnDeliveryNoteLiftDtl.StockInDtlID = TrnStockInDtl.StockInDtlID INNER JOIN
			MstStockPoint ON TrnStockInDtl.StockPointID = MstStockPoint.StockPointID
	Where  		TrnDeliveryNoteLiftDtl.DeliveryNoteDtlID=@DeliveryNoteDtlID and
			TrnDeliveryNoteLiftDtl.DeliveryNoteNo=@DeliveryNoteNo
End
GO
/****** Object:  StoredProcedure [dbo].[GetSalesReturnDetail_vw]    Script Date: 02/28/2018 23:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetSalesReturnDetail_vw]
(
	@GRNNo varchar(15)
)
as

SELECT TrnGRNHdr.GRNNo,TrnGRNHdr.GRNDate,TrnGRNHdr.InvoiceNo,TrnInvoiceHdr.InvoiceDate, 
TrnGRNHdr.RefDeliveryNoteDate AS DeliveryNoteDate,TrnGRNHdr.RefDeliveryNoteNo AS DeliveryNoteNo, 
MstStockPoint.StockPointName,MstCustomer.CustomerName,TrnGRNHdr.DeliveredBy,TrnGRNHdr.VehicleNo, 
TrnGRNHdr.Remarks,TrnGRNHdr.VatRate,TrnGRNHdr.VatAmount,TrnGRNHdr.SubTotal,TrnGRNHdr.InvTotal
FROM  TrnGRNHdr INNER JOIN
TrnInvoiceHdr ON TrnGRNHdr.InvoiceNo = TrnInvoiceHdr.InvoiceNo INNER JOIN
MstStockPoint ON TrnGRNHdr.StockPointID = MstStockPoint.StockPointID INNER JOIN
MstCustomer ON TrnGRNHdr.CustomerID = MstCustomer.CustomerID INNER JOIN
TrnDeliveryNoteHdr ON MstCustomer.CustomerID = TrnDeliveryNoteHdr.CustomerID
WHERE (TrnGRNHdr.SalesReturnTag = 'Y') AND (TrnGRNHdr.GRNNo = @GRNNo)

SELECT TrnGRNDtl.ProductID, MstProduct.ProductName, MstProduct.ProductUOM AS Unit, TrnInvoiceSaleDtl.Rate, TrnGRNDtl.InvoiceQty, 
TrnGRNDtl.ReceiptQty AS RetQty, TrnGRNDtl.Amount
FROM TrnInvoiceSaleDtl INNER JOIN
MstProduct ON TrnInvoiceSaleDtl.ProductID = MstProduct.ProductID INNER JOIN
TrnGRNDtl ON MstProduct.ProductID = TrnGRNDtl.ProductID
Where TrnGRNDtl.GRNNo = @GRNNo
GO
/****** Object:  Default [DF_MstUser_DisableTag]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[MstUser] ADD  CONSTRAINT [DF_MstUser_DisableTag]  DEFAULT ('N') FOR [DisableTag]
GO
/****** Object:  Default [DF_TrnProformaInvoiceHdr_SubTotal]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceHdr] ADD  CONSTRAINT [DF_TrnProformaInvoiceHdr_SubTotal]  DEFAULT (0) FOR [ProductTotal]
GO
/****** Object:  Default [DF_TrnProformaInvoiceHdr_VatRate]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceHdr] ADD  CONSTRAINT [DF_TrnProformaInvoiceHdr_VatRate]  DEFAULT (0) FOR [VatRate]
GO
/****** Object:  Default [DF_TrnProformaInvoiceHdr_VatAmt]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceHdr] ADD  CONSTRAINT [DF_TrnProformaInvoiceHdr_VatAmt]  DEFAULT (0) FOR [VatAmt]
GO
/****** Object:  Default [DF_TrnProformaInvoiceHdr_ProformaInvAmt]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceHdr] ADD  CONSTRAINT [DF_TrnProformaInvoiceHdr_ProformaInvAmt]  DEFAULT (0) FOR [ProformaInvAmt]
GO
/****** Object:  Default [DF_TrnProformaInvoiceHdr_ProformaInvStatus]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceHdr] ADD  CONSTRAINT [DF_TrnProformaInvoiceHdr_ProformaInvStatus]  DEFAULT ('NUT') FOR [ProformaInvStatus]
GO
/****** Object:  Default [DF_TrnProformaInvoiceDtl_Rate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceDtl] ADD  CONSTRAINT [DF_TrnProformaInvoiceDtl_Rate]  DEFAULT (0) FOR [ProductRate]
GO
/****** Object:  Default [DF_TrnProformaInvoiceDtl_InvoiceQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceDtl] ADD  CONSTRAINT [DF_TrnProformaInvoiceDtl_InvoiceQty]  DEFAULT (0) FOR [ProductQty]
GO
/****** Object:  Default [DF_TrnProformaInvoiceDtl_InvoiceAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceDtl] ADD  CONSTRAINT [DF_TrnProformaInvoiceDtl_InvoiceAmt]  DEFAULT (0) FOR [ProductAmt]
GO
/****** Object:  Default [DF_TrnProformaInvoiceDtl_UtilQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceDtl] ADD  CONSTRAINT [DF_TrnProformaInvoiceDtl_UtilQty]  DEFAULT (0) FOR [UtilQty]
GO
/****** Object:  Default [DF_MstLabourCategory_HourlyRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstLabourCategory] ADD  CONSTRAINT [DF_MstLabourCategory_HourlyRate]  DEFAULT (0) FOR [HourlyRate]
GO
/****** Object:  Default [DF_MstSetup_ProcessTag]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSetup] ADD  CONSTRAINT [DF_MstSetup_ProcessTag]  DEFAULT ('N') FOR [ProcessTag]
GO
/****** Object:  Default [DF_TrnJobHdr_JobStatus]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr] ADD  CONSTRAINT [DF_TrnJobHdr_JobStatus]  DEFAULT ('NUT') FOR [JobStatus]
GO
/****** Object:  Default [DF_TrnJobHdr_JobSubTotal]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr] ADD  CONSTRAINT [DF_TrnJobHdr_JobSubTotal]  DEFAULT (0) FOR [LabWorkTotal]
GO
/****** Object:  Default [DF_TrnJobHdr_ProductIssueTotal]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr] ADD  CONSTRAINT [DF_TrnJobHdr_ProductIssueTotal]  DEFAULT (0) FOR [ProductIssueTotal]
GO
/****** Object:  Default [DF_TrnPurchaseOrderHdr_ProductTotalAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] ADD  CONSTRAINT [DF_TrnPurchaseOrderHdr_ProductTotalAmt]  DEFAULT (0) FOR [ProductTotalAmt]
GO
/****** Object:  Default [DF_TrnPurchaseOrderHdr_VATRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] ADD  CONSTRAINT [DF_TrnPurchaseOrderHdr_VATRate]  DEFAULT (0) FOR [VATRate]
GO
/****** Object:  Default [DF_TrnPurchaseOrderHdr_VATAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] ADD  CONSTRAINT [DF_TrnPurchaseOrderHdr_VATAmt]  DEFAULT (0) FOR [VATAmt]
GO
/****** Object:  Default [DF_TrnPurchaseOrderHdr_PurchaseOrderAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] ADD  CONSTRAINT [DF_TrnPurchaseOrderHdr_PurchaseOrderAmt]  DEFAULT (0) FOR [PurchaseOrderAmt]
GO
/****** Object:  Default [DF_TrnPurchaseOrderHdr_PurchaseOrderStatus]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] ADD  CONSTRAINT [DF_TrnPurchaseOrderHdr_PurchaseOrderStatus]  DEFAULT ('NUT') FOR [PurchaseOrderStatus]
GO
/****** Object:  Default [DF_TrnPurchaseInvoiceHdr_PurchaseInvStatus]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr] ADD  CONSTRAINT [DF_TrnPurchaseInvoiceHdr_PurchaseInvStatus]  DEFAULT ('NPD') FOR [PurchaseInvStatus]
GO
/****** Object:  Default [DF_TrnStockAdjustmentHdr_BookStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] ADD  CONSTRAINT [DF_TrnStockAdjustmentHdr_BookStockQty]  DEFAULT (0) FOR [BookStockQty]
GO
/****** Object:  Default [DF_TrnStockAdjustmentHdr_PhysicalStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] ADD  CONSTRAINT [DF_TrnStockAdjustmentHdr_PhysicalStockQty]  DEFAULT (0) FOR [PhysicalStockQty]
GO
/****** Object:  Default [DF_TrnStockAdjustmentHdr_AdjustStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] ADD  CONSTRAINT [DF_TrnStockAdjustmentHdr_AdjustStockQty]  DEFAULT (0) FOR [AdjustStockQty]
GO
/****** Object:  Default [DF_TrnStockInDtl_StockINQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl] ADD  CONSTRAINT [DF_TrnStockInDtl_StockINQty]  DEFAULT (0) FOR [StockINQty]
GO
/****** Object:  Default [DF_TrnStockInDtl_UtilQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl] ADD  CONSTRAINT [DF_TrnStockInDtl_UtilQty]  DEFAULT (0) FOR [UtilQty]
GO
/****** Object:  Default [DF_TrnStockInDtl_PurchaseRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl] ADD  CONSTRAINT [DF_TrnStockInDtl_PurchaseRate]  DEFAULT (0) FOR [PurchaseRate]
GO
/****** Object:  Default [DF_TrnStockInDtl_VATRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl] ADD  CONSTRAINT [DF_TrnStockInDtl_VATRate]  DEFAULT (0) FOR [VATRate]
GO
/****** Object:  Default [DF_TrnPurchaseInvoiceDtl_ProductRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl] ADD  CONSTRAINT [DF_TrnPurchaseInvoiceDtl_ProductRate]  DEFAULT (0) FOR [ProductRate]
GO
/****** Object:  Default [DF_TrnPurchaseInvoiceDtl_ProductQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl] ADD  CONSTRAINT [DF_TrnPurchaseInvoiceDtl_ProductQty]  DEFAULT (0) FOR [ProductQty]
GO
/****** Object:  Default [DF_TrnPurchaseInvoiceDtl_ProductAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl] ADD  CONSTRAINT [DF_TrnPurchaseInvoiceDtl_ProductAmt]  DEFAULT (0) FOR [ProductAmt]
GO
/****** Object:  Default [DF_TrnPurchaseInvoiceDtl_SupInvQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl] ADD  CONSTRAINT [DF_TrnPurchaseInvoiceDtl_SupInvQty]  DEFAULT (0) FOR [GRNQty]
GO
/****** Object:  Default [DF_TrnPurchaseInvoiceDtl_PORate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl] ADD  CONSTRAINT [DF_TrnPurchaseInvoiceDtl_PORate]  DEFAULT (0) FOR [PORate]
GO
/****** Object:  Default [DF_TrnPurchaseOrderDtl_UtilQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderDtl] ADD  CONSTRAINT [DF_TrnPurchaseOrderDtl_UtilQty]  DEFAULT (0) FOR [UtilQty]
GO
/****** Object:  Default [DF_TrnGRNHdr_VatRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr] ADD  CONSTRAINT [DF_TrnGRNHdr_VatRate]  DEFAULT (0) FOR [VatRate]
GO
/****** Object:  Default [DF_TrnGRNHdr_VatAmount]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr] ADD  CONSTRAINT [DF_TrnGRNHdr_VatAmount]  DEFAULT (0) FOR [VatAmount]
GO
/****** Object:  Default [DF_TrnGRNHdr_SubTotal]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr] ADD  CONSTRAINT [DF_TrnGRNHdr_SubTotal]  DEFAULT (0) FOR [SubTotal]
GO
/****** Object:  Default [DF_TrnGRNHdr_InvTotal]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr] ADD  CONSTRAINT [DF_TrnGRNHdr_InvTotal]  DEFAULT (0) FOR [InvTotal]
GO
/****** Object:  Default [DF_TrnJobProductIssueDtl_Rate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueDtl] ADD  CONSTRAINT [DF_TrnJobProductIssueDtl_Rate]  DEFAULT (0) FOR [Rate]
GO
/****** Object:  Default [DF_TrnJobProductIssueDtl_BalanceStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueDtl] ADD  CONSTRAINT [DF_TrnJobProductIssueDtl_BalanceStockQty]  DEFAULT (0) FOR [BalanceStockQty]
GO
/****** Object:  Default [DF_TrnJobProductIssueDtl_IssueQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueDtl] ADD  CONSTRAINT [DF_TrnJobProductIssueDtl_IssueQty]  DEFAULT (0) FOR [IssueQty]
GO
/****** Object:  Default [DF_TrnJobProductIssueDtl_ProductAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueDtl] ADD  CONSTRAINT [DF_TrnJobProductIssueDtl_ProductAmt]  DEFAULT (0) FOR [ProductAmt]
GO
/****** Object:  Default [DF_TrnJobLabWorkDtl_LabourRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobLabWorkDtl] ADD  CONSTRAINT [DF_TrnJobLabWorkDtl_LabourRate]  DEFAULT (0) FOR [LabourRate]
GO
/****** Object:  Default [DF_TrnJobLabWorkDtl_NoOfLabour]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobLabWorkDtl] ADD  CONSTRAINT [DF_TrnJobLabWorkDtl_NoOfLabour]  DEFAULT (0) FOR [NoOfLabour]
GO
/****** Object:  Default [DF_TrnJobLabWorkDtl_WorkHour]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobLabWorkDtl] ADD  CONSTRAINT [DF_TrnJobLabWorkDtl_WorkHour]  DEFAULT (0) FOR [WorkHour]
GO
/****** Object:  Default [DF_TrnJobLabWorkDtl_LabourAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobLabWorkDtl] ADD  CONSTRAINT [DF_TrnJobLabWorkDtl_LabourAmt]  DEFAULT (0) FOR [LabourAmt]
GO
/****** Object:  Default [DF_TrnCurrentStock_OpeningStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock] ADD  CONSTRAINT [DF_TrnCurrentStock_OpeningStockQty]  DEFAULT (0) FOR [OpeningStockQty]
GO
/****** Object:  Default [DF_TrnCurrentStock_StockInQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock] ADD  CONSTRAINT [DF_TrnCurrentStock_StockInQty]  DEFAULT (0) FOR [StockInQty]
GO
/****** Object:  Default [DF_TrnCurrentStock_StockOutQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock] ADD  CONSTRAINT [DF_TrnCurrentStock_StockOutQty]  DEFAULT (0) FOR [StockOutQty]
GO
/****** Object:  Default [DF_TrnCurrentStock_ClosingStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock] ADD  CONSTRAINT [DF_TrnCurrentStock_ClosingStockQty]  DEFAULT (0) FOR [ClosingStockQty]
GO
/****** Object:  Default [DF_MstProductRate_UnitSaleRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProductRate] ADD  CONSTRAINT [DF_MstProductRate_UnitSaleRate]  DEFAULT (0) FOR [UnitSaleRate]
GO
/****** Object:  Default [DF_TrnDeliveryNoteHdr_ProductTotalAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] ADD  CONSTRAINT [DF_TrnDeliveryNoteHdr_ProductTotalAmt]  DEFAULT (0) FOR [ProductTotalAmt]
GO
/****** Object:  Default [DF_TrnDeliveryNoteHdr_VATRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] ADD  CONSTRAINT [DF_TrnDeliveryNoteHdr_VATRate]  DEFAULT (0) FOR [VATRate]
GO
/****** Object:  Default [DF_TrnDeliveryNoteHdr_VATAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] ADD  CONSTRAINT [DF_TrnDeliveryNoteHdr_VATAmt]  DEFAULT (0) FOR [VATAmt]
GO
/****** Object:  Default [DF_TrnDeliveryNoteHdr_InvoiceAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] ADD  CONSTRAINT [DF_TrnDeliveryNoteHdr_InvoiceAmt]  DEFAULT (0) FOR [TotalAmt]
GO
/****** Object:  Default [DF_TrnGRNDtl_BalancePOQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNDtl] ADD  CONSTRAINT [DF_TrnGRNDtl_BalancePOQty]  DEFAULT (0) FOR [BalancePOQty]
GO
/****** Object:  Default [DF_TrnGRNDtl_InvoiceQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNDtl] ADD  CONSTRAINT [DF_TrnGRNDtl_InvoiceQty]  DEFAULT (0) FOR [InvoiceQty]
GO
/****** Object:  Default [DF_TrnGRNDtl_ReceiptQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNDtl] ADD  CONSTRAINT [DF_TrnGRNDtl_ReceiptQty]  DEFAULT (0) FOR [ReceiptQty]
GO
/****** Object:  Default [DF_TrnGRNDtl_Amount]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNDtl] ADD  CONSTRAINT [DF_TrnGRNDtl_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_TrnJobProductIssueLiftDtl_BalanceStockInQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl] ADD  CONSTRAINT [DF_TrnJobProductIssueLiftDtl_BalanceStockInQty]  DEFAULT (0) FOR [BalanceStockInQty]
GO
/****** Object:  Default [DF_TrnJobProductIssueLiftDtl_LiftQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl] ADD  CONSTRAINT [DF_TrnJobProductIssueLiftDtl_LiftQty]  DEFAULT (0) FOR [LiftQty]
GO
/****** Object:  Default [DF_TrnStockAdjustmentDtl_BookStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentDtl] ADD  CONSTRAINT [DF_TrnStockAdjustmentDtl_BookStockQty]  DEFAULT (0) FOR [BookStockQty]
GO
/****** Object:  Default [DF_TrnStockAdjustmentDtl_PhysicalStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentDtl] ADD  CONSTRAINT [DF_TrnStockAdjustmentDtl_PhysicalStockQty]  DEFAULT (0) FOR [PhysicalStockQty]
GO
/****** Object:  Default [DF_TrnStockAdjustmentDtl_AdjustStockQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentDtl] ADD  CONSTRAINT [DF_TrnStockAdjustmentDtl_AdjustStockQty]  DEFAULT (0) FOR [AdjustStockQty]
GO
/****** Object:  Default [DF_TrnStockOutDtl_StockOutQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl] ADD  CONSTRAINT [DF_TrnStockOutDtl_StockOutQty]  DEFAULT (0) FOR [StockOutQty]
GO
/****** Object:  Default [DF_TrnStockOutDtl_StockOutQty1]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl] ADD  CONSTRAINT [DF_TrnStockOutDtl_StockOutQty1]  DEFAULT (0) FOR [CancelQty]
GO
/****** Object:  Default [DF_TrnStockOutDtl_SaleRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl] ADD  CONSTRAINT [DF_TrnStockOutDtl_SaleRate]  DEFAULT (0) FOR [SaleRate]
GO
/****** Object:  Default [DF_TrnStockOutDtl_VATRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl] ADD  CONSTRAINT [DF_TrnStockOutDtl_VATRate]  DEFAULT (0) FOR [VATRate]
GO
/****** Object:  Default [DF_TrnInvoiceHdr_ProductTotalAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr] ADD  CONSTRAINT [DF_TrnInvoiceHdr_ProductTotalAmt]  DEFAULT (0) FOR [ProductTotalAmt]
GO
/****** Object:  Default [DF_TrnInvoiceHdr_VATRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr] ADD  CONSTRAINT [DF_TrnInvoiceHdr_VATRate]  DEFAULT (0) FOR [VATRate]
GO
/****** Object:  Default [DF_TrnInvoiceHdr_VATAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr] ADD  CONSTRAINT [DF_TrnInvoiceHdr_VATAmt]  DEFAULT (0) FOR [VATAmt]
GO
/****** Object:  Default [DF_TrnInvoiceHdr_PurchaseOrderAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr] ADD  CONSTRAINT [DF_TrnInvoiceHdr_PurchaseOrderAmt]  DEFAULT (0) FOR [InvoiceAmt]
GO
/****** Object:  Default [DF_TrnDeliveryNoteDtl_InvRate]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteDtl] ADD  CONSTRAINT [DF_TrnDeliveryNoteDtl_InvRate]  DEFAULT (0) FOR [Rate]
GO
/****** Object:  Default [DF_TrnDeliveryNoteDtl_GRNQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteDtl] ADD  CONSTRAINT [DF_TrnDeliveryNoteDtl_GRNQty]  DEFAULT (0) FOR [GRNQty]
GO
/****** Object:  Default [DF_TrnDeliveryNoteDtl_BalanceProInvQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteDtl] ADD  CONSTRAINT [DF_TrnDeliveryNoteDtl_BalanceProInvQty]  DEFAULT (0) FOR [BalanceProInvQty]
GO
/****** Object:  Default [DF_TrnDeliveryNoteDtl_DeliveryQty]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteDtl] ADD  CONSTRAINT [DF_TrnDeliveryNoteDtl_DeliveryQty]  DEFAULT (0) FOR [DeliveryQty]
GO
/****** Object:  Default [DF_TrnDeliveryNoteDtl_ProductAmt]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteDtl] ADD  CONSTRAINT [DF_TrnDeliveryNoteDtl_ProductAmt]  DEFAULT (0) FOR [ProductAmt]
GO
/****** Object:  Default [DF_TrnInvoiceServiceDtl_Rate]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnInvoiceServiceDtl] ADD  CONSTRAINT [DF_TrnInvoiceServiceDtl_Rate]  DEFAULT (0) FOR [Rate]
GO
/****** Object:  Default [DF_TrnInvoiceServiceDtl_InvoiceQty]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnInvoiceServiceDtl] ADD  CONSTRAINT [DF_TrnInvoiceServiceDtl_InvoiceQty]  DEFAULT (0) FOR [InvoiceQty]
GO
/****** Object:  Default [DF_TrnInvoiceServiceDtl_ServiceAmt]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnInvoiceServiceDtl] ADD  CONSTRAINT [DF_TrnInvoiceServiceDtl_ServiceAmt]  DEFAULT (0) FOR [ServiceAmt]
GO
/****** Object:  Default [DF_DeliveryNoteLiftDtl_BalanceStockInQty]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl] ADD  CONSTRAINT [DF_DeliveryNoteLiftDtl_BalanceStockInQty]  DEFAULT (0) FOR [BalanceStockInQty]
GO
/****** Object:  Default [DF_DeliveryNoteLiftDtl_LiftQty]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl] ADD  CONSTRAINT [DF_DeliveryNoteLiftDtl_LiftQty]  DEFAULT (0) FOR [LiftQty]
GO
/****** Object:  ForeignKey [FK_MstOption_MstUserType]    Script Date: 02/28/2018 23:58:23 ******/
ALTER TABLE [dbo].[MstOption]  WITH CHECK ADD  CONSTRAINT [FK_MstOption_MstUserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[MstUserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[MstOption] CHECK CONSTRAINT [FK_MstOption_MstUserType]
GO
/****** Object:  ForeignKey [FK_MstUserAccess_MstOption]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[MstUserAccess]  WITH CHECK ADD  CONSTRAINT [FK_MstUserAccess_MstOption] FOREIGN KEY([OptionID])
REFERENCES [dbo].[MstOption] ([OptionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MstUserAccess] CHECK CONSTRAINT [FK_MstUserAccess_MstOption]
GO
/****** Object:  ForeignKey [FK_MstUserAccess_MstUser]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[MstUserAccess]  WITH CHECK ADD  CONSTRAINT [FK_MstUserAccess_MstUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[MstUser] ([UserID])
GO
ALTER TABLE [dbo].[MstUserAccess] CHECK CONSTRAINT [FK_MstUserAccess_MstUser]
GO
/****** Object:  ForeignKey [FK_MstUser_MstBranch]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[MstUser]  WITH NOCHECK ADD  CONSTRAINT [FK_MstUser_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstUser] CHECK CONSTRAINT [FK_MstUser_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstUser_MstCompany]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[MstUser]  WITH CHECK ADD  CONSTRAINT [FK_MstUser_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstUser] CHECK CONSTRAINT [FK_MstUser_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstUser_MstUserType]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[MstUser]  WITH CHECK ADD  CONSTRAINT [FK_MstUser_MstUserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[MstUserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[MstUser] CHECK CONSTRAINT [FK_MstUser_MstUserType]
GO
/****** Object:  ForeignKey [FK_UserLogIN_MstUser]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[UserLogIN]  WITH CHECK ADD  CONSTRAINT [FK_UserLogIN_MstUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[MstUser] ([UserID])
GO
ALTER TABLE [dbo].[UserLogIN] CHECK CONSTRAINT [FK_UserLogIN_MstUser]
GO
/****** Object:  ForeignKey [FK_UserLog_MstUser]    Script Date: 02/28/2018 23:58:26 ******/
ALTER TABLE [dbo].[UserLog]  WITH CHECK ADD  CONSTRAINT [FK_UserLog_MstUser] FOREIGN KEY([LogUser])
REFERENCES [dbo].[MstUser] ([UserID])
GO
ALTER TABLE [dbo].[UserLog] CHECK CONSTRAINT [FK_UserLog_MstUser]
GO
/****** Object:  ForeignKey [FK_MstBranch_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstBranch]  WITH NOCHECK ADD  CONSTRAINT [FK_MstBranch_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstBranch] CHECK CONSTRAINT [FK_MstBranch_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnProformaInvoiceDtl_TrnProformaInvoiceHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnProformaInvoiceDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnProformaInvoiceDtl_TrnProformaInvoiceHdr] FOREIGN KEY([ProformaInvNo])
REFERENCES [dbo].[TrnProformaInvoiceHdr] ([ProformaInvNo])
GO
ALTER TABLE [dbo].[TrnProformaInvoiceDtl] CHECK CONSTRAINT [FK_TrnProformaInvoiceDtl_TrnProformaInvoiceHdr]
GO
/****** Object:  ForeignKey [FK_MstFinYear_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstFinYear]  WITH NOCHECK ADD  CONSTRAINT [FK_MstFinYear_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstFinYear] CHECK CONSTRAINT [FK_MstFinYear_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstFinYear_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstFinYear]  WITH CHECK ADD  CONSTRAINT [FK_MstFinYear_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstFinYear] CHECK CONSTRAINT [FK_MstFinYear_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstDepartment_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstDepartment]  WITH NOCHECK ADD  CONSTRAINT [FK_MstDepartment_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstDepartment] CHECK CONSTRAINT [FK_MstDepartment_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstDepartment_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstDepartment]  WITH CHECK ADD  CONSTRAINT [FK_MstDepartment_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstDepartment] CHECK CONSTRAINT [FK_MstDepartment_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstLabourCategory_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstLabourCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_MstLabourCategory_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstLabourCategory] CHECK CONSTRAINT [FK_MstLabourCategory_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstLabourCategory_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstLabourCategory]  WITH CHECK ADD  CONSTRAINT [FK_MstLabourCategory_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstLabourCategory] CHECK CONSTRAINT [FK_MstLabourCategory_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstCustomer_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstCustomer]  WITH NOCHECK ADD  CONSTRAINT [FK_MstCustomer_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstCustomer] CHECK CONSTRAINT [FK_MstCustomer_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstCustomer_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstCustomer]  WITH NOCHECK ADD  CONSTRAINT [FK_MstCustomer_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstCustomer] CHECK CONSTRAINT [FK_MstCustomer_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstServiceItem_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstServiceItem]  WITH NOCHECK ADD  CONSTRAINT [FK_MstServiceItem_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstServiceItem] CHECK CONSTRAINT [FK_MstServiceItem_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstServiceItem_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstServiceItem]  WITH NOCHECK ADD  CONSTRAINT [FK_MstServiceItem_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstServiceItem] CHECK CONSTRAINT [FK_MstServiceItem_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstProductGroup_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProductGroup]  WITH NOCHECK ADD  CONSTRAINT [FK_MstProductGroup_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstProductGroup] CHECK CONSTRAINT [FK_MstProductGroup_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstProductGroup_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_MstProductGroup_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstProductGroup] CHECK CONSTRAINT [FK_MstProductGroup_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstManufacturer_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstManufacturer]  WITH CHECK ADD  CONSTRAINT [FK_MstManufacturer_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstManufacturer] CHECK CONSTRAINT [FK_MstManufacturer_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstManufacturer_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstManufacturer]  WITH CHECK ADD  CONSTRAINT [FK_MstManufacturer_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstManufacturer] CHECK CONSTRAINT [FK_MstManufacturer_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstStockPoint_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstStockPoint]  WITH NOCHECK ADD  CONSTRAINT [FK_MstStockPoint_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstStockPoint] CHECK CONSTRAINT [FK_MstStockPoint_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstStockPoint_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstStockPoint]  WITH NOCHECK ADD  CONSTRAINT [FK_MstStockPoint_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstStockPoint] CHECK CONSTRAINT [FK_MstStockPoint_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstSupplier_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSupplier]  WITH NOCHECK ADD  CONSTRAINT [FK_MstSupplier_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstSupplier] CHECK CONSTRAINT [FK_MstSupplier_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstSupplier_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSupplier]  WITH NOCHECK ADD  CONSTRAINT [FK_MstSupplier_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstSupplier] CHECK CONSTRAINT [FK_MstSupplier_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstSetup_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSetup]  WITH NOCHECK ADD  CONSTRAINT [FK_MstSetup_MstBranch] FOREIGN KEY([SetupBranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstSetup] CHECK CONSTRAINT [FK_MstSetup_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstSetup_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSetup]  WITH CHECK ADD  CONSTRAINT [FK_MstSetup_MstCompany] FOREIGN KEY([SetupCompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstSetup] CHECK CONSTRAINT [FK_MstSetup_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstSetup_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSetup]  WITH CHECK ADD  CONSTRAINT [FK_MstSetup_MstFinYear] FOREIGN KEY([CurrentFinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[MstSetup] CHECK CONSTRAINT [FK_MstSetup_MstFinYear]
GO
/****** Object:  ForeignKey [FK_MstProduct_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_MstProduct_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstProduct] CHECK CONSTRAINT [FK_MstProduct_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstProduct_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_MstProduct_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstProduct] CHECK CONSTRAINT [FK_MstProduct_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstProduct_MstManufacturer]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProduct]  WITH CHECK ADD  CONSTRAINT [FK_MstProduct_MstManufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[MstManufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[MstProduct] CHECK CONSTRAINT [FK_MstProduct_MstManufacturer]
GO
/****** Object:  ForeignKey [FK_MstProduct_MstProductGroup]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_MstProduct_MstProductGroup] FOREIGN KEY([ProductGroupID])
REFERENCES [dbo].[MstProductGroup] ([ProductGroupID])
GO
ALTER TABLE [dbo].[MstProduct] CHECK CONSTRAINT [FK_MstProduct_MstProductGroup]
GO
/****** Object:  ForeignKey [FK_TrnJobHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr]  WITH CHECK ADD  CONSTRAINT [FK_TrnJobHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnJobHdr] CHECK CONSTRAINT [FK_TrnJobHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnJobHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr]  WITH CHECK ADD  CONSTRAINT [FK_TrnJobHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnJobHdr] CHECK CONSTRAINT [FK_TrnJobHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnJobHdr_MstCustomer]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr]  WITH CHECK ADD  CONSTRAINT [FK_TrnJobHdr_MstCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[MstCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[TrnJobHdr] CHECK CONSTRAINT [FK_TrnJobHdr_MstCustomer]
GO
/****** Object:  ForeignKey [FK_TrnJobHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr]  WITH CHECK ADD  CONSTRAINT [FK_TrnJobHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnJobHdr] CHECK CONSTRAINT [FK_TrnJobHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnJobHdr_TrnJobHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobHdr_TrnJobHdr] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[MstCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[TrnJobHdr] CHECK CONSTRAINT [FK_TrnJobHdr_TrnJobHdr]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseOrderHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseOrderHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] CHECK CONSTRAINT [FK_TrnPurchaseOrderHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseOrderHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseOrderHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] CHECK CONSTRAINT [FK_TrnPurchaseOrderHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseOrderHdr_MstDepartment]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseOrderHdr_MstDepartment] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[MstDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] CHECK CONSTRAINT [FK_TrnPurchaseOrderHdr_MstDepartment]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseOrderHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseOrderHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] CHECK CONSTRAINT [FK_TrnPurchaseOrderHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseOrderHdr_MstProductGroup]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseOrderHdr_MstProductGroup] FOREIGN KEY([ProductGroupID])
REFERENCES [dbo].[MstProductGroup] ([ProductGroupID])
GO
ALTER TABLE [dbo].[TrnPurchaseOrderHdr] CHECK CONSTRAINT [FK_TrnPurchaseOrderHdr_MstProductGroup]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseInvoiceHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr] CHECK CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseInvoiceHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr] CHECK CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseInvoiceHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr] CHECK CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseInvoiceHdr_MstSupplier]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstSupplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[MstSupplier] ([SupplierID])
GO
ALTER TABLE [dbo].[TrnPurchaseInvoiceHdr] CHECK CONSTRAINT [FK_TrnPurchaseInvoiceHdr_MstSupplier]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferHdr]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockTransferHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnStockTransferHdr] CHECK CONSTRAINT [FK_TrnStockTransferHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferHdr]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockTransferHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnStockTransferHdr] CHECK CONSTRAINT [FK_TrnStockTransferHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferHdr]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockTransferHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnStockTransferHdr] CHECK CONSTRAINT [FK_TrnStockTransferHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockTransferDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnStockTransferDtl] CHECK CONSTRAINT [FK_TrnStockTransferDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferDtl_TrnStockTransferHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockTransferDtl_TrnStockTransferHdr] FOREIGN KEY([StockTransferNo])
REFERENCES [dbo].[TrnStockTransferHdr] ([StockTransferNo])
GO
ALTER TABLE [dbo].[TrnStockTransferDtl] CHECK CONSTRAINT [FK_TrnStockTransferDtl_TrnStockTransferHdr]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] CHECK CONSTRAINT [FK_TrnStockAdjustmentHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] CHECK CONSTRAINT [FK_TrnStockAdjustmentHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] CHECK CONSTRAINT [FK_TrnStockAdjustmentHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentHdr_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentHdr_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] CHECK CONSTRAINT [FK_TrnStockAdjustmentHdr_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentHdr_MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentHdr_MstStockPoint] FOREIGN KEY([StockPointID])
REFERENCES [dbo].[MstStockPoint] ([StockPointID])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentHdr] CHECK CONSTRAINT [FK_TrnStockAdjustmentHdr_MstStockPoint]
GO
/****** Object:  ForeignKey [FK_TrnStockInDtl_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockInDtl_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnStockInDtl] CHECK CONSTRAINT [FK_TrnStockInDtl_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnStockInDtl_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockInDtl_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnStockInDtl] CHECK CONSTRAINT [FK_TrnStockInDtl_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnStockInDtl_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockInDtl_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnStockInDtl] CHECK CONSTRAINT [FK_TrnStockInDtl_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnStockInDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockInDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnStockInDtl] CHECK CONSTRAINT [FK_TrnStockInDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnStockInDtl_MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockInDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockInDtl_MstStockPoint] FOREIGN KEY([StockPointID])
REFERENCES [dbo].[MstStockPoint] ([StockPointID])
GO
ALTER TABLE [dbo].[TrnStockInDtl] CHECK CONSTRAINT [FK_TrnStockInDtl_MstStockPoint]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseInvoiceDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseInvoiceDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl] CHECK CONSTRAINT [FK_TrnPurchaseInvoiceDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseInvoiceDtl_TrnPurchaseInvoiceHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseInvoiceDtl_TrnPurchaseInvoiceHdr] FOREIGN KEY([PurchaseInvNo])
REFERENCES [dbo].[TrnPurchaseInvoiceHdr] ([PurchaseInvNo])
GO
ALTER TABLE [dbo].[TrnPurchaseInvoiceDtl] CHECK CONSTRAINT [FK_TrnPurchaseInvoiceDtl_TrnPurchaseInvoiceHdr]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseOrderDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseOrderDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnPurchaseOrderDtl] CHECK CONSTRAINT [FK_TrnPurchaseOrderDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnPurchaseOrderDtl_TrnPurchaseOrderHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnPurchaseOrderDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnPurchaseOrderDtl_TrnPurchaseOrderHdr] FOREIGN KEY([PurchaseOrderNo])
REFERENCES [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo])
GO
ALTER TABLE [dbo].[TrnPurchaseOrderDtl] CHECK CONSTRAINT [FK_TrnPurchaseOrderDtl_TrnPurchaseOrderHdr]
GO
/****** Object:  ForeignKey [FK_TrnGRNHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnGRNHdr] CHECK CONSTRAINT [FK_TrnGRNHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnGRNHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnGRNHdr] CHECK CONSTRAINT [FK_TrnGRNHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnGRNHdr_MstCustomer]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNHdr_MstCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[MstCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[TrnGRNHdr] CHECK CONSTRAINT [FK_TrnGRNHdr_MstCustomer]
GO
/****** Object:  ForeignKey [FK_TrnGRNHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnGRNHdr] CHECK CONSTRAINT [FK_TrnGRNHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnGRNHdr_MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNHdr_MstStockPoint] FOREIGN KEY([StockPointID])
REFERENCES [dbo].[MstStockPoint] ([StockPointID])
GO
ALTER TABLE [dbo].[TrnGRNHdr] CHECK CONSTRAINT [FK_TrnGRNHdr_MstStockPoint]
GO
/****** Object:  ForeignKey [FK_TrnGRNHdr_MstSupplier]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNHdr_MstSupplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[MstSupplier] ([SupplierID])
GO
ALTER TABLE [dbo].[TrnGRNHdr] CHECK CONSTRAINT [FK_TrnGRNHdr_MstSupplier]
GO
/****** Object:  ForeignKey [FK_TrnGRNHdr_TrnPurchaseOrderHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNHdr_TrnPurchaseOrderHdr] FOREIGN KEY([PurchaseOrderNo])
REFERENCES [dbo].[TrnPurchaseOrderHdr] ([PurchaseOrderNo])
GO
ALTER TABLE [dbo].[TrnGRNHdr] CHECK CONSTRAINT [FK_TrnGRNHdr_TrnPurchaseOrderHdr]
GO
/****** Object:  ForeignKey [FK_TrnJobProductIssueDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobProductIssueDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnJobProductIssueDtl] CHECK CONSTRAINT [FK_TrnJobProductIssueDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnJobProductIssueDtl_MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnJobProductIssueDtl_MstStockPoint] FOREIGN KEY([StockPointID])
REFERENCES [dbo].[MstStockPoint] ([StockPointID])
GO
ALTER TABLE [dbo].[TrnJobProductIssueDtl] CHECK CONSTRAINT [FK_TrnJobProductIssueDtl_MstStockPoint]
GO
/****** Object:  ForeignKey [FK_TrnJobProductIssueDtl_TrnJobHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobProductIssueDtl_TrnJobHdr] FOREIGN KEY([JobNo])
REFERENCES [dbo].[TrnJobHdr] ([JobNo])
GO
ALTER TABLE [dbo].[TrnJobProductIssueDtl] CHECK CONSTRAINT [FK_TrnJobProductIssueDtl_TrnJobHdr]
GO
/****** Object:  ForeignKey [FK_TrnJobLabWorkDtl_TrnJobHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobLabWorkDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobLabWorkDtl_TrnJobHdr] FOREIGN KEY([JobNo])
REFERENCES [dbo].[TrnJobHdr] ([JobNo])
GO
ALTER TABLE [dbo].[TrnJobLabWorkDtl] CHECK CONSTRAINT [FK_TrnJobLabWorkDtl_TrnJobHdr]
GO
/****** Object:  ForeignKey [FK_TrnJobLabWorkDtl_TrnJobLabWorkDtl]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobLabWorkDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobLabWorkDtl_TrnJobLabWorkDtl] FOREIGN KEY([LabourCategoryID])
REFERENCES [dbo].[MstLabourCategory] ([LabourCategoryID])
GO
ALTER TABLE [dbo].[TrnJobLabWorkDtl] CHECK CONSTRAINT [FK_TrnJobLabWorkDtl_TrnJobLabWorkDtl]
GO
/****** Object:  ForeignKey [FK_TrnCurrentStock_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock]  WITH CHECK ADD  CONSTRAINT [FK_TrnCurrentStock_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnCurrentStock] CHECK CONSTRAINT [FK_TrnCurrentStock_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnCurrentStock_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock]  WITH CHECK ADD  CONSTRAINT [FK_TrnCurrentStock_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnCurrentStock] CHECK CONSTRAINT [FK_TrnCurrentStock_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnCurrentStock_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock]  WITH CHECK ADD  CONSTRAINT [FK_TrnCurrentStock_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnCurrentStock] CHECK CONSTRAINT [FK_TrnCurrentStock_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnCurrentStock_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnCurrentStock_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnCurrentStock] CHECK CONSTRAINT [FK_TrnCurrentStock_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnCurrentStock_MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnCurrentStock]  WITH CHECK ADD  CONSTRAINT [FK_TrnCurrentStock_MstStockPoint] FOREIGN KEY([StockPointID])
REFERENCES [dbo].[MstStockPoint] ([StockPointID])
GO
ALTER TABLE [dbo].[TrnCurrentStock] CHECK CONSTRAINT [FK_TrnCurrentStock_MstStockPoint]
GO
/****** Object:  ForeignKey [FK_MstSupplierRate_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSupplierRate]  WITH NOCHECK ADD  CONSTRAINT [FK_MstSupplierRate_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstSupplierRate] CHECK CONSTRAINT [FK_MstSupplierRate_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstSupplierRate_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSupplierRate]  WITH CHECK ADD  CONSTRAINT [FK_MstSupplierRate_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstSupplierRate] CHECK CONSTRAINT [FK_MstSupplierRate_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstSupplierRate_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSupplierRate]  WITH NOCHECK ADD  CONSTRAINT [FK_MstSupplierRate_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[MstSupplierRate] CHECK CONSTRAINT [FK_MstSupplierRate_MstProduct]
GO
/****** Object:  ForeignKey [FK_MstSupplierRate_MstSupplier]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstSupplierRate]  WITH CHECK ADD  CONSTRAINT [FK_MstSupplierRate_MstSupplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[MstSupplier] ([SupplierID])
GO
ALTER TABLE [dbo].[MstSupplierRate] CHECK CONSTRAINT [FK_MstSupplierRate_MstSupplier]
GO
/****** Object:  ForeignKey [FK_MstOpeningStock_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_MstOpeningStock_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[MstOpeningStock] CHECK CONSTRAINT [FK_MstOpeningStock_MstProduct]
GO
/****** Object:  ForeignKey [FK_MstOpeningStock_MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_MstOpeningStock_MstStockPoint] FOREIGN KEY([StockPointID])
REFERENCES [dbo].[MstStockPoint] ([StockPointID])
GO
ALTER TABLE [dbo].[MstOpeningStock] CHECK CONSTRAINT [FK_MstOpeningStock_MstStockPoint]
GO
/****** Object:  ForeignKey [FK_MstProductRate_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProductRate]  WITH NOCHECK ADD  CONSTRAINT [FK_MstProductRate_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[MstProductRate] CHECK CONSTRAINT [FK_MstProductRate_MstBranch]
GO
/****** Object:  ForeignKey [FK_MstProductRate_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProductRate]  WITH CHECK ADD  CONSTRAINT [FK_MstProductRate_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MstProductRate] CHECK CONSTRAINT [FK_MstProductRate_MstCompany]
GO
/****** Object:  ForeignKey [FK_MstProductRate_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[MstProductRate]  WITH NOCHECK ADD  CONSTRAINT [FK_MstProductRate_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[MstProductRate] CHECK CONSTRAINT [FK_MstProductRate_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] CHECK CONSTRAINT [FK_TrnDeliveryNoteHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] CHECK CONSTRAINT [FK_TrnDeliveryNoteHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteHdr_MstCustomer]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteHdr_MstCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[MstCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] CHECK CONSTRAINT [FK_TrnDeliveryNoteHdr_MstCustomer]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] CHECK CONSTRAINT [FK_TrnDeliveryNoteHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteHdr_MstSupplier]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteHdr_MstSupplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[MstSupplier] ([SupplierID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] CHECK CONSTRAINT [FK_TrnDeliveryNoteHdr_MstSupplier]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteHdr_TrnGRNHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteHdr_TrnGRNHdr] FOREIGN KEY([GRNNo])
REFERENCES [dbo].[TrnGRNHdr] ([GRNNo])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] CHECK CONSTRAINT [FK_TrnDeliveryNoteHdr_TrnGRNHdr]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteHdr_TrnProformaInvoiceHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteHdr_TrnProformaInvoiceHdr] FOREIGN KEY([ProformaInvNo])
REFERENCES [dbo].[TrnProformaInvoiceHdr] ([ProformaInvNo])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteHdr] CHECK CONSTRAINT [FK_TrnDeliveryNoteHdr_TrnProformaInvoiceHdr]
GO
/****** Object:  ForeignKey [FK_TrnGRNDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnGRNDtl] CHECK CONSTRAINT [FK_TrnGRNDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnGRNDtl_TrnGRNHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnGRNDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnGRNDtl_TrnGRNHdr] FOREIGN KEY([GRNNo])
REFERENCES [dbo].[TrnGRNHdr] ([GRNNo])
GO
ALTER TABLE [dbo].[TrnGRNDtl] CHECK CONSTRAINT [FK_TrnGRNDtl_TrnGRNHdr]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferLiftDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockTransferLiftDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnStockTransferLiftDtl] CHECK CONSTRAINT [FK_TrnStockTransferLiftDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferLiftDtl_TrnStockInDtl]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockTransferLiftDtl_TrnStockInDtl] FOREIGN KEY([StockInDtlID])
REFERENCES [dbo].[TrnStockInDtl] ([StockInDtlID])
GO
ALTER TABLE [dbo].[TrnStockTransferLiftDtl] CHECK CONSTRAINT [FK_TrnStockTransferLiftDtl_TrnStockInDtl]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferLiftDtl_TrnStockTransferDtl]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferLiftDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockTransferLiftDtl_TrnStockTransferDtl] FOREIGN KEY([StockTransferDtlID])
REFERENCES [dbo].[TrnStockTransferDtl] ([StockTransferDtlID])
GO
ALTER TABLE [dbo].[TrnStockTransferLiftDtl] CHECK CONSTRAINT [FK_TrnStockTransferLiftDtl_TrnStockTransferDtl]
GO
/****** Object:  ForeignKey [FK_TrnStockTransferLiftDtl_TrnStockTransferHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockTransferLiftDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockTransferLiftDtl_TrnStockTransferHdr] FOREIGN KEY([StockTransferNo])
REFERENCES [dbo].[TrnStockTransferHdr] ([StockTransferNo])
GO
ALTER TABLE [dbo].[TrnStockTransferLiftDtl] CHECK CONSTRAINT [FK_TrnStockTransferLiftDtl_TrnStockTransferHdr]
GO
/****** Object:  ForeignKey [FK_TrnJobProductIssueLiftDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobProductIssueLiftDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl] CHECK CONSTRAINT [FK_TrnJobProductIssueLiftDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnJobProductIssueLiftDtl_TrnJobHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnJobProductIssueLiftDtl_TrnJobHdr] FOREIGN KEY([JobNo])
REFERENCES [dbo].[TrnJobHdr] ([JobNo])
GO
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl] CHECK CONSTRAINT [FK_TrnJobProductIssueLiftDtl_TrnJobHdr]
GO
/****** Object:  ForeignKey [FK_TrnJobProductIssueLiftDtl_TrnJobProductIssueDtl]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobProductIssueLiftDtl_TrnJobProductIssueDtl] FOREIGN KEY([JobProductIssueDtlID])
REFERENCES [dbo].[TrnJobProductIssueDtl] ([JobProductIssueDtlID])
GO
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl] CHECK CONSTRAINT [FK_TrnJobProductIssueLiftDtl_TrnJobProductIssueDtl]
GO
/****** Object:  ForeignKey [FK_TrnJobProductIssueLiftDtl_TrnStockInDtl]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnJobProductIssueLiftDtl_TrnStockInDtl] FOREIGN KEY([StockInDtlID])
REFERENCES [dbo].[TrnStockInDtl] ([StockInDtlID])
GO
ALTER TABLE [dbo].[TrnJobProductIssueLiftDtl] CHECK CONSTRAINT [FK_TrnJobProductIssueLiftDtl_TrnStockInDtl]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentDtl] CHECK CONSTRAINT [FK_TrnStockAdjustmentDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentDtl_TrnStockAdjustmentHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentDtl_TrnStockAdjustmentHdr] FOREIGN KEY([StockAdjustmentNo])
REFERENCES [dbo].[TrnStockAdjustmentHdr] ([StockAdjustmentNo])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentDtl] CHECK CONSTRAINT [FK_TrnStockAdjustmentDtl_TrnStockAdjustmentHdr]
GO
/****** Object:  ForeignKey [FK_TrnStockAdjustmentDtl_TrnStockInDtl]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockAdjustmentDtl]  WITH CHECK ADD  CONSTRAINT [FK_TrnStockAdjustmentDtl_TrnStockInDtl] FOREIGN KEY([StockInDtlID])
REFERENCES [dbo].[TrnStockInDtl] ([StockInDtlID])
GO
ALTER TABLE [dbo].[TrnStockAdjustmentDtl] CHECK CONSTRAINT [FK_TrnStockAdjustmentDtl_TrnStockInDtl]
GO
/****** Object:  ForeignKey [FK_TrnStockOutDtl_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockOutDtl_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnStockOutDtl] CHECK CONSTRAINT [FK_TrnStockOutDtl_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnStockOutDtl_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockOutDtl_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnStockOutDtl] CHECK CONSTRAINT [FK_TrnStockOutDtl_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnStockOutDtl_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockOutDtl_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnStockOutDtl] CHECK CONSTRAINT [FK_TrnStockOutDtl_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnStockOutDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockOutDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnStockOutDtl] CHECK CONSTRAINT [FK_TrnStockOutDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnStockOutDtl_MstStockPoint]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockOutDtl_MstStockPoint] FOREIGN KEY([StockPointID])
REFERENCES [dbo].[MstStockPoint] ([StockPointID])
GO
ALTER TABLE [dbo].[TrnStockOutDtl] CHECK CONSTRAINT [FK_TrnStockOutDtl_MstStockPoint]
GO
/****** Object:  ForeignKey [FK_TrnStockOutDtl_TrnStockInDtl]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnStockOutDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnStockOutDtl_TrnStockInDtl] FOREIGN KEY([StockInDtlID])
REFERENCES [dbo].[TrnStockInDtl] ([StockInDtlID])
GO
ALTER TABLE [dbo].[TrnStockOutDtl] CHECK CONSTRAINT [FK_TrnStockOutDtl_TrnStockInDtl]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceHdr_MstBranch]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceHdr_MstBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MstBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TrnInvoiceHdr] CHECK CONSTRAINT [FK_TrnInvoiceHdr_MstBranch]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceHdr_MstCompany]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceHdr_MstCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MstCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[TrnInvoiceHdr] CHECK CONSTRAINT [FK_TrnInvoiceHdr_MstCompany]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceHdr_MstCustomer]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceHdr_MstCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[MstCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[TrnInvoiceHdr] CHECK CONSTRAINT [FK_TrnInvoiceHdr_MstCustomer]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceHdr_MstFinYear]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceHdr_MstFinYear] FOREIGN KEY([FinYearID])
REFERENCES [dbo].[MstFinYear] ([FinYearID])
GO
ALTER TABLE [dbo].[TrnInvoiceHdr] CHECK CONSTRAINT [FK_TrnInvoiceHdr_MstFinYear]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceHdr_TrnDeliveryNoteHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceHdr_TrnDeliveryNoteHdr] FOREIGN KEY([DeliveryNoteNo])
REFERENCES [dbo].[TrnDeliveryNoteHdr] ([DeliveryNoteNo])
GO
ALTER TABLE [dbo].[TrnInvoiceHdr] CHECK CONSTRAINT [FK_TrnInvoiceHdr_TrnDeliveryNoteHdr]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceHdr_TrnJobHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnInvoiceHdr]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceHdr_TrnJobHdr] FOREIGN KEY([JobNo])
REFERENCES [dbo].[TrnJobHdr] ([JobNo])
GO
ALTER TABLE [dbo].[TrnInvoiceHdr] CHECK CONSTRAINT [FK_TrnInvoiceHdr_TrnJobHdr]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteDtl_MstProduct]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteDtl] CHECK CONSTRAINT [FK_TrnDeliveryNoteDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteDtl_TrnDeliveryNoteHdr]    Script Date: 02/28/2018 23:58:27 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteDtl_TrnDeliveryNoteHdr] FOREIGN KEY([DeliveryNoteNo])
REFERENCES [dbo].[TrnDeliveryNoteHdr] ([DeliveryNoteNo])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteDtl] CHECK CONSTRAINT [FK_TrnDeliveryNoteDtl_TrnDeliveryNoteHdr]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceServiceDtl_MstServiceItem]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnInvoiceServiceDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceServiceDtl_MstServiceItem] FOREIGN KEY([ServiceItemID])
REFERENCES [dbo].[MstServiceItem] ([ServiceItemID])
GO
ALTER TABLE [dbo].[TrnInvoiceServiceDtl] CHECK CONSTRAINT [FK_TrnInvoiceServiceDtl_MstServiceItem]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceServiceDtl_TrnInvoiceHdr]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnInvoiceServiceDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceServiceDtl_TrnInvoiceHdr] FOREIGN KEY([InvoiceNo])
REFERENCES [dbo].[TrnInvoiceHdr] ([InvoiceNo])
GO
ALTER TABLE [dbo].[TrnInvoiceServiceDtl] CHECK CONSTRAINT [FK_TrnInvoiceServiceDtl_TrnInvoiceHdr]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceSaleDtl_MstProduct]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnInvoiceSaleDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceSaleDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnInvoiceSaleDtl] CHECK CONSTRAINT [FK_TrnInvoiceSaleDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnInvoiceSaleDtl_TrnInvoiceHdr]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnInvoiceSaleDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnInvoiceSaleDtl_TrnInvoiceHdr] FOREIGN KEY([InvoiceNo])
REFERENCES [dbo].[TrnInvoiceHdr] ([InvoiceNo])
GO
ALTER TABLE [dbo].[TrnInvoiceSaleDtl] CHECK CONSTRAINT [FK_TrnInvoiceSaleDtl_TrnInvoiceHdr]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteLiftDtl_MstProduct]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_MstProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MstProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl] CHECK CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_MstProduct]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteLiftDtl_TrnDeliveryNoteDtl]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_TrnDeliveryNoteDtl] FOREIGN KEY([DeliveryNoteDtlID])
REFERENCES [dbo].[TrnDeliveryNoteDtl] ([DeliveryNoteDtlID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl] CHECK CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_TrnDeliveryNoteDtl]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteLiftDtl_TrnDeliveryNoteHdr]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_TrnDeliveryNoteHdr] FOREIGN KEY([DeliveryNoteNo])
REFERENCES [dbo].[TrnDeliveryNoteHdr] ([DeliveryNoteNo])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl] CHECK CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_TrnDeliveryNoteHdr]
GO
/****** Object:  ForeignKey [FK_TrnDeliveryNoteLiftDtl_TrnStockInDtl]    Script Date: 02/28/2018 23:58:28 ******/
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl]  WITH NOCHECK ADD  CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_TrnStockInDtl] FOREIGN KEY([StockInDtlID])
REFERENCES [dbo].[TrnStockInDtl] ([StockInDtlID])
GO
ALTER TABLE [dbo].[TrnDeliveryNoteLiftDtl] CHECK CONSTRAINT [FK_TrnDeliveryNoteLiftDtl_TrnStockInDtl]
GO
