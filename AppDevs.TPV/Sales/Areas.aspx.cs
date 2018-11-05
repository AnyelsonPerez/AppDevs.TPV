using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;

namespace AppDevs.TPV.Sales
{
    public partial class Areas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int? CodigoArea = null;
            if (Session["CodigoAreaActual"] != null)
                CodigoArea = int.Parse(Session["CodigoAreaActual"].ToString());
            Session.Remove("CodigoAreaActual");

            using (var DB = new TPVDBEntities())
            {
                var Areas = DB.SPC_GET_AREA(null, null, null, true);
                foreach (var Area in Areas)
                {
                    if (!CodigoArea.HasValue) CodigoArea = Area.Codigo_Area;
                    if (CodigoArea.Value == Area.Codigo_Area)
                        dArea.Style.Add(HtmlTextWriterStyle.BackgroundColor, Area.Color_Area);

                    var li = new HtmlGenericControl("li");
                    var a = new HtmlGenericControl("a");

                    a.Attributes.Add("href", "#");
                    a.Attributes.Add("Data-CodigoArea", Area.Codigo_Area.ToString());
                    a.Attributes.Add("Data-ColorArea", Area.Color_Area);
                    a.InnerText = Area.Area;

                    li.Controls.Add(a);
                    uListaAreas.Controls.Add(li);
                }

                if (CodigoArea.HasValue)
                {
                    dArea.Attributes.Add("Data-CodigoArea", CodigoArea.Value.ToString());
                    //MostrarMesas(CodigoArea);
                }
            }
        }

        [WebMethod]
        public static List<SPC_GET_MESA_Result> GetMesas(int? Codigo_Area)
        {
            List<SPC_GET_MESA_Result> Mesas = null;
            using (var DB = new TPVDBEntities())
            {
                Mesas = DB.SPC_GET_MESA(null, null, Codigo_Area, null,
                    null, null, null, null, true).ToList();
            }

            return Mesas;
        }

        public void MostrarMesas(int? Codigo_Area)
        {
            //dArea.Controls.Clear();
            using (var DB = new TPVDBEntities())
            {
                foreach (var mesa in DB.SPC_GET_MESA(null, null, Codigo_Area, null,
                    null, null, null, null, true).ToList())
                {
                    //var dMesa = $('*[data-posicionx="' + mesa.PosicionX + '"][data-posiciony="' + mesa.PosicionY + '"]');
                    //if (!!dMesa)
                    //{
                    //    if (!!dMesa.length) dMesa = dMesa[0];
                    //    var pNombreMesa = $('i', dMesa);
                    //    if (!!pNombreMesa.length) pNombreMesa = pNombreMesa[0];

                    //    if (mesa.Codigo_Estado_Orden == 2)
                    //    {
                    //        pNombreMesa.className = 'fa fa-file-text fa-fw ocupada';
                    //        dMesa.style.backgroundColor = invertColor(mesa.Color_Mesa);
                    //    }
                    //    else if (mesa.Ocupada)
                    //    {
                    //        pNombreMesa.className = 'ocupada';
                    //        dMesa.style.backgroundColor = invertColor(mesa.Color_Mesa);
                    //    }
                    //    else
                    //        dMesa.style.backgroundColor = mesa.Color_Mesa;

                    //    pNombreMesa.innerText = mesa.Mesa;

                    //    dMesa.classList.add('mesaActiva');
                    //    dMesa.dataset.codigomesa = mesa.Codigo_Mesa;

                    //}


                var dMesa = new HtmlGenericControl("div");
                    var pNombeMesa = new HtmlGenericControl("i");

                    if (mesa.Codigo_Estado_Orden == 2)
                    {
                        pNombeMesa.Attributes.Add("class", "fa fa-file-text fa-fw ocupada");
                        dMesa.Style.Add(HtmlTextWriterStyle.BackgroundColor, invertColor(mesa.Color_Mesa));
                    }
                    else if (mesa.Ocupada.HasValue && mesa.Ocupada.Value)
                    {
                        pNombeMesa.Attributes.Add("class", "ocupada");
                        dMesa.Style.Add(HtmlTextWriterStyle.BackgroundColor, invertColor(mesa.Color_Mesa));
                    }
                    else
                    {
                        dMesa.Style.Add(HtmlTextWriterStyle.BackgroundColor, mesa.Color_Mesa);
                    }

                    pNombeMesa.InnerText = mesa.Mesa;
                    dMesa.Controls.Add(pNombeMesa);
                    pNombeMesa = null;

                    dMesa.Attributes.Add("class", "mesa");

                    dMesa.Attributes.Add("data-codigomesa", mesa.Codigo_Mesa.ToString());

                    dMesa.Style.Add("Width", mesa.Base.ToString());
                    dMesa.Style.Add("Height", mesa.Altura.ToString());

                    dMesa.Style.Add("Left", mesa.PosicionX.ToString());
                    dMesa.Style.Add("Top", mesa.PosicionY.ToString());

                    dArea.Controls.Add(dMesa);
                    dMesa = null;
                }
            }
        }

        [WebMethod]
        public string Tirame(string A)
        {
            if (A != null)
                return "1";
            else
                return "-99";
        }

        private string invertColor(string hex)
        {
            if (hex.IndexOf("rgb") == 0)
            {
                hex = rgb2hex(hex);
            }
            if (hex.IndexOf('#') == 0)
            {
                hex = hex.Substring(1);
            }
            // convert 3-digit hex to 6-digits.
            if (hex.Length == 3)
            {
                hex = hex[0].ToString() + hex[0].ToString() + hex[1].ToString() + hex[1].ToString() + hex[2].ToString() + hex[2].ToString();
            }
            if (hex.Length != 6)
            {
                return null;
            }
            // invert color components
            var r = (255 - int.Parse(hex.Substring(0, 2), System.Globalization.NumberStyles.HexNumber)).ToString("X");
            var g = (255 - int.Parse(hex.Substring(2, 2), System.Globalization.NumberStyles.HexNumber)).ToString("X");
            var b = (255 - int.Parse(hex.Substring(4, 2), System.Globalization.NumberStyles.HexNumber)).ToString("X");
            // pad each with zeros and return
            return '#' + r.PadLeft(2, '0') + g.PadLeft(2, '0') + b.PadLeft(2, '0');
        }

        private string rgb2hex(string rgb)
        {
            var regex = new System.Text.RegularExpressions.Regex(@"^rgb?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?");
            var result = regex.Match(rgb);
            return (result != null && result.Length >= 4) ? "#" +
             int.Parse(result.Groups[1].Value).ToString("X").PadLeft(2, '0') +
             int.Parse(result.Groups[2].Value).ToString("X").PadLeft(2, '0') +
             int.Parse(result.Groups[3].Value).ToString("X").PadLeft(2, '0') : "";
        }
    }
}