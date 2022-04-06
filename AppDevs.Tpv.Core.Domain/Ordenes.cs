namespace AppDevs.Tpv.Core.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Ordenes
    {
        public Ordenes()
        {
            OrdenesDetalles = new HashSet<OrdenesDetalles>();
        }

        [Key]
        public int Codigo_Orden { get; set; }

        public int Codigo_Mesa { get; set; }

        public int Comensales { get; set; }

        public DateTime Hora_Orden { get; set; }

        public int Codigo_Estado_Orden { get; set; }

        public int? Codigo_Metodo_Pago { get; set; }

        public DateTime? Hora_Pago { get; set; }

        public bool Activo { get; set; }

        public virtual EstadosOrden EstadosOrden { get; set; }

        public virtual Mesas Mesas { get; set; }

        public virtual Metodos_Pago Metodos_Pago { get; set; }

        public virtual ICollection<OrdenesDetalles> OrdenesDetalles { get; set; }
    }
}