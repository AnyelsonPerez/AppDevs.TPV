namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Usuarios
    {
        public Usuarios()
        {
            OrdenesDetalles = new HashSet<OrdenesDetalles>();
        }

        [Key]
        public int Codigo_Usuario { get; set; }

        public int Codigo_Perfil { get; set; }

        [Required]
        [StringLength(50)]
        public string Usuario { get; set; }

        [Required]
        [StringLength(50)]
        public string Clave { get; set; }

        [StringLength(50)]
        public string Nombre_Usuario { get; set; }

        [StringLength(50)]
        public string Apellido_Usuario { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<OrdenesDetalles> OrdenesDetalles { get; set; }

        public virtual Perfiles Perfiles { get; set; }
    }
}