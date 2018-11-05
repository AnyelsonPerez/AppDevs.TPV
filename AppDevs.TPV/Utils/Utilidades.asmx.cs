using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace AppDevs.TPV.Utils
{
    /// <summary>
    /// Summary description for Permisos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class Utilidades : System.Web.Services.WebService
    {
        public const string C_SV_USUARIO = "_Usuario";
        public const int C_PER_AccesoAdministracion = 1;
        public const int C_PER_AccesoConfiguracion = 2;
        public const int C_PER_AccesoVentas = 3;
        public const int C_PER_AccesoInfEmpresa = 4;
        public const int C_PER_PuedeMoverClientesDeMesa = 5;
        public const int C_PER_PuedeCambiarSubTotal = 6;
        public const int C_PER_PuedeEliminarPedidoDeComanda = 7;
        public const int C_PER_PuedePedirCuenta = 8;
        public const int C_PER_PuedeCobrarCuenta = 9;
        public const int C_PER_PuedeCambiarNombreMesa = 10;

        private ICollection<PermisosPerfiles> _Permisos = null;
        private ICollection<PermisosPerfiles> Permisos
        {
            get
            {
                if (_Permisos == null)
                    CargarPermisos();
                return _Permisos;
            }
        }
        public void CargarPermisos()
        {
            //System.Web.Security.FormsAuthentication.GetAuthCookie()
            var usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];
            if (usuario != null)
                using (var DB = new TPVDBEntities())
                {
                    _Permisos = DB.PermisosPerfiles.Where(W => W.Codigo_Perfil == usuario.Codigo_Perfil).ToList();
                }
            else
                System.Web.Security.FormsAuthentication.SignOut();
        }

        [WebMethod(EnableSession = true)]
        public object GetPermisos()
        {
            var usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];

            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var permisos = DB.Perfiles.Where(w => w.Codigo_Perfil == usuario.Codigo_Perfil).SingleOrDefault().PermisosPerfiles;

                    bool MoverClientesMesa = permisos.Where(w => w.Codigo_Permiso == C_PER_PuedeMoverClientesDeMesa).FirstOrDefault() != null;
                    bool CambiarSubTotal = permisos.Where(w => w.Codigo_Permiso == C_PER_PuedeCambiarSubTotal).FirstOrDefault() != null;
                    bool EliminarPedido = permisos.Where(w => w.Codigo_Permiso == C_PER_PuedeEliminarPedidoDeComanda).FirstOrDefault() != null;
                    bool PedirCuenta = permisos.Where(w => w.Codigo_Permiso == C_PER_PuedePedirCuenta).FirstOrDefault() != null;
                    bool CobrarCuenta = permisos.Where(w => w.Codigo_Permiso == C_PER_PuedeCobrarCuenta).FirstOrDefault() != null;
                    bool CambiarNombreMesa = permisos.Where(w => w.Codigo_Permiso == C_PER_PuedeCambiarNombreMesa).FirstOrDefault() != null;

                    var _Admin = permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoAdministracion).FirstOrDefault() != null;
                    var _Config = permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoConfiguracion).FirstOrDefault() != null;
                    var _Ventas = permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoVentas).FirstOrDefault() != null;
                    var _InfEmpresa = permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoInfEmpresa).FirstOrDefault() != null;

                    return new
                    {
                        Result = "OK",
                        Admin = _Admin,
                        Config = _Config,
                        Ventas = _Ventas,
                        InfEmpresa = _InfEmpresa,
                        SoloVentas = (!_Admin && !_Config && !_InfEmpresa && _Ventas),
                        MoverClientesMesa = MoverClientesMesa,
                        CambiarSubTotal = CambiarSubTotal,
                        EliminarPedido = EliminarPedido,
                        PedirCuenta = PedirCuenta,
                        CobrarCuenta = CobrarCuenta,
                        CambiarNombreMesa = CambiarNombreMesa,
                    };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar permisos de usuario." };
            }
        }

        public bool Admin
        {
            get
            {
                return Permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoAdministracion).FirstOrDefault() != null;
            }
        }

        public bool Config
        {
            get
            {
                return Permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoConfiguracion).FirstOrDefault() != null;
            }
        }

        public bool Ventas
        {
            get
            {
                return Permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoVentas).FirstOrDefault() != null;
            }
        }

        public bool InfEmpresa
        {
            get
            {
                return Permisos.Where(w => w.Codigo_Permiso == C_PER_AccesoInfEmpresa).FirstOrDefault() != null;
            }
        }

        public bool SoloVentas
        {
            get
            {
                return (!Admin && !Config && !InfEmpresa && Ventas);
            }
        }

        [WebMethod(EnableSession = true)]
        public object GetPrinters()
        {
            var resultado = new List<object>();
            foreach (var NombrePrinter in System.Drawing.Printing.PrinterSettings.InstalledPrinters)
            {
                resultado.Add(new { DisplayText = NombrePrinter, Value = NombrePrinter });
            }

            return new { Result = "OK", Options = resultado };
        }
    }
}
