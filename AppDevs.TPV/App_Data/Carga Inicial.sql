/****** Object:  StoredProcedure [dbo].[SPC_SET_USUARIO]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_UNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_UNIDADESMEDIDAS]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PRODUCTOSUNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_PRODUCTOSUNIDADESMEDIDAS]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PRODUCTO]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_PRODUCTO]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PERMISOSPERFILES]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_PERMISOSPERFILES]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PERFIL]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_PERFIL]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_ORDENDETALLE]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_ORDENDETALLE]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_ORDEN]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_ORDEN]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_MESA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_MESA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_INFORMACIONEMPRESA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_INFORMACIONEMPRESA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_CATEGORIA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_CATEGORIA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_AREA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_SET_AREA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_USUARIO]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_UNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_UNIDADESMEDIDAS]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_TIPOPRODUCTO]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_TIPOPRODUCTO]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PRODUCTOSUNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_PRODUCTOSUNIDADESMEDIDAS]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PRODUCTO]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_PRODUCTO]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PERMISOSPERFILES]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_PERMISOSPERFILES]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PERMISO]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_PERMISO]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PERFIL]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_PERFIL]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_ORDENDETALLE]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_ORDENDETALLE]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_MESA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_MESA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_INFORMACIONEMPRESA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_INFORMACIONEMPRESA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_DATOSCONSULTA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_DATOSCONSULTA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_CATEGORIA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_CATEGORIA]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_AREA]    Script Date: 23/10/2016 11:14:02 ******/
DROP PROCEDURE [dbo].[SPC_GET_AREA]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Perfiles]
GO
ALTER TABLE [dbo].[ProductosUnidadesMedidas] DROP CONSTRAINT [FK_Producto_Unidad_Medida_UnidadesMedidas]
GO
ALTER TABLE [dbo].[ProductosUnidadesMedidas] DROP CONSTRAINT [FK_Producto_Unidad_Medida_Producto_Unidad_Medida]
GO
ALTER TABLE [dbo].[Productos] DROP CONSTRAINT [FK_Productos_TiposProductos]
GO
ALTER TABLE [dbo].[Productos] DROP CONSTRAINT [FK_Productos_CategoriasProductos]
GO
ALTER TABLE [dbo].[PermisosPerfiles] DROP CONSTRAINT [FK_PermisosPerfiles_Permisos]
GO
ALTER TABLE [dbo].[PermisosPerfiles] DROP CONSTRAINT [FK_PermisosPerfiles_Perfiles]
GO
ALTER TABLE [dbo].[OrdenesDetalles] DROP CONSTRAINT [FK_OrdenesDetalles_Usuarios]
GO
ALTER TABLE [dbo].[OrdenesDetalles] DROP CONSTRAINT [FK_OrdenesDetalles_ProductosUnidadesMedidas]
GO
ALTER TABLE [dbo].[OrdenesDetalles] DROP CONSTRAINT [FK_OrdenesDetalles_Productos_Extra]
GO
ALTER TABLE [dbo].[OrdenesDetalles] DROP CONSTRAINT [FK_OrdenesDetalles_Productos]
GO
ALTER TABLE [dbo].[OrdenesDetalles] DROP CONSTRAINT [FK_OrdenesDetalles_Ordenes]
GO
ALTER TABLE [dbo].[OrdenesDetalles] DROP CONSTRAINT [FK_OrdenesDetalles_EstadosOrdenDetalle]
GO
ALTER TABLE [dbo].[Ordenes] DROP CONSTRAINT [FK_Ordenes_Metodos_Pago]
GO
ALTER TABLE [dbo].[Ordenes] DROP CONSTRAINT [FK_Ordenes_Mesas]
GO
ALTER TABLE [dbo].[Ordenes] DROP CONSTRAINT [FK_Ordenes_EstadosOrden]
GO
ALTER TABLE [dbo].[Mesas] DROP CONSTRAINT [FK_Mesas_Areas]
GO
ALTER TABLE [dbo].[CategoriasProductos] DROP CONSTRAINT [FK_CategoriasProductos_CategoriasProductos]
GO
/****** Object:  View [dbo].[VW_CATEGORIAS]    Script Date: 23/10/2016 11:14:02 ******/
DROP VIEW [dbo].[VW_CATEGORIAS]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[UnidadesMedidas]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[UnidadesMedidas]
GO
/****** Object:  Table [dbo].[TiposProductos]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[TiposProductos]
GO
/****** Object:  Table [dbo].[ProductosUnidadesMedidas]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[ProductosUnidadesMedidas]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Productos]
GO
/****** Object:  Table [dbo].[PermisosPerfiles]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[PermisosPerfiles]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Permisos]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Perfiles]
GO
/****** Object:  Table [dbo].[OrdenesDetalles]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[OrdenesDetalles]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Ordenes]
GO
/****** Object:  Table [dbo].[Metodos_Pago]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Metodos_Pago]
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Mesas]
GO
/****** Object:  Table [dbo].[InformacionEmpresa]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[InformacionEmpresa]
GO
/****** Object:  Table [dbo].[EstadosOrdenDetalle]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[EstadosOrdenDetalle]
GO
/****** Object:  Table [dbo].[EstadosOrden]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[EstadosOrden]
GO
/****** Object:  Table [dbo].[CategoriasProductos]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[CategoriasProductos]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 23/10/2016 11:14:02 ******/
DROP TABLE [dbo].[Areas]
GO
/****** Object:  User [TPVUser]    Script Date: 23/10/2016 11:14:02 ******/
DROP USER [TPVUser]
GO
/****** Object:  User [TPVUser]    Script Date: 23/10/2016 11:14:02 ******/
CREATE USER [TPVUser] FOR LOGIN [TPVUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [TPVUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TPVUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TPVUser]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Areas](
	[Codigo_Area] [int] IDENTITY(1,1) NOT NULL,
	[Area] [varchar](50) NOT NULL,
	[Color_Area] [varchar](50) NULL,
	[Orden] [int] NOT NULL CONSTRAINT [DF_Areas_Orden]  DEFAULT ((0)),
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Areas_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[Codigo_Area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoriasProductos]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriasProductos](
	[Codigo_Categoria_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Categoria_Padre_Producto] [int] NULL,
	[Categoria_Producto] [varchar](50) NOT NULL,
	[Orden] [int] NOT NULL CONSTRAINT [DF_CategoriasProductos_Orden]  DEFAULT ((0)),
	[Activo] [bit] NOT NULL CONSTRAINT [DF_CategoriasProductos_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_CategoriasProductos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Categoria_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadosOrden]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadosOrden](
	[Codigo_Estado_Orden] [int] IDENTITY(1,1) NOT NULL,
	[Estado_Orden] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_EstadosOrden_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_EstadosOrden] PRIMARY KEY CLUSTERED 
