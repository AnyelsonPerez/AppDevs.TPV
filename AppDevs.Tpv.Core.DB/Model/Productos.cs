namespace AppDevs.Tpv.Core.Domain.Model
{
    public class Productos
    {
        public int Codigo_Producto { get; set; }

        public int Codigo_Categoria_Producto { get; set; }

        public string NombreProducto { get; set; }

        public byte[] ImagenProducto { get; set; }

        public decimal PrecioVenta { get; set; }

        public int OrdenProducto { get; set; }

        public int Codigo_Tipo_Producto { get; set; }

        public decimal? PrecioComoExtra { get; set; }

        public bool AceptaExtra { get; set; }

        public bool Impresora { get; set; }

        public bool Activo { get; set; }
    }
}