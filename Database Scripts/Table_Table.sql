USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Table]    Script Date: 2/16/2017 7:41:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Table](
	[TableNumber] [tinyint] NOT NULL DEFAULT ((0)),
	[Seats] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Table]  WITH CHECK ADD CHECK  (([Seats]<(15)))
GO

ALTER TABLE [dbo].[Table]  WITH CHECK ADD CHECK  (([Seats]<(15)))
GO

ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [RealSeat] CHECK  (([Seats]>(0) AND [Seats]<=(16)))
GO

ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [RealSeat]
GO