(
	[Codigo_Estado_Orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadosOrdenDetalle]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadosOrdenDetalle](
	[Codigo_Estado_Orden_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[Estado_Orden_Detalle] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_EstadosOrdenDetalle_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_EstadosOrdenDetalle] PRIMARY KEY CLUSTERED 
(
	[Codigo_Estado_Orden_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InformacionEmpresa]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InformacionEmpresa](
	[IdInformacionEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpresa] [varchar](100) NOT NULL,
	[Direccion] [varchar](250) NULL,
	[CodigoPostal] [varchar](10) NULL,
	[Provincia] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[CIF] [varchar](20) NULL,
	[NIF] [varchar](20) NULL,
	[Telefono] [varchar](20) NULL,
	[Movil] [varchar](20) NULL,
	[Facebook] [varchar](100) NULL,
	[NombreImpresoraBarra] [varchar](100) NULL,
	[NombreImpresoraCocina] [varchar](100) NULL,
 CONSTRAINT [PK_InformacionEmpresa] PRIMARY KEY CLUSTERED 
(
	[IdInformacionEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mesas](
	[Codigo_Mesa] [int] IDENTITY(1,1) NOT NULL,
	[Mesa] [varchar](50) NOT NULL,
	[Codigo_Area] [int] NOT NULL,
	[Color_Mesa] [varchar](20) NOT NULL,
	[PosicionX] [varchar](10) NOT NULL,
	[PosicionY] [varchar](10) NOT NULL,
	[Base] [varchar](10) NOT NULL,
	[Altura] [varchar](10) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Mesas_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Mesas] PRIMARY KEY CLUSTERED 
(
	[Codigo_Mesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Metodos_Pago]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Metodos_Pago](
	[Codigo_Metodo_Pago] [int] IDENTITY(1,1) NOT NULL,
	[Metodo_Pago] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Metodos_Pago_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Metodos_Pago] PRIMARY KEY CLUSTERED 
(
	[Codigo_Metodo_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[Codigo_Orden] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Mesa] [int] NOT NULL,
	[Comensales] [int] NOT NULL CONSTRAINT [DF_Ordenes_Comensales]  DEFAULT ((1)),
	[Hora_Orden] [datetime] NOT NULL CONSTRAINT [DF_Ordenes_Hora_Orden]  DEFAULT (getdate()),
	[Codigo_Estado_Orden] [int] NOT NULL,
	[Codigo_Metodo_Pago] [int] NULL,
	[Hora_Pago] [datetime] NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Ordenes_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[Codigo_Orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdenesDetalles]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrdenesDetalles](
	[Codigo_Orden_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Orden] [int] NOT NULL,
	[Codigo_Producto] [int] NOT NULL,
	[Codigo_Producto_Unidad_Medida] [int] NULL,
	[Cantidad_Producto] [int] NOT NULL,
	[Codigo_Producto_Extra] [int] NULL,
	[Sub_Total_Precio_Producto] [money] NOT NULL,
	[Cantidad_Personas] [int] NULL,
	[Nota_Producto] [varchar](50) NULL,
	[Hora_Orden_Detalle] [datetime] NOT NULL CONSTRAINT [DF_OrdenesDetalles_Hora_Orden_Detalle]  DEFAULT (getdate()),
	[Codigo_Estado_Orden_Detalle] [int] NOT NULL CONSTRAINT [DF_OrdenesDetalles_Codigo_Estado_Orden_Detalle]  DEFAULT ((1)),
	[Codigo_Usuario] [int] NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_OrdenesDetalles_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Orden_Detalle] PRIMARY KEY CLUSTERED 
(
	[Codigo_Orden_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfiles](
	[Codigo_Perfil] [int] IDENTITY(1,1) NOT NULL,
	[Perfil] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Table_1_Puede_Modificar_Precios1]  DEFAULT ((1)),
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[Codigo_Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permisos](
	[Codigo_Permiso] [int] IDENTITY(1,1) NOT NULL,
	[Permiso] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Permisos_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PermisosPerfiles]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisosPerfiles](
	[Codigo_Perfil_Permiso] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Perfil] [int] NOT NULL,
	[Codigo_Permiso] [int] NOT NULL,
 CONSTRAINT [PK_PermisosPerfiles_1] PRIMARY KEY CLUSTERED 
(
	[Codigo_Perfil_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Codigo_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Categoria_Producto] [int] NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[ImagenProducto] [image] NULL,
	[PrecioVenta] [money] NOT NULL,
	[OrdenProducto] [int] NOT NULL CONSTRAINT [DF_Productos_OrdenProducto]  DEFAULT ((9999)),
	[Codigo_Tipo_Producto] [int] NOT NULL CONSTRAINT [DF_Productos_EsExtra]  DEFAULT ((0)),
	[PrecioComoExtra] [money] NULL,
	[AceptaExtra] [bit] NOT NULL CONSTRAINT [DF_Productos_AceptaExtra]  DEFAULT ((0)),
	[Impresora] [bit] NOT NULL CONSTRAINT [DF_Productos_Impresora]  DEFAULT ((0)),
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Productos_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductosUnidadesMedidas]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductosUnidadesMedidas](
	[Codigo_Producto_Unidad_Medida] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Producto] [int] NOT NULL,
	[Codigo_Unidad_Medida] [int] NOT NULL,
	[Precio_Venta] [money] NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Producto_Unidad_Medida_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Producto_Unidad_Medida] PRIMARY KEY CLUSTERED 
(
	[Codigo_Producto_Unidad_Medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiposProductos]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposProductos](
	[Codigo_Tipo_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Producto] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_TiposProductos_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_TiposProductos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Tipo_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnidadesMedidas]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnidadesMedidas](
	[Codigo_Unidad_Medida] [int] IDENTITY(1,1) NOT NULL,
	[Unidad_Medida] [varchar](15) NOT NULL,
	[Abreviatura] [varchar](10) NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_UnidadesMedidas_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_UnidadesMedidas] PRIMARY KEY CLUSTERED 
(
	[Codigo_Unidad_Medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Codigo_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Perfil] [int] NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[Nombre_Usuario] [varchar](50) NULL,
	[Apellido_Usuario] [varchar](50) NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Usuarios_Activo]  DEFAULT ((1)),
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Codigo_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_CATEGORIAS]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CATEGORIAS]
AS

	WITH Herencia (Codigo_Categoria_Producto, Codigo_Categoria_Padre_Producto, Categoria_Producto) AS
	(
		SELECT 
			Codigo_Categoria_Producto,
			Codigo_Categoria_Padre_Producto,
			CAST (Codigo_Categoria_Producto AS VARCHAR(MAX)) Categoria_Producto
		FROM
			CATEGORIASPRODUCTOS T1

		UNION ALL

		SELECT 
			T1.Codigo_Categoria_Producto,
			T1.Codigo_Categoria_Padre_Producto,
			CAST(TH.Codigo_Categoria_Producto AS VARCHAR(MAX)) + '/' + CAST(T1.Codigo_Categoria_Producto AS VARCHAR(MAX))
		FROM
			Herencia TH
			INNER JOIN CATEGORIASPRODUCTOS T1 ON TH.Codigo_Categoria_Producto = T1.Codigo_Categoria_Padre_Producto
	),
	Corder AS (
		SELECT
			Codigo_Categoria_Producto,
			Categoria_Producto AS Referencia,
			ROW_NUMBER() OVER (PARTITION BY Codigo_Categoria_Producto ORDER BY LEN(Categoria_Producto) DESC) Orden
		FROM Herencia
	)
	SELECT
		Codigo_Categoria_Producto,
		Referencia
	FROM Corder
	WHERE Orden = 1
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 

GO
INSERT [dbo].[Areas] ([Codigo_Area], [Area], [Color_Area], [Orden], [Activo]) VALUES (1, N'TERRAZA', N'#36bb3e', 4, 1)
GO
INSERT [dbo].[Areas] ([Codigo_Area], [Area], [Color_Area], [Orden], [Activo]) VALUES (2, N'SALÓN', N'#e13f4f', 2, 1)
GO
INSERT [dbo].[Areas] ([Codigo_Area], [Area], [Color_Area], [Orden], [Activo]) VALUES (3, N'PASILLO', N'#1324e9', 3, 1)
GO
INSERT [dbo].[Areas] ([Codigo_Area], [Area], [Color_Area], [Orden], [Activo]) VALUES (4, N'BARRA', N'#972a0f', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriasProductos] ON 

GO
INSERT [dbo].[CategoriasProductos] ([Codigo_Categoria_Producto], [Codigo_Categoria_Padre_Producto], [Categoria_Producto], [Orden], [Activo]) VALUES (1, NULL, N'COMIDA', 0, 1)
GO
INSERT [dbo].[CategoriasProductos] ([Codigo_Categoria_Producto], [Codigo_Categoria_Padre_Producto], [Categoria_Producto], [Orden], [Activo]) VALUES (2, NULL, N'BEBIDA', 0, 1)
GO
INSERT [dbo].[CategoriasProductos] ([Codigo_Categoria_Producto], [Codigo_Categoria_Padre_Producto], [Categoria_Producto], [Orden], [Activo]) VALUES (3, 2, N'VINOS', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[CategoriasProductos] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadosOrden] ON 

