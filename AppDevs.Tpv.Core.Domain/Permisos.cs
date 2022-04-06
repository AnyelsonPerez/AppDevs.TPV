namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Permisos
    {
        public Permisos()
        {
            PermisosPerfiles = new HashSet<PermisosPerfiles>();
        }

        [Key]
        public int Codigo_Permiso { get; set; }

        [Required]
        [StringLength(50)]
        public string Permiso { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<PermisosPerfiles> PermisosPerfiles { get; set; }
    }
}