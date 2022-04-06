namespace AppDevs.Tpv.Core.Domain
{
    using System.ComponentModel.DataAnnotations;

    public partial class PermisosPerfiles
    {
        [Key]
        public int Codigo_Perfil_Permiso { get; set; }

        public int Codigo_Perfil { get; set; }

        public int Codigo_Permiso { get; set; }

        public virtual Perfiles Perfiles { get; set; }

        public virtual Permisos Permisos { get; set; }
    }
}