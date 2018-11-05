using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;

using System.Drawing.Printing;
using System.Data;
using System.Drawing;

namespace AppDevs.TPV.Utils
{
    public class Printing
    {
        public const short FILE_ATTRIBUTE_NORMAL = 0x80;
        public const short INVALID_HANDLE_VALUE = -1;
        public const uint GENERIC_READ = 0x80000000;
        public const uint GENERIC_WRITE = 0x40000000;
        public const uint CREATE_NEW = 1;
        public const uint CREATE_ALWAYS = 2;
        public const uint OPEN_EXISTING = 3;

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern IntPtr CreateFile(string lpFileName, uint dwDesiredAccess,
            uint dwShareMode, IntPtr lpSecurityAttributes, uint dwCreationDisposition,
            uint dwFlagsAndAttributes, IntPtr hTemplateFile);

        public static void sendTextToLPT1(String receiptText)
        {
            IntPtr ptr = CreateFile("LPT1", GENERIC_WRITE, 0,
                     IntPtr.Zero, OPEN_EXISTING, 0, IntPtr.Zero);

            /* Is bad handle? INVALID_HANDLE_VALUE */
            if (ptr.ToInt32() == INVALID_HANDLE_VALUE)
            {
                /* ask the framework to marshall the win32 error code to an exception */
                Marshal.ThrowExceptionForHR(Marshal.GetHRForLastWin32Error());
            }
            else
            {
                FileStream lpt = new FileStream(ptr, FileAccess.ReadWrite);
                Byte[] buffer = new Byte[2048];
                //Check to see if your printer support ASCII encoding or Unicode.
                //If unicode is supported, use the following:
                //buffer = System.Text.Encoding.Unicode.GetBytes(Temp);
                buffer = System.Text.Encoding.ASCII.GetBytes(receiptText);
                lpt.Write(buffer, 0, buffer.Length);
                lpt.Close();
            }
        }

        public static void ImprimirCuenta()
        {
            try
            {
                //ReportDocument crystalReport = new ReportDocument();

                //crystalReport.Load(HttpContext.Current.Server.MapPath("~/CrystalReport2.rpt"));
                ///*DataSet dsCustomers = GetData("select * from visitor_details where  id ='" +
                //    HttpContext.Current.Session["sessionvid"] + "' and  plant ='" + HttpContext.Current.Session["sessionplant"] + "'");*/

                ////DataTable dataTable = dsCustomers.Tables[0];

                //DataTable table;

                //using (var DB = new TPVEntities())
                //{
                //    var resultado = DB.SPC_GET_ORDENDETALLE(1, null, null, null, null, null, null, null, null).ToList();

                //    //table = ToDataTable(resultado);
                //}


                ////crystalReport.Database.Tables["visitor_details"].SetDataSource((DataTable)table);
                ///*CrystalReportViewer2.ReportSource = crystalReport;
                //CrystalReportViewer2.Zoom(100);
                ////crystalReportViewer1.ExportReport() ;
                //CrystalReportViewer2.RefreshReport();*/

                //PrinterSettings settings = new PrinterSettings();
                //crystalReport.PrintOptions.PrinterName = settings.PrinterName;
                //crystalReport.PrintToPrinter(1, false, 0, 0);

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public static DataTable ToDataTable(List<SPC_GET_ORDENDETALLE_Result> data)
        {
            System.ComponentModel.PropertyDescriptorCollection properties =
                System.ComponentModel.TypeDescriptor.GetProperties(typeof(SPC_GET_ORDENDETALLE_Result));
            DataTable table = new DataTable();
            foreach (System.ComponentModel.PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (SPC_GET_ORDENDETALLE_Result item in data)
            {
                DataRow row = table.NewRow();
                foreach (System.ComponentModel.PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;
        }
    }
    public class LineaPedido
    {
        public int LineIndex { get; set; }
        public string LineText { get; set; }
        public Font Fuente { get; set; }
        public StringFormat Center { get; set; }

        public LineaPedido(int index, string text, Font fuente, StringFormat center = null) {
            LineIndex = index;
            LineText = text;
            Fuente = fuente;
            Center = center;
        }
    }
}