namespace AppDevs.Tpv.Core.Domain
{
    public class ProductosUnidadesMedidas
    {
        public int Codigo_Producto_Unidad_Medida { get; set; }

        public int Codigo_Producto { get; set; }

        public int Codigo_Unidad_Medida { get; set; }

        public double Precio_Venta { get; set; }

        public bool Activo { get; set; }
    }
}