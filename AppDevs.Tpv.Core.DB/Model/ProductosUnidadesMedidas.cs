namespace AppDevs.Tpv.Core.Domain.Model
{
    public class ProductosUnidadesMedidas
    {
        public int Codigo_Producto_Unidad_Medida { get; set; }

        public int Codigo_Producto { get; set; }

        public int Codigo_Unidad_Medida { get; set; }

        public decimal Precio_Venta { get; set; }

        public bool Activo { get; set; }
    }
}