GO
INSERT [dbo].[EstadosOrden] ([Codigo_Estado_Orden], [Estado_Orden], [Activo]) VALUES (1, N'Atendiendo', 1)
GO
INSERT [dbo].[EstadosOrden] ([Codigo_Estado_Orden], [Estado_Orden], [Activo]) VALUES (2, N'Cuenta Pedida', 1)
GO
INSERT [dbo].[EstadosOrden] ([Codigo_Estado_Orden], [Estado_Orden], [Activo]) VALUES (3, N'Pagada', 1)
GO
SET IDENTITY_INSERT [dbo].[EstadosOrden] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadosOrdenDetalle] ON 

GO
INSERT [dbo].[EstadosOrdenDetalle] ([Codigo_Estado_Orden_Detalle], [Estado_Orden_Detalle], [Activo]) VALUES (1, N'Anotado', 1)
GO
INSERT [dbo].[EstadosOrdenDetalle] ([Codigo_Estado_Orden_Detalle], [Estado_Orden_Detalle], [Activo]) VALUES (2, N'Pedido', 1)
GO
SET IDENTITY_INSERT [dbo].[EstadosOrdenDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Metodos_Pago] ON 

GO
INSERT [dbo].[Metodos_Pago] ([Codigo_Metodo_Pago], [Metodo_Pago], [Activo]) VALUES (1, N'Efectivo', 1)
GO
INSERT [dbo].[Metodos_Pago] ([Codigo_Metodo_Pago], [Metodo_Pago], [Activo]) VALUES (2, N'Tarjeta', 1)
GO
SET IDENTITY_INSERT [dbo].[Metodos_Pago] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON 

GO
INSERT [dbo].[Perfiles] ([Codigo_Perfil], [Perfil], [Activo]) VALUES (1, N'Administrador', 1)
GO
INSERT [dbo].[Perfiles] ([Codigo_Perfil], [Perfil], [Activo]) VALUES (2, N'Camarero', 1)
GO
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Permisos] ON 

GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (1, N'Acceso a Administración', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (2, N'Acceso a Configuración', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (3, N'Acceso a Ventas', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (4, N'Acceso a Inf. Empresa', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (5, N'Puede Mover Clientes de Mesa', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (6, N'Puede Cambiar SubTotal', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (7, N'Puede Eliminar Pedido de Comanda', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (8, N'Puede Pedir Cuenta', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (9, N'Puede Cobrar Cuenta', 1)
GO
INSERT [dbo].[Permisos] ([Codigo_Permiso], [Permiso], [Activo]) VALUES (10, N'Puede Cambiar Nombre a Mesa', 1)
GO
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[PermisosPerfiles] ON 

GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (1, 1, 1)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (2, 1, 2)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (3, 1, 3)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (4, 1, 4)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (5, 1, 5)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (6, 1, 6)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (7, 1, 7)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (8, 1, 8)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (9, 1, 9)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (10, 1, 10)
GO
INSERT [dbo].[PermisosPerfiles] ([Codigo_Perfil_Permiso], [Codigo_Perfil], [Codigo_Permiso]) VALUES (12, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[PermisosPerfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposProductos] ON 

GO
INSERT [dbo].[TiposProductos] ([Codigo_Tipo_Producto], [Tipo_Producto], [Activo]) VALUES (1, N'Producto', 1)
GO
INSERT [dbo].[TiposProductos] ([Codigo_Tipo_Producto], [Tipo_Producto], [Activo]) VALUES (2, N'Producto y Extra', 1)
GO
INSERT [dbo].[TiposProductos] ([Codigo_Tipo_Producto], [Tipo_Producto], [Activo]) VALUES (3, N'Extra', 1)
GO
INSERT [dbo].[TiposProductos] ([Codigo_Tipo_Producto], [Tipo_Producto], [Activo]) VALUES (4, N'Precio Por Persona', 1)
GO
INSERT [dbo].[TiposProductos] ([Codigo_Tipo_Producto], [Tipo_Producto], [Activo]) VALUES (5, N'Servicio Por Persona', 1)
GO
INSERT [dbo].[TiposProductos] ([Codigo_Tipo_Producto], [Tipo_Producto], [Activo]) VALUES (6, N'Producto Con extra obligatorio (no se vende sólo)', 1)
GO
SET IDENTITY_INSERT [dbo].[TiposProductos] OFF
GO
ALTER TABLE [dbo].[CategoriasProductos]  WITH CHECK ADD  CONSTRAINT [FK_CategoriasProductos_CategoriasProductos] FOREIGN KEY([Codigo_Categoria_Padre_Producto])
REFERENCES [dbo].[CategoriasProductos] ([Codigo_Categoria_Producto])
GO
ALTER TABLE [dbo].[CategoriasProductos] CHECK CONSTRAINT [FK_CategoriasProductos_CategoriasProductos]
GO
ALTER TABLE [dbo].[Mesas]  WITH CHECK ADD  CONSTRAINT [FK_Mesas_Areas] FOREIGN KEY([Codigo_Area])
REFERENCES [dbo].[Areas] ([Codigo_Area])
GO
ALTER TABLE [dbo].[Mesas] CHECK CONSTRAINT [FK_Mesas_Areas]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_EstadosOrden] FOREIGN KEY([Codigo_Estado_Orden])
REFERENCES [dbo].[EstadosOrden] ([Codigo_Estado_Orden])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_EstadosOrden]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_Mesas] FOREIGN KEY([Codigo_Mesa])
REFERENCES [dbo].[Mesas] ([Codigo_Mesa])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_Mesas]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_Metodos_Pago] FOREIGN KEY([Codigo_Metodo_Pago])
REFERENCES [dbo].[Metodos_Pago] ([Codigo_Metodo_Pago])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_Metodos_Pago]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_EstadosOrdenDetalle] FOREIGN KEY([Codigo_Estado_Orden_Detalle])
REFERENCES [dbo].[EstadosOrdenDetalle] ([Codigo_Estado_Orden_Detalle])
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_EstadosOrdenDetalle]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_Ordenes] FOREIGN KEY([Codigo_Orden])
REFERENCES [dbo].[Ordenes] ([Codigo_Orden])
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_Ordenes]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_Productos] FOREIGN KEY([Codigo_Producto])
REFERENCES [dbo].[Productos] ([Codigo_Producto])
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_Productos]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_Productos_Extra] FOREIGN KEY([Codigo_Producto_Extra])
REFERENCES [dbo].[Productos] ([Codigo_Producto])
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_Productos_Extra]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_ProductosUnidadesMedidas] FOREIGN KEY([Codigo_Producto_Unidad_Medida])
REFERENCES [dbo].[ProductosUnidadesMedidas] ([Codigo_Producto_Unidad_Medida])
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_ProductosUnidadesMedidas]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_Usuarios] FOREIGN KEY([Codigo_Usuario])
REFERENCES [dbo].[Usuarios] ([Codigo_Usuario])
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_Usuarios]
GO
ALTER TABLE [dbo].[PermisosPerfiles]  WITH CHECK ADD  CONSTRAINT [FK_PermisosPerfiles_Perfiles] FOREIGN KEY([Codigo_Perfil])
REFERENCES [dbo].[Perfiles] ([Codigo_Perfil])
GO
ALTER TABLE [dbo].[PermisosPerfiles] CHECK CONSTRAINT [FK_PermisosPerfiles_Perfiles]
GO
ALTER TABLE [dbo].[PermisosPerfiles]  WITH CHECK ADD  CONSTRAINT [FK_PermisosPerfiles_Permisos] FOREIGN KEY([Codigo_Permiso])
REFERENCES [dbo].[Permisos] ([Codigo_Permiso])
GO
ALTER TABLE [dbo].[PermisosPerfiles] CHECK CONSTRAINT [FK_PermisosPerfiles_Permisos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_CategoriasProductos] FOREIGN KEY([Codigo_Categoria_Producto])
REFERENCES [dbo].[CategoriasProductos] ([Codigo_Categoria_Producto])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_CategoriasProductos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_TiposProductos] FOREIGN KEY([Codigo_Tipo_Producto])
REFERENCES [dbo].[TiposProductos] ([Codigo_Tipo_Producto])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_TiposProductos]
GO
ALTER TABLE [dbo].[ProductosUnidadesMedidas]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Unidad_Medida_Producto_Unidad_Medida] FOREIGN KEY([Codigo_Producto])
REFERENCES [dbo].[Productos] ([Codigo_Producto])
GO
ALTER TABLE [dbo].[ProductosUnidadesMedidas] CHECK CONSTRAINT [FK_Producto_Unidad_Medida_Producto_Unidad_Medida]
GO
ALTER TABLE [dbo].[ProductosUnidadesMedidas]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Unidad_Medida_UnidadesMedidas] FOREIGN KEY([Codigo_Unidad_Medida])
REFERENCES [dbo].[UnidadesMedidas] ([Codigo_Unidad_Medida])
GO
ALTER TABLE [dbo].[ProductosUnidadesMedidas] CHECK CONSTRAINT [FK_Producto_Unidad_Medida_UnidadesMedidas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([Codigo_Perfil])
REFERENCES [dbo].[Perfiles] ([Codigo_Perfil])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_AREA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_AREA]
(
	@Codigo_Area INT = NULL,
	@Area VARCHAR(50) = NULL,
	@Color_Area VARCHAR(50) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		Codigo_Area,
		Area,
		Color_Area,
		Orden,
		Activo
	FROM
		Areas A WITH(NOLOCK)
	WHERE
		Codigo_Area = ISNULL(@Codigo_Area, Codigo_Area)
		AND Area = ISNULL(@Area, Area)
		AND Color_Area = ISNULL(@Color_Area, Color_Area)
		AND Activo = ISNULL(@Activo, Activo)
	ORDER BY
		Orden,
		Area
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_CATEGORIA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_CATEGORIA]
(
	@Codigo_Categoria_Producto INT = NULL,
	@Codigo_Categoria_Padre_Producto INT = NULL,
	@Categoria_Producto VARCHAR(50) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		Codigo_Categoria_Producto,
		ISNULL(Codigo_Categoria_Padre_Producto, 0) AS Codigo_Categoria_Padre_Producto,
		Categoria_Producto,
		Orden,
		Activo
	FROM
		CategoriasProductos CP WITH(NOLOCK)
	WHERE
		Codigo_Categoria_Producto = ISNULL(@Codigo_Categoria_Producto, Codigo_Categoria_Producto)
		AND ISNULL(Codigo_Categoria_Padre_Producto, 0) = COALESCE(@Codigo_Categoria_Padre_Producto, Codigo_Categoria_Padre_Producto, 0)
		AND Categoria_Producto LIKE ISNULL('%' + @Categoria_Producto + '%', Categoria_Producto)
		AND Activo = ISNULL(@Activo, Activo)
	ORDER BY
		Orden,
		Categoria_Producto
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_DATOSCONSULTA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_DATOSCONSULTA]
(
	@Desde DATETIME = NULL,
	@Hasta DATETIME = NULL
)
AS
	SET NOCOUNT ON;

	SELECT
		CAST(O.Hora_Orden AS DATE) AS Fecha,
		
		O.Codigo_Orden,
		O.Codigo_Mesa,
		O.Hora_Orden,
		OD.Codigo_Orden_Detalle,
		OD.Codigo_Producto,
		OD.Codigo_Producto_Unidad_Medida,
		OD.Codigo_Producto_Extra,
		P.NombreProducto +
			ISNULL(' con ' + E.NombreProducto, '') +
			ISNULL(' (' + UM.Abreviatura + ')', '') AS NombreProducto,
		OD.Cantidad_Producto,
		OD.Sub_Total_Precio_Producto,
		OD.Nota_Producto,
		OD.Hora_Orden_Detalle,
		M.Mesa
	FROM
		Ordenes O WITH(NOLOCK)
		INNER JOIN OrdenesDetalles OD WITH(NOLOCK) ON O.Codigo_Orden = OD.Codigo_Orden AND O.Activo = OD.Activo AND O.Activo = 1
		INNER JOIN Productos P WITH(NOLOCK) ON OD.Codigo_Producto = P.Codigo_Producto AND O.Activo = P.Activo
		INNER JOIN Mesas M WITH(NOLOCK) ON O.Codigo_Mesa = M.Codigo_Mesa AND M.Activo = O.Activo

		LEFT JOIN Productos E WITH(NOLOCK) ON OD.Codigo_Producto_Extra = E.Codigo_Producto AND O.Activo = P.Activo
		LEFT JOIN ProductosUnidadesMedidas PUM WITH(NOLOCK) ON OD.Codigo_Producto_Unidad_Medida = PUM.Codigo_Producto_Unidad_Medida AND O.Activo = PUM.Activo
		LEFT JOIN UnidadesMedidas UM WITH(NOLOCK) ON PUM.Codigo_Unidad_Medida = UM.Codigo_Unidad_Medida AND O.Activo = UM.Activo

		INNER JOIN VW_CATEGORIAS VC WITH(NOLOCK) ON P.Codigo_Categoria_Producto = VC.Codigo_Categoria_Producto AND P.Activo = 1
	WHERE
		O.Codigo_Estado_Orden = 3 AND
		O.Hora_Orden BETWEEN ISNULL(@Desde, O.Hora_Orden) AND ISNULL(@Hasta, O.Hora_Orden)
	ORDER BY
		O.Codigo_Orden DESC
