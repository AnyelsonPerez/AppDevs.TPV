namespace AppDevs.Tpv.Core.Dto
{
    public class PermisosPerfilesDto
    {
        public int Codigo_Perfil_Permiso { get; set; }

        public int Codigo_Perfil { get; set; }

        public int Codigo_Permiso { get; set; }

        public PerfilesDto Perfiles { get; set; }

        public PermisosDto Permisos { get; set; }
    }
}