SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[Status] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
)
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [InvoiceDate]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [PaidAmount]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD CHECK  (([Status]='Overdue' OR [Status]='Paid' OR [Status]='Pending'))
GO
