namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class PerfilesDto
    {
        public int Codigo_Perfil { get; set; }

        public string Perfil { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<PermisosPerfilesDto> PermisosPerfiles { get; set; }

        public IEnumerable<UsuariosDto> Usuarios { get; set; }
    }
}