namespace AppDevs.Tpv.Core.Domain
{
    public class Usuarios
    {
        public int Codigo_Usuario { get; set; }

        public int Codigo_Perfil { get; set; }

        public string Usuario { get; set; }

        public string Clave { get; set; }

        public string Nombre_Usuario { get; set; }

        public string Apellido_Usuario { get; set; }

        public bool Activo { get; set; }
    }
}