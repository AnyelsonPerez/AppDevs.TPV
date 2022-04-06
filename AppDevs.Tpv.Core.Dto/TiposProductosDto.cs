namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class TiposProductosDto
    {
        public int Codigo_Tipo_Producto { get; set; }

        public string Tipo_Producto { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<ProductosDto> Productos { get; set; }
    }
}