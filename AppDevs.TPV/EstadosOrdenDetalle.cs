//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppDevs.TPV
{
    using System;
    using System.Collections.Generic;
    
    public partial class EstadosOrdenDetalle
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EstadosOrdenDetalle()
        {
            this.OrdenesDetalles = new HashSet<OrdenesDetalles>();
        }
    
        public int Codigo_Estado_Orden_Detalle { get; set; }
        public string Estado_Orden_Detalle { get; set; }
        public bool Activo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrdenesDetalles> OrdenesDetalles { get; set; }
    }
}