RETURN;
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_INFORMACIONEMPRESA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_INFORMACIONEMPRESA]
AS
	SET NOCOUNT ON;

	SELECT
		IdInformacionEmpresa,
		NombreEmpresa,
		Direccion,
		CodigoPostal,
		Provincia,
		Ciudad,
		Pais,
		CIF,
		NIF,
		Telefono,
		Movil,
		Facebook,
		NombreImpresoraBarra,
		NombreImpresoraCocina
	FROM
		InformacionEmpresa E WITH(NOLOCK)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_MESA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_MESA]
(
	@Codigo_Mesa INT = NULL,
	@Mesa VARCHAR(50) = NULL,
	@Codigo_Area INT = NULL,
	@Color_Mesa VARCHAR(20) = NULL,
	@PosicionX VARCHAR(10) = NULL,
	@PosicionY VARCHAR(10) = NULL,
	@Base VARCHAR(10) = NULL,
	@Altura VARCHAR(10) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		M.Codigo_Mesa,
		Mesa,
		Codigo_Area,
		Color_Mesa,
		PosicionX,
		PosicionY,
		Base,
		Altura,
		CAST(CASE WHEN ISNULL(Q.Detalles, 0) = 0 THEN 0 ELSE 1 END AS BIT) Ocupada,
		M.Activo
	FROM
		MESAS M WITH(NOLOCK)
		LEFT JOIN ORDENES O WITH(NOLOCK) ON M.Codigo_Mesa = O.Codigo_Mesa AND O.Codigo_Estado_Orden <> 3 AND O.Activo = M.Activo 
		OUTER APPLY (SELECT COUNT(0) Detalles FROM ORDENESDETALLES OD WITH(NOLOCK) WHERE OD.Codigo_Orden = O.Codigo_Orden AND OD.Activo = O.Activo) Q
	WHERE
		M.Codigo_Mesa = ISNULL(@Codigo_Mesa, M.Codigo_Mesa)
		AND Mesa = ISNULL(@Mesa, Mesa)
		AND Codigo_Area = ISNULL(@Codigo_Area, Codigo_Area)
		AND Color_Mesa = ISNULL(@Color_Mesa, Color_Mesa)
		AND PosicionX = ISNULL(@PosicionX, PosicionX)
		AND PosicionY = ISNULL(@PosicionY, PosicionY)
		AND Base = ISNULL(@Base, Base)
		AND Altura = ISNULL(@Altura, Altura)
		AND M.Activo = ISNULL(@Activo, M.Activo)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_ORDENDETALLE]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_ORDENDETALLE]
