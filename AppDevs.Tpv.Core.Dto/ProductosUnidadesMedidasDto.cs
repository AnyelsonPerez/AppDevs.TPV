namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class ProductosUnidadesMedidasDto
    {
        public int Codigo_Producto_Unidad_Medida { get; set; }

        public int Codigo_Producto { get; set; }

        public int Codigo_Unidad_Medida { get; set; }

        public decimal Precio_Venta { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<OrdenesDetallesDto> OrdenesDetalles { get; set; }

        public ProductosDto Productos { get; set; }

        public UnidadesMedidasDto UnidadesMedidas { get; set; }
    }
}