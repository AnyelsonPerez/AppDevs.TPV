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
    
    public partial class PermisosPerfiles
    {
        public int Codigo_Perfil_Permiso { get; set; }
        public int Codigo_Perfil { get; set; }
        public int Codigo_Permiso { get; set; }
    
        public virtual Perfiles Perfiles { get; set; }
        public virtual Permisos Permisos { get; set; }
    }
}