(
	@Codigo_Orden INT = NULL,
	@Codigo_Mesa INT = NULL,
	@Codigo_Estado_Orden INT = NULL,
	@Codigo_Orden_Detalle INT = NULL,
	@Codigo_Producto INT = NULL,
	@Codigo_Producto_Unidad_Medida INT = NULL,
	@Codigo_Estado_Orden_Detalle INT = NULL,
	@Codigo_Usuario INT = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		O.Codigo_Orden,
		O.Codigo_Mesa,
		O.Comensales,
		O.Hora_Orden,
		O.Codigo_Estado_Orden,
		OD.Codigo_Orden_Detalle,
		OD.Codigo_Producto,
		OD.Codigo_Producto_Unidad_Medida,
		OD.Codigo_Producto_Extra,
		P.NombreProducto +
			ISNULL(' con ' + E.NombreProducto, '') +
			ISNULL(' (' + UM.Abreviatura + ')', '') AS NombreProducto,
		OD.Cantidad_Producto,
		CASE
			WHEN P.Codigo_Tipo_Producto = 4 THEN P.PrecioVenta * ISNULL(OD.Cantidad_Personas, 1)
			ELSE ISNULL(PUM.Precio_Venta, P.PrecioVenta) + ISNULL(E.PrecioComoExtra, 0)
		END AS PrecioVenta,
		OD.Sub_Total_Precio_Producto,
		OD.Nota_Producto,
		OD.Hora_Orden_Detalle,
		OD.Codigo_Estado_Orden_Detalle,
		P.Impresora,
		OD.Codigo_Usuario,
		OD.Activo,
		M.Mesa,
		CASE
			WHEN '/' + VC.Referencia + '/' LIKE '%/2/%' THEN 1
			WHEN P.Codigo_Tipo_Producto = 5 THEN 2
			WHEN '/' + VC.Referencia + '/' LIKE '%/1/%' THEN 3
		END AS OrdenFactura
	FROM
		Ordenes O WITH(NOLOCK)
		INNER JOIN OrdenesDetalles OD WITH(NOLOCK) ON O.Codigo_Orden = OD.Codigo_Orden AND O.Activo = OD.Activo
		INNER JOIN Productos P WITH(NOLOCK) ON OD.Codigo_Producto = P.Codigo_Producto AND O.Activo = P.Activo
		INNER JOIN Mesas M WITH(NOLOCK) ON O.Codigo_Mesa = M.Codigo_Mesa AND M.Activo = O.Activo

		LEFT JOIN Productos E WITH(NOLOCK) ON OD.Codigo_Producto_Extra = E.Codigo_Producto AND O.Activo = P.Activo
		LEFT JOIN ProductosUnidadesMedidas PUM WITH(NOLOCK) ON OD.Codigo_Producto_Unidad_Medida = PUM.Codigo_Producto_Unidad_Medida AND O.Activo = PUM.Activo
		LEFT JOIN UnidadesMedidas UM WITH(NOLOCK) ON PUM.Codigo_Unidad_Medida = UM.Codigo_Unidad_Medida AND O.Activo = UM.Activo

		INNER JOIN VW_CATEGORIAS VC WITH(NOLOCK) ON P.Codigo_Categoria_Producto = VC.Codigo_Categoria_Producto AND P.Activo = 1
	WHERE
		O.Codigo_Estado_Orden <> 3 AND
		O.Codigo_Orden = ISNULL(@Codigo_Orden, O.Codigo_Orden) AND
		O.Codigo_Mesa = ISNULL(@Codigo_Mesa, O.Codigo_Mesa) AND
		O.Codigo_Estado_Orden = ISNULL(@Codigo_Estado_Orden, O.Codigo_Estado_Orden) AND
		OD.Codigo_Orden_Detalle = ISNULL(@Codigo_Orden_Detalle, OD.Codigo_Orden_Detalle) AND
		OD.Codigo_Producto = ISNULL(@Codigo_Producto, OD.Codigo_Producto) AND
		ISNULL(OD.Codigo_Producto_Unidad_Medida, 0) = COALESCE(@Codigo_Producto_Unidad_Medida, OD.Codigo_Producto_Unidad_Medida, 0) AND
		OD.Codigo_Estado_Orden_Detalle = ISNULL(@Codigo_Estado_Orden_Detalle, OD.Codigo_Estado_Orden_Detalle) AND
		OD.Codigo_Usuario = ISNULL(@Codigo_Usuario, OD.Codigo_Usuario) AND
		OD.Activo = ISNULL(@Activo, OD.Activo)
	ORDER BY
		P.OrdenProducto,
		OD.Hora_Orden_Detalle DESC
RETURN;
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PERFIL]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_PERFIL]
(
	@Codigo_Perfil INT = NULL,
	@Perfil VARCHAR(50) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (@Codigo_Perfil = 0)
		SET @Codigo_Perfil = NULL;

	SELECT
		Codigo_Perfil,
		Perfil,
		Activo
	FROM
		Perfiles P WITH(NOLOCK)
	WHERE
		Codigo_Perfil = ISNULL(@Codigo_Perfil, Codigo_Perfil)
		AND Perfil LIKE ISNULL('%' + @Perfil + '%', Perfil)
		AND Activo = ISNULL(@Activo, Activo)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PERMISO]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_PERMISO]
(
	@Codigo_Permiso INT = NULL,
	@Permiso VARCHAR(50) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		Codigo_Permiso,
		Permiso,
		Activo
	FROM
		Permisos WITH(NOLOCK)
	WHERE
		Codigo_Permiso = ISNULL(@Codigo_Permiso, Codigo_Permiso)
		AND Permiso LIKE ISNULL('%' + @Permiso + '%', Permiso)
		AND Activo = ISNULL(@Activo, Activo)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PERMISOSPERFILES]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_PERMISOSPERFILES]
(
	@Codigo_Perfil_Permiso INT = NULL,
	@Codigo_Perfil INT = NULL,
	@Codigo_Permiso INT = NULL
)
AS
	SET NOCOUNT ON;

	SELECT
		Codigo_Perfil_Permiso,
		Codigo_Perfil,
		Codigo_Permiso
	FROM
		PermisosPerfiles WITH(NOLOCK)
	WHERE
		Codigo_Perfil_Permiso = ISNULL(@Codigo_Perfil_Permiso, Codigo_Perfil_Permiso)
		AND Codigo_Perfil = ISNULL(@Codigo_Perfil, Codigo_Perfil)
		AND Codigo_Permiso = ISNULL(@Codigo_Permiso, Codigo_Permiso)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PRODUCTO]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_PRODUCTO]
