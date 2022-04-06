namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Perfiles
    {
        public Perfiles()
        {
            PermisosPerfiles = new HashSet<PermisosPerfiles>();
            Usuarios = new HashSet<Usuarios>();
        }

        [Key]
        public int Codigo_Perfil { get; set; }

        [Required]
        [StringLength(50)]
        public string Perfil { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<PermisosPerfiles> PermisosPerfiles { get; set; }

        public virtual ICollection<Usuarios> Usuarios { get; set; }
    }
}