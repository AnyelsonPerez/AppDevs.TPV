namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class PermisosDto
    {
        public int Codigo_Permiso { get; set; }

        public string Permiso { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<PermisosPerfilesDto> PermisosPerfiles { get; set; }
    }
}