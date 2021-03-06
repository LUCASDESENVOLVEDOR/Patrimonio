USE [Patrimonio]
GO
/****** Object:  Table [dbo].[comentarios]    Script Date: 02/02/2022 21:07:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comentarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEquipamentos] [int] NOT NULL,
	[idPerfils] [int] NOT NULL,
	[comentario] [varchar](255) NULL,
	[data_cadastro] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipamentos]    Script Date: 02/02/2022 21:07:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipamentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagem] [varchar](255) NOT NULL,
	[descricao] [varchar](255) NOT NULL,
	[ativo] [bit] NOT NULL,
	[data_cadastro] [datetime] NOT NULL,
	[nomePatrimonio] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfils]    Script Date: 02/02/2022 21:07:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfils](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[perfil] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 02/02/2022 21:07:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPerfils] [int] NOT NULL,
	[senha] [varchar](30) NOT NULL,
	[email] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[equipamentos] ON 

INSERT [dbo].[equipamentos] ([id], [imagem], [descricao], [ativo], [data_cadastro], [nomePatrimonio]) VALUES (9, N'2d55e81a-6277-47f4-be6f-5c364993eb57.png', N'987897897889', 1, CAST(N'2022-02-02T20:58:49.027' AS DateTime), N'Paulo')
SET IDENTITY_INSERT [dbo].[equipamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[perfils] ON 

INSERT [dbo].[perfils] ([id], [perfil]) VALUES (1, N'comum')
INSERT [dbo].[perfils] ([id], [perfil]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[perfils] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [idPerfils], [senha], [email]) VALUES (3, 1, N'123456789', N'paulo@email.com')
INSERT [dbo].[usuarios] ([id], [idPerfils], [senha], [email]) VALUES (4, 2, N'987654321', N'priscila@email.com')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[comentarios] ADD  DEFAULT (getdate()) FOR [data_cadastro]
GO
ALTER TABLE [dbo].[equipamentos] ADD  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [dbo].[equipamentos] ADD  DEFAULT (getdate()) FOR [data_cadastro]
GO
ALTER TABLE [dbo].[comentarios]  WITH CHECK ADD FOREIGN KEY([idEquipamentos])
REFERENCES [dbo].[equipamentos] ([id])
GO
ALTER TABLE [dbo].[comentarios]  WITH CHECK ADD FOREIGN KEY([idPerfils])
REFERENCES [dbo].[perfils] ([id])
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([idPerfils])
REFERENCES [dbo].[perfils] ([id])
GO
