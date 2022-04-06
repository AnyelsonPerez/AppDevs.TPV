namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class ProductosDto
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

        public CategoriasProductosDto CategoriasProductos { get; set; }

        public IEnumerable<OrdenesDetallesDto> OrdenesDetalles { get; set; }

        public IEnumerable<OrdenesDetallesDto> OrdenesDetallesComoExtra { get; set; }

        public IEnumerable<ProductosUnidadesMedidasDto> ProductosUnidadesMedidas { get; set; }

        public TiposProductosDto TiposProductos { get; set; }
    }
}