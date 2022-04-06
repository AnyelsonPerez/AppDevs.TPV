namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class UsuariosDto
    {
        public int Codigo_Usuario { get; set; }

        public int Codigo_Perfil { get; set; }

        public string Usuario { get; set; }

        public string Clave { get; set; }

        public string Nombre_Usuario { get; set; }

        public string Apellido_Usuario { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<OrdenesDetallesDto> OrdenesDetalles { get; set; }

        public PerfilesDto Perfiles { get; set; }
    }
}