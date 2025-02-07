USE [master]
GO

USE [DBWEBSHOE]
GO

DROP TABLE IF EXISTS [OrderDetail];
DROP TABLE IF EXISTS [Orders];
DROP TABLE IF EXISTS [UserDetail];
DROP TABLE IF EXISTS [Users];
DROP TABLE IF EXISTS [ProductImg];
DROP TABLE IF EXISTS [Product];
DROP TABLE IF EXISTS [ProductCategory];

CREATE TABLE [ProductCategory] (
    categoryID INT NOT NULL PRIMARY KEY,  -- Khóa chính
    Name NVARCHAR(100) NOT NULL            -- Tên danh mục
);

CREATE TABLE [Product] (
    productID NVARCHAR(50) NOT NULL PRIMARY KEY,    -- Khóa chính (đã thay đổi từ INT sang NVARCHAR)
    categoryID INT NOT NULL,                         -- Khóa ngoại
    name NVARCHAR(100) NOT NULL,                     -- Tên sản phẩm
    price FLOAT NOT NULL,                             -- Giá sản phẩm
    quantity NVARCHAR(50) NOT NULL,                  -- Số lượng
    status BIT NOT NULL,                              -- Trạng thái
    FOREIGN KEY (categoryID) REFERENCES ProductCategory(categoryID)  -- Khóa ngoại
);

CREATE TABLE [ProductImg] (
    imgID INT NOT NULL PRIMARY KEY,         -- Khóa chính
    productID NVARCHAR(50) NOT NULL,       -- Khóa ngoại (đã thay đổi từ INT sang NVARCHAR)
    address NVARCHAR(255) NOT NULL,        -- Địa chỉ hình ảnh
    FOREIGN KEY (productID) REFERENCES Product(productID)  -- Khóa ngoại
);

CREATE TABLE [Users](
	[userID] NVARCHAR(50) NOT NULL,
	[fullName] NVARCHAR(50) NULL,
	[password] NVARCHAR(50) NULL,
	[roleID] NVARCHAR(50) NULL,
	[status] BIT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [UserDetail] (
    userID NVARCHAR(50) NOT NULL,          -- Khóa ngoại
    Gender NVARCHAR(10) NOT NULL,
    PhoneNumber NVARCHAR(15) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    img NVARCHAR(255) NOT NULL,
    PRIMARY KEY (userID),
    FOREIGN KEY (userID) REFERENCES Users(userID)  -- Khóa ngoại
);

CREATE TABLE [Orders] (
    orderID INT PRIMARY KEY IDENTITY(1,1),
    userID NVARCHAR(50) NOT NULL,          -- Khóa ngoại
    total DECIMAL(10, 2) NOT NULL,
    [date] DATETIME NOT NULL,
    [status] [bit] NULL,
    FOREIGN KEY (userID) REFERENCES [dbo].[Users](userID)  -- Khóa ngoại
);

CREATE TABLE [OrderDetail](
	[orderID] INT NOT NULL,                 -- Khóa ngoại
	[productID] NVARCHAR(50) NOT NULL,     -- Khóa ngoại (đã thay đổi từ INT sang NVARCHAR)
	[price] FLOAT NULL,                     -- Giá sản phẩm
	[quantity] NVARCHAR(50) NULL,          -- Số lượng (đã thay đổi từ INT sang NVARCHAR)
	[status] [bit] NULL,
	PRIMARY KEY(orderID, productID),
	FOREIGN KEY(orderID) REFERENCES [dbo].[Orders](orderID),
	FOREIGN KEY(productID) REFERENCES [dbo].[Product](productID)  -- Khóa ngoại
);

INSERT [dbo].[Users] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'BaoLe', N'1', N'AD', 1)
INSERT [dbo].[Users] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'user', N'User 1', N'1', N'US', 1)
INSERT [dbo].[Users] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE184569', N'Le Truong Thien Bao', N'1', N'AD', 1)