(
	@Codigo_Producto INT = NULL,
	@Codigo_Categoria_Producto INT = NULL,
	@Producto VARCHAR(50) = NULL,
	@Codigo_Tipo_Producto INT = NULL,
	@AceptaExtra BIT = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		Codigo_Producto,
		P.Codigo_Categoria_Producto,
		NombreProducto,
		CASE WHEN @Codigo_Producto IS NOT NULL THEN ImagenProducto ELSE NULL END ImagenProducto,
		PrecioVenta,
		OrdenProducto,
		Codigo_Tipo_Producto,
		PrecioComoExtra,
		AceptaExtra,
		Impresora,
		Activo
	FROM
		PRODUCTOS P WITH(NOLOCK)
		INNER JOIN VW_CATEGORIAS VC WITH(NOLOCK) ON P.Codigo_Categoria_Producto = VC.Codigo_Categoria_Producto AND P.Activo = 1
	WHERE
		Codigo_Producto = ISNULL(@Codigo_Producto, Codigo_Producto)
		AND '/' + VC.Referencia + '/' LIKE ISNULL('%/' + CAST(@Codigo_Categoria_Producto AS VARCHAR(50)) + '/%', '/' + VC.Referencia + '/' )
		AND NombreProducto LIKE ISNULL('%' + @Producto + '%', NombreProducto)
		AND ((
				ISNULL(@Codigo_Tipo_Producto, 0) >= 0
				AND Codigo_Tipo_Producto = ISNULL(@Codigo_Tipo_Producto, Codigo_Tipo_Producto))
			OR (
				ISNULL(@Codigo_Tipo_Producto, 0) < 0
				AND Codigo_Tipo_Producto <> ABS(@Codigo_Tipo_Producto)
			))
		AND AceptaExtra = ISNULL(@AceptaExtra, AceptaExtra)
		AND Activo = ISNULL(@Activo, Activo)
	ORDER BY
		P.OrdenProducto,
		P.NombreProducto
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_PRODUCTOSUNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_PRODUCTOSUNIDADESMEDIDAS]
(
	@Codigo_Producto_Unidad_Medida INT = NULL,
	@Codigo_Producto INT = NULL,
	@Nombre_Producto VARCHAR(50) = NULL,
	@Codigo_Unidad_Medida INT = NULL,
	@Precio_Venta MONEY = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		P.Codigo_Producto,
		ISNULL(UM.Abreviatura + ' ', '') + P.NombreProducto AS NombreProductoUnidadMedida, 
		PUM.Codigo_Producto_Unidad_Medida,
		PUM.Codigo_Unidad_Medida,
		UM.Abreviatura,
		UM.Unidad_Medida,
		ISNULL(PUM.Precio_Venta, P.PrecioVenta) AS Precio_Venta
	FROM
		PRODUCTOS P WITH(NOLOCK)
		LEFT JOIN PRODUCTOSUNIDADESMEDIDAS PUM WITH(NOLOCK) ON P.Codigo_Producto = PUM.Codigo_Producto AND P.Activo = PUM.Activo
		LEFT JOIN UNIDADESMEDIDAS UM WITH(NOLOCK) ON PUM.Codigo_Unidad_Medida = UM.Codigo_Unidad_Medida AND PUM.Activo = UM.Activo
	WHERE
		P.Codigo_Producto = ISNULL(@Codigo_Producto, P.Codigo_Producto) AND
		P.NombreProducto LIKE ISNULL('%' + @Nombre_Producto + '%', NombreProducto) AND
		ISNULL(PUM.Codigo_Producto_Unidad_Medida, 0) = COALESCE(@Codigo_Producto_Unidad_Medida, PUM.Codigo_Producto_Unidad_Medida, 0) AND
		ISNULL(PUM.Codigo_Unidad_Medida, 0) = COALESCE(@Codigo_Unidad_Medida, PUM.Codigo_Unidad_Medida, 0) AND
		ISNULL(P.PrecioVenta, 0) = COALESCE(@Precio_Venta, P.PrecioVenta, 0) AND
		P.Activo = ISNULL(@Activo, P.Activo)
	ORDER BY
		--UM.Uniad_Medida
		ISNULL(PUM.Precio_Venta, P.PrecioVenta) DESC
RETURN;
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_TIPOPRODUCTO]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_TIPOPRODUCTO]
(
	@Codigo_Tipo_Producto INT = NULL,
	@Tipo_Producto VARCHAR(50) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (@Codigo_Tipo_Producto = 0)
		SET @Codigo_Tipo_Producto = NULL;

	SELECT
		Codigo_Tipo_Producto,
		Tipo_Producto,
		Activo
	FROM
		TiposProductos TP WITH(NOLOCK)
	WHERE
		Codigo_Tipo_Producto = ISNULL(@Codigo_Tipo_Producto, Codigo_Tipo_Producto)
		AND Tipo_Producto LIKE ISNULL('%' + @Tipo_Producto + '%', Tipo_Producto)
		AND Activo = ISNULL(@Activo, Activo)
	ORDER BY
		Tipo_Producto
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_UNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_UNIDADESMEDIDAS]
(
	@Codigo_Unidad_Medida INT = NULL,
	@Unidad_Medida VARCHAR(15) = NULL,
	@Abreviatura VARCHAR(10) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		Codigo_Unidad_Medida,
		Unidad_Medida,
		Abreviatura
	FROM
		UNIDADESMEDIDAS UM WITH(NOLOCK)
	WHERE
		Codigo_Unidad_Medida = ISNULL(@Codigo_Unidad_Medida, Codigo_Unidad_Medida) AND
		Unidad_Medida LIKE ISNULL('%' + @Unidad_Medida + '%', Unidad_Medida) AND
		Abreviatura LIKE ISNULL('%' + @Abreviatura + '%', Abreviatura) AND
		Activo = ISNULL(@Activo, Activo)
	ORDER BY
		Unidad_Medida DESC
RETURN;
GO
/****** Object:  StoredProcedure [dbo].[SPC_GET_USUARIO]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_GET_USUARIO]
(
	@Codigo_Usuario INT = NULL,
	@Codigo_Perfil INT = NULL,
	@Usuario VARCHAR(50) = NULL,
	@Clave VARCHAR(50) = NULL,
	@Nombre_Usuario VARCHAR(50) = NULL,
	@Apellido_Usuario VARCHAR(50) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		Codigo_Usuario,
		Codigo_Perfil,
		Usuario,
		Clave,
		Nombre_Usuario,
		Apellido_Usuario,
		Activo
	FROM
		Usuarios U WITH(NOLOCK)
	WHERE
		Codigo_Usuario = ISNULL(@Codigo_Usuario, Codigo_Usuario)
		AND Codigo_Perfil = ISNULL(@Codigo_Perfil, Codigo_Perfil)
		AND Usuario LIKE ISNULL(@Usuario, Usuario)
		AND Clave = ISNULL(@Clave, Clave)
		AND ISNULL(Nombre_Usuario, '') LIKE COALESCE('%' + @Nombre_Usuario + '%', Nombre_Usuario, '')
		AND ISNULL(Apellido_Usuario, '') = COALESCE(@Apellido_Usuario, Apellido_Usuario, '')
		AND Activo = ISNULL(@Activo, Activo)
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_AREA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_AREA]
(
	@Codigo_Area INT = NULL,
	@Area VARCHAR(50) = NULL,
	@Color_Area VARCHAR(50) = NULL,
	@Orden INT = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (ISNULL(@Codigo_Area, 0) = 0)
		INSERT INTO Areas
		(
			Area,
			Color_Area,
			Orden,
			Activo
		)
		VALUES
		(
			@Area,
			@Color_Area,
			@Orden,
			@Activo
		)
	ELSE
		UPDATE
			Areas
		SET
			Area = ISNULL(@Area, Area),
			Color_Area = ISNULL(@Color_Area, Color_Area),
			Orden = ISNULL(@Orden, Orden),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Area = @Codigo_Area
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_CATEGORIA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_CATEGORIA]
(
	@Codigo_Categoria_Producto INT = NULL,
	@Codigo_Categoria_Padre_Producto INT = NULL,
	@Categoria_Producto VARCHAR(50) = NULL,
	@Orden INT = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (@Codigo_Categoria_Producto IS NULL)
		INSERT INTO CATEGORIASPRODUCTOS (
			Codigo_Categoria_Padre_Producto,
			Categoria_Producto
		)
		VALUES (
			@Codigo_Categoria_Padre_Producto,
			@Categoria_Producto
		)

	ELSE
		UPDATE
			CATEGORIASPRODUCTOS
		SET
			Codigo_Categoria_Padre_Producto = @Codigo_Categoria_Padre_Producto,
			Categoria_Producto = @Categoria_Producto,
			Orden = ISNULL(@Orden, Orden),
			Activo = @Activo
		WHERE
			Codigo_Categoria_Producto = @Codigo_Categoria_Producto
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_INFORMACIONEMPRESA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_INFORMACIONEMPRESA]
(
	@NombreEmpresa VARCHAR(100),
	@Direccion VARCHAR(250),
	@CodigoPostal VARCHAR(10),
	@Provincia VARCHAR(50),
	@Ciudad VARCHAR(50),
	@Pais VARCHAR(50),
	@CIF VARCHAR(20),
	@NIF VARCHAR(20),
	@Telefono VARCHAR(20),
	@Movil VARCHAR(20),
	@Facebook VARCHAR(100),
	@NombreImpresoraBarra VARCHAR(100),
	@NombreImpresoraCocina VARCHAR(100)
)
AS
	SET NOCOUNT ON;
	DECLARE @IdInformacionEmpresa INT = 0;
	SELECT TOP 1 @IdInformacionEmpresa = IdInformacionEmpresa FROM InformacionEmpresa WITH(NOLOCK)

	IF (@IdInformacionEmpresa = 0)
		INSERT INTO InformacionEmpresa
		(
			NombreEmpresa,
			Direccion,
			CodigoPostal,
			Provincia,
			Ciudad,
			Pais,
			CIF,
			NIF,
			Telefono,
			Movil,
			Facebook,
			NombreImpresoraBarra,
			NombreImpresoraCocina
		)
		VALUES
		(
			@NombreEmpresa,
			@Direccion,
			@CodigoPostal,
			@Provincia,
			@Ciudad,
			@Pais,
			@CIF,
			@NIF,
			@Telefono,
			@Movil,
			@Facebook,
			@NombreImpresoraBarra,
			@NombreImpresoraCocina
		)
	ELSE
		UPDATE
			InformacionEmpresa
		SET
			NombreEmpresa = @NombreEmpresa,
			Direccion = @Direccion,
			CodigoPostal = @CodigoPostal,
			Provincia = @Provincia,
			Ciudad = @Ciudad,
			Pais = @Pais,
			CIF = @CIF,
			NIF = @NIF,
			Telefono = @Telefono,
			Movil = @Movil,
			Facebook = @Facebook,
			NombreImpresoraBarra = @NombreImpresoraBarra,
			NombreImpresoraCocina = @NombreImpresoraCocina

RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_MESA]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_MESA]
(
	@Codigo_Mesa INT = NULL,
	@Mesa VARCHAR(50) = NULL,
	@Codigo_Area INT = NULL,
	@Color_Mesa VARCHAR(20) = NULL,
	@PosicionX VARCHAR(10) = NULL,
	@PosicionY VARCHAR(10) = NULL,
	@Base VARCHAR(10) = NULL,
	@Altura VARCHAR(10) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (ISNULL(@Codigo_Mesa, 0) = 0)
		INSERT INTO Mesas
		(
			Mesa,
			Codigo_Area,
			Color_Mesa,
			PosicionX,
			PosicionY,
			Base,
			Altura,
			Activo
		)
		VALUES
		(
			@Mesa,
			@Codigo_Area,
			@Color_Mesa,
			@PosicionX,
			@PosicionY,
			@Base,
			@Altura,
			@Activo
		)
	ELSE
		UPDATE
			Mesas
		SET
			Mesa = ISNULL(@Mesa, Mesa),
			Codigo_Area = ISNULL(@Codigo_Area, Codigo_Area),
			Color_Mesa = ISNULL(@Color_Mesa, Color_Mesa),
			PosicionX = ISNULL(@PosicionX, PosicionX),
			PosicionY = ISNULL(@PosicionY, PosicionY),
			Base = ISNULL(@Base, Base),
			Altura = ISNULL(@Altura, Altura),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Mesa = @Codigo_Mesa
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_ORDEN]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_ORDEN]
(
	@Codigo_Orden INT = NULL OUTPUT,
	@Codigo_Mesa INT = NULL,
	@Comensales INT = NULL,
	@Hora_Orden DATETIME = NULL,
	@Codigo_Estado_Orden INT = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	SELECT
		@Codigo_Orden = Codigo_Orden
	FROM
		ORDENES O WITH(NOLOCK)
	WHERE
		O.Codigo_Estado_Orden != 3 AND
		O.Codigo_Mesa = ISNULL(@Codigo_Mesa, Codigo_Mesa) AND 
		O.Activo = ISNULL(@Activo, O.Activo)

	IF (ISNULL(@Codigo_Orden, 0) = 0)
	BEGIN
		INSERT INTO ORDENES
			(
				Codigo_Mesa,
				Comensales,
				Hora_Orden,
				Codigo_Estado_Orden,
				Activo
			)
		VALUES
			(
				@Codigo_Mesa,
				@Comensales,
				@Hora_Orden,
				@Codigo_Estado_Orden,
				@Activo
			)
		SET @Codigo_Orden = SCOPE_IDENTITY();
		print @Codigo_Orden;
	END
	ELSE
		UPDATE
			ORDENES
		SET
			Codigo_Mesa = ISNULL(@Codigo_Mesa, Codigo_Mesa),
			Comensales = ISNULL(@Comensales, Comensales),
			Hora_Orden = ISNULL(@Hora_Orden, Hora_Orden),
			Codigo_Estado_Orden = ISNULL(@Codigo_Estado_Orden, Codigo_Estado_Orden),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Orden = @Codigo_Orden
RETURN

GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_ORDENDETALLE]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_ORDENDETALLE]
(
	@Codigo_Orden_Detalle INT = NULL,
	@Codigo_Orden INT = NULL,
	@Codigo_Producto INT = NULL,
	@Codigo_Producto_Unidad_Medida INT = NULL,
	@Cantidad_Producto INT = NULL,
	@Codigo_Producto_Extra INT = NULL,
	@Sub_Total_Precio_Producto MONEY = NULL,
	@Nota_Producto VARCHAR(50) = NULL,
	@Hora_Orden_Detalle DATETIME = NULL,
	@Codigo_Estado_Orden_Detalle INT = NULL,
	@Codigo_Usuario INT = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (@Codigo_Estado_Orden_Detalle IS NULL)
	BEGIN
		SELECT
			@Codigo_Orden_Detalle = Codigo_Orden_Detalle,
			@Cantidad_Producto = @Cantidad_Producto + Cantidad_Producto,
			@Sub_Total_Precio_Producto = 
				CASE WHEN ISNULL(@Cantidad_Producto, 0) > 0 THEN
					@Sub_Total_Precio_Producto + Sub_Total_Precio_Producto
				ELSE @Sub_Total_Precio_Producto END,
			@Activo = CASE WHEN ISNULL(@Cantidad_Producto, 1) > 0 THEN 1 ELSE 0 END
		FROM
			ORDENES O WITH(NOLOCK)
			INNER JOIN ORDENESDETALLES OD WITH(NOLOCK) ON
				O.Codigo_Orden = OD.Codigo_Orden
				AND O.Activo = OD.Activo 
				AND O.Codigo_Estado_Orden != 3
				AND OD.Codigo_Estado_Orden_Detalle = 1
		WHERE
			OD.Codigo_Orden_Detalle = ISNULL(@Codigo_Orden_Detalle, OD.Codigo_Orden_Detalle) AND
			OD.Codigo_Orden = ISNULL(@Codigo_Orden, OD.Codigo_Orden) AND
			OD.Codigo_Producto = ISNULL(@Codigo_Producto, OD.Codigo_Producto) AND 
			ISNULL(OD.Codigo_Producto_Unidad_Medida, 0) = COALESCE(@Codigo_Producto_Unidad_Medida, OD.Codigo_Producto_Unidad_Medida, 0) AND
			ISNULL(OD.Codigo_Producto_Extra, 0) = COALESCE(@Codigo_Producto_Extra, OD.Codigo_Producto_Extra, 0) AND
			@Codigo_Producto IS NULL AND
			O.Activo = ISNULL(@Activo, O.Activo)

		IF (ISNULL(@Codigo_Orden_Detalle, 0)  = 0)
		BEGIN
			INSERT INTO ORDENESDETALLES
				(
					Codigo_Orden,
					Codigo_Producto,
					Codigo_Producto_Unidad_Medida,
					Cantidad_Producto,
					Codigo_Producto_Extra,
					Sub_Total_Precio_Producto,
					Nota_Producto,
					Hora_Orden_Detalle,
					Codigo_Estado_Orden_Detalle,
					Codigo_Usuario,
					Activo
				)
			VALUES
				(
					@Codigo_Orden,
					@Codigo_Producto,
					@Codigo_Producto_Unidad_Medida,
					@Cantidad_Producto,
					@Codigo_Producto_Extra,
					@Sub_Total_Precio_Producto,
					@Nota_Producto,
					@Hora_Orden_Detalle,
					1,
					@Codigo_Usuario,
					@Activo
				)
		END
		ELSE
			UPDATE
				ORDENESDETALLES
			SET
				Codigo_Orden = ISNULL(@Codigo_Orden, Codigo_Orden),
				Codigo_Producto = ISNULL(@Codigo_Producto, Codigo_Producto),
				Codigo_Producto_Unidad_Medida = ISNULL(@Codigo_Producto_Unidad_Medida, Codigo_Producto_Unidad_Medida),
				Cantidad_Producto = ISNULL(@Cantidad_Producto, Cantidad_Producto),
				Codigo_Producto_Extra = ISNULL(@Codigo_Producto_Extra, Codigo_Producto_Extra),
				Sub_Total_Precio_Producto = ISNULL(@Sub_Total_Precio_Producto, Sub_Total_Precio_Producto),
				Nota_Producto = ISNULL(@Nota_Producto, Nota_Producto),
				Hora_Orden_Detalle = ISNULL(@Hora_Orden_Detalle, GETDATE()),
				Codigo_Estado_Orden_Detalle = ISNULL(@Codigo_Estado_Orden_Detalle, Codigo_Estado_Orden_Detalle),
				Codigo_Usuario = ISNULL(@Codigo_Usuario, Codigo_Usuario),
				Activo = ISNULL(@Activo, Activo)
			WHERE
				Codigo_Orden_Detalle = @Codigo_Orden_Detalle
	END
		UPDATE
			ORDENESDETALLES
		SET
			Codigo_Estado_Orden_Detalle = ISNULL(@Codigo_Estado_Orden_Detalle, Codigo_Estado_Orden_Detalle)
		WHERE
			Codigo_Orden = @Codigo_Orden

	-- RETORNAR DETALLE DE ORDEN ACTUALIZADA
	EXEC SPC_GET_ORDENDETALLE @Codigo_Orden
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PERFIL]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_PERFIL]
(
	@Codigo_Perfil INT = NULL,
	@Perfil VARCHAR(50) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (ISNULL(@Codigo_Perfil, 0) = 0)
		INSERT INTO Perfiles
		(
			Perfil,
			Activo
		)
		VALUES
		(
			@Perfil,
			@Activo
		)
	ELSE
		UPDATE
			Perfiles
		SET
			Perfil = ISNULL(@Perfil, Perfil),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Perfil = @Codigo_Perfil
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PERMISOSPERFILES]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_PERMISOSPERFILES]
(
	@Codigo_Perfil_Permiso INT = NULL,
	@Codigo_Perfil INT = NULL,
	@Codigo_Permiso INT = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (ISNULL(@Codigo_Perfil_Permiso, 0) = 0)
		INSERT INTO PermisosPerfiles (
			Codigo_Perfil,
			Codigo_Permiso
		)
		VALUES (
			@Codigo_Perfil,
			@Codigo_Permiso
		)

	ELSE IF (@Activo = 0)
		DELETE
			PermisosPerfiles
		WHERE
			Codigo_Perfil_Permiso = @Codigo_Perfil_Permiso

	ELSE
		UPDATE
			PermisosPerfiles
		SET
			Codigo_Perfil = @Codigo_Perfil,
			Codigo_Permiso = @Codigo_Permiso
		WHERE
			Codigo_Perfil_Permiso = @Codigo_Perfil_Permiso
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PRODUCTO]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_PRODUCTO]
(
	@Codigo_Producto INT = NULL,
	@Codigo_Categoria_Producto INT = NULL,
	@Producto VARCHAR(50) = NULL,
	@ImagenProducto IMAGE = NULL,
	@PrecioVenta MONEY = 0,
	@OrdenProducto INT = 9999,
	@Codigo_Tipo_Producto INT = NULL,
	@PrecioComoExtra MONEY = 0,
	@AceptaExtra BIT = NULL,
	@Impresora BIT = 0,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (@Codigo_Producto IS NULL)
		INSERT INTO PRODUCTOS
			(
				Codigo_Categoria_Producto,
				NombreProducto,
				ImagenProducto,
				PrecioVenta,
				OrdenProducto,
				Codigo_Tipo_Producto,
				PrecioComoExtra,
				AceptaExtra,
				Impresora,
				Activo
			)
		VALUES
			(
				@Codigo_Categoria_Producto,
				@Producto,
				@ImagenProducto,
				@PrecioVenta,
				@OrdenProducto,
				@Codigo_Tipo_Producto,
				@PrecioComoExtra,
				@AceptaExtra,
				@Impresora,
				@Activo
			)
	ELSE
		UPDATE
			PRODUCTOS
		SET
			Codigo_Categoria_Producto = ISNULL(@Codigo_Categoria_Producto, Codigo_Categoria_Producto),
			NombreProducto = ISNULL(@Producto, NombreProducto),
			ImagenProducto = ISNULL(@ImagenProducto, ImagenProducto),
			PrecioVenta = ISNULL(@PrecioVenta, PrecioVenta),
			OrdenProducto = ISNULL(@OrdenProducto, OrdenProducto),
			Codigo_Tipo_Producto = ISNULL(@Codigo_Tipo_Producto, Codigo_Tipo_Producto),
			PrecioComoExtra = ISNULL(@PrecioComoExtra, PrecioComoExtra),
			AceptaExtra = ISNULL(@AceptaExtra, AceptaExtra),
			Impresora = ISNULL(@Impresora, Impresora),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Producto = @Codigo_Producto
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_PRODUCTOSUNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_PRODUCTOSUNIDADESMEDIDAS]
(
	@Codigo_Producto_Unidad_Medida INT = NULL,
	@Codigo_Producto INT = 6,
	@Codigo_Unidad_Medida INT = NULL,
	@Precio_Venta MONEY = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (ISNULL(@Codigo_Producto_Unidad_Medida, 0) = 0)
		INSERT INTO PRODUCTOSUNIDADESMEDIDAS
		(
			Codigo_Producto,
			Codigo_Unidad_Medida,
			Precio_Venta
		)
		VALUES
		(
			@Codigo_Producto,
			@Codigo_Unidad_Medida,
			@Precio_Venta
		)
	ELSE
		UPDATE
			PRODUCTOSUNIDADESMEDIDAS
		SET
			Codigo_Producto = ISNULL(@Codigo_Producto, Codigo_Producto),
			Codigo_Unidad_Medida = ISNULL(@Codigo_Unidad_Medida, Codigo_Unidad_Medida),
			Precio_Venta = ISNULL(@Precio_Venta, Precio_Venta),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Producto_Unidad_Medida = @Codigo_Producto_Unidad_Medida
RETURN;
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_UNIDADESMEDIDAS]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_UNIDADESMEDIDAS]
(
	@Codigo_Unidad_Medida INT = NULL,
	@Unidad_Medida VARCHAR(15) = NULL,
	@Abreviatura VARCHAR(10) = NULL,
	@Activo BIT = 1
)
AS
	SET NOCOUNT ON;

	IF (ISNULL(@Codigo_Unidad_Medida, 0) = 0)
		INSERT INTO UNIDADESMEDIDAS
		(
			Unidad_Medida,
			Abreviatura
		)
		VALUES
		(
			@Unidad_Medida,
			@Abreviatura
		)
	ELSE
		UPDATE
			UNIDADESMEDIDAS
		SET
			Unidad_Medida = ISNULL(@Unidad_Medida, Unidad_Medida),
			Abreviatura = ISNULL(@Abreviatura, Abreviatura),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Unidad_Medida = @Codigo_Unidad_Medida
RETURN;
GO
/****** Object:  StoredProcedure [dbo].[SPC_SET_USUARIO]    Script Date: 23/10/2016 11:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPC_SET_USUARIO]
(
	@Codigo_Usuario INT = NULL,
	@Codigo_Perfil INT = NULL,
	@Usuario VARCHAR(50) = NULL,
	@Clave VARCHAR(50) = NULL,
	@Nombre_Usuario VARCHAR(50) = NULL,
	@Apellido_Usuario VARCHAR(50) = NULL,
	@Activo BIT = NULL
)
AS
	SET NOCOUNT ON;

	IF (@Codigo_Usuario IS NULL)
		INSERT INTO Usuarios
			(
				Codigo_Perfil,
				Usuario,
				Clave,
				Nombre_Usuario,
				Apellido_Usuario
			)
		VALUES
			(
				@Codigo_Perfil,
				@Usuario,
				@Clave,
				@Nombre_Usuario,
				@Apellido_Usuario
			)
	ELSE
		UPDATE
			Usuarios
		SET
			Codigo_Perfil = ISNULL(@Codigo_Perfil, Codigo_Perfil),
			Usuario = ISNULL(@Usuario, Usuario),
			Clave = ISNULL(@Clave, Clave),
			Nombre_Usuario = ISNULL(@Nombre_Usuario, Nombre_Usuario),
			Apellido_Usuario = ISNULL(@Apellido_Usuario, Apellido_Usuario),
			Activo = ISNULL(@Activo, Activo)
		WHERE
			Codigo_Usuario = @Codigo_Usuario
RETURN
GO
