namespace AppDevs.Tpv.Core.Domain
{
    public class CategoriasProductos
    {
        public int Codigo_Categoria_Producto { get; set; }

        public int Codigo_Categoria_Padre_Producto { get; set; }

        public string Categoria_Producto { get; set; }

        public int Orden { get; set; }

        public bool Activo { get; set; }
    }
}