namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class CategoriasProductosDto
    {
        public int Codigo_Categoria_Producto { get; set; }

        public int? Codigo_Categoria_Padre_Producto { get; set; }

        public string Categoria_Producto { get; set; }

        public int Orden { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<CategoriasProductosDto> CategoriasProductosHijas { get; set; }

        public CategoriasProductosDto CategoriasProductosPadre { get; set; }

        public IEnumerable<ProductosDto> Productos { get; set; }
    }
}