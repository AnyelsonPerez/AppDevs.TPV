using System.Data.Entity;

namespace AppDevs.Tpv.Core.Domain
{
    public partial class TpvDataContext : DbContext
    {
        public TpvDataContext()
            : base("name=TpvDataContext")
        {
        }

        public virtual DbSet<Areas> Areas { get; set; }
        public virtual DbSet<CategoriasProductos> CategoriasProductos { get; set; }
        public virtual DbSet<EstadosOrden> EstadosOrden { get; set; }
        public virtual DbSet<EstadosOrdenDetalle> EstadosOrdenDetalle { get; set; }
        public virtual DbSet<InformacionEmpresa> InformacionEmpresa { get; set; }
        public virtual DbSet<Mesas> Mesas { get; set; }
        public virtual DbSet<Metodos_Pago> Metodos_Pago { get; set; }
        public virtual DbSet<Ordenes> Ordenes { get; set; }
        public virtual DbSet<OrdenesDetalles> OrdenesDetalles { get; set; }
        public virtual DbSet<Perfiles> Perfiles { get; set; }
        public virtual DbSet<Permisos> Permisos { get; set; }
        public virtual DbSet<PermisosPerfiles> PermisosPerfiles { get; set; }
        public virtual DbSet<Productos> Productos { get; set; }
        public virtual DbSet<ProductosUnidadesMedidas> ProductosUnidadesMedidas { get; set; }
        public virtual DbSet<TiposProductos> TiposProductos { get; set; }
        public virtual DbSet<UnidadesMedidas> UnidadesMedidas { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }
        public virtual DbSet<VW_NUMEROFACTURAANUAL> VW_NUMEROFACTURAANUAL { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Areas>()
                .Property(e => e.Area)
                .IsUnicode(false);

            modelBuilder.Entity<Areas>()
                .Property(e => e.Color_Area)
                .IsUnicode(false);

            modelBuilder.Entity<Areas>()
                .HasMany(e => e.Mesas)
                .WithRequired(e => e.Areas)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CategoriasProductos>()
                .Property(e => e.Categoria_Producto)
                .IsUnicode(false);

            modelBuilder.Entity<CategoriasProductos>()
                .HasMany(e => e.CategoriasProductosHijas)
                .WithOptional(e => e.CategoriasProductosPadre)
                .HasForeignKey(e => e.Codigo_Categoria_Padre_Producto);

            modelBuilder.Entity<CategoriasProductos>()
                .HasMany(e => e.Productos)
                .WithRequired(e => e.CategoriasProductos)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EstadosOrden>()
                .Property(e => e.Estado_Orden)
                .IsUnicode(false);

            modelBuilder.Entity<EstadosOrden>()
                .HasMany(e => e.Ordenes)
                .WithRequired(e => e.EstadosOrden)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EstadosOrdenDetalle>()
                .Property(e => e.Estado_Orden_Detalle)
                .IsUnicode(false);

            modelBuilder.Entity<EstadosOrdenDetalle>()
                .HasMany(e => e.OrdenesDetalles)
                .WithRequired(e => e.EstadosOrdenDetalle)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.NombreEmpresa)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.Direccion)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.CodigoPostal)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.Provincia)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.Ciudad)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.Pais)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.CIF)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.NIF)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.Telefono)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.Movil)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.Facebook)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.NombreImpresoraBarra)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.NombreImpresoraCocina)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.PorcientoIVA)
                .HasPrecision(18, 0);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.TipoLetraBarra)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.TipoLetraCocina)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.TamanoLetraBarra)
                .HasPrecision(18, 0);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.TamanoLetraCocina)
                .HasPrecision(18, 0);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.PlantillaPedidoBarra)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.PlantillaPedidoCocina)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.PlantillaAnulacionBarra)
                .IsUnicode(false);

            modelBuilder.Entity<InformacionEmpresa>()
                .Property(e => e.PlantillaCuenta)
                .IsUnicode(false);

            modelBuilder.Entity<Mesas>()
                .Property(e => e.Mesa)
                .IsUnicode(false);

            modelBuilder.Entity<Mesas>()
                .Property(e => e.Color_Mesa)
                .IsUnicode(false);

            modelBuilder.Entity<Mesas>()
                .Property(e => e.PosicionX)
                .IsUnicode(false);

            modelBuilder.Entity<Mesas>()
                .Property(e => e.PosicionY)
                .IsUnicode(false);

            modelBuilder.Entity<Mesas>()
                .Property(e => e.Base)
                .IsUnicode(false);

            modelBuilder.Entity<Mesas>()
                .Property(e => e.Altura)
                .IsUnicode(false);

            modelBuilder.Entity<Mesas>()
                .HasMany(e => e.Ordenes)
                .WithRequired(e => e.Mesas)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Metodos_Pago>()
                .Property(e => e.Metodo_Pago)
                .IsUnicode(false);

            modelBuilder.Entity<Ordenes>()
                .HasMany(e => e.OrdenesDetalles)
                .WithRequired(e => e.Ordenes)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<OrdenesDetalles>()
                .Property(e => e.Sub_Total_Precio_Producto)
                .HasPrecision(19, 4);

            modelBuilder.Entity<OrdenesDetalles>()
                .Property(e => e.Nota_Producto)
                .IsUnicode(false);

            modelBuilder.Entity<Perfiles>()
                .Property(e => e.Perfil)
                .IsUnicode(false);

            modelBuilder.Entity<Perfiles>()
                .HasMany(e => e.PermisosPerfiles)
                .WithRequired(e => e.Perfiles)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Perfiles>()
                .HasMany(e => e.Usuarios)
                .WithRequired(e => e.Perfiles)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Permisos>()
                .Property(e => e.Permiso)
                .IsUnicode(false);

            modelBuilder.Entity<Permisos>()
                .HasMany(e => e.PermisosPerfiles)
                .WithRequired(e => e.Permisos)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Productos>()
                .Property(e => e.NombreProducto)
                .IsUnicode(false);

            modelBuilder.Entity<Productos>()
                .Property(e => e.PrecioVenta)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Productos>()
                .Property(e => e.PrecioComoExtra)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Productos>()
                .HasMany(e => e.OrdenesDetalles)
                .WithRequired(e => e.Productos)
                .HasForeignKey(e => e.Codigo_Producto)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Productos>()
                .HasMany(e => e.OrdenesDetallesComoExtra)
                .WithOptional(e => e.ProductosExtra)
                .HasForeignKey(e => e.Codigo_Producto_Extra);

            modelBuilder.Entity<Productos>()
                .HasMany(e => e.ProductosUnidadesMedidas)
                .WithRequired(e => e.Productos)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductosUnidadesMedidas>()
                .Property(e => e.Precio_Venta)
                .HasPrecision(19, 4);

            modelBuilder.Entity<TiposProductos>()
                .Property(e => e.Tipo_Producto)
                .IsUnicode(false);

            modelBuilder.Entity<TiposProductos>()
                .HasMany(e => e.Productos)
                .WithRequired(e => e.TiposProductos)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UnidadesMedidas>()
                .Property(e => e.Unidad_Medida)
                .IsUnicode(false);

            modelBuilder.Entity<UnidadesMedidas>()
                .Property(e => e.Abreviatura)
                .IsUnicode(false);

            modelBuilder.Entity<UnidadesMedidas>()
                .HasMany(e => e.ProductosUnidadesMedidas)
                .WithRequired(e => e.UnidadesMedidas)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Clave)
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Nombre_Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Apellido_Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .HasMany(e => e.OrdenesDetalles)
                .WithRequired(e => e.Usuarios)
                .WillCascadeOnDelete(false);
        }
    }
}