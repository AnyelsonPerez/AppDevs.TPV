using System;
using System.Linq;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace AppDevs.TPV.Hubs
{
    [HubName("refreshHub")]
    public class RefreshHub : Hub
    {
        [HubMethodName("refreshOrdenes")]
        public void RefreshOrdenes(string codigoMesa)
        {
            this.Clients.Others.onRefreshOrdenes(codigoMesa);
        }

        [HubMethodName("refrescar")]
        public void Refrescar(string codigoMesa, string codigoArea)
        {
            this.Clients.Others.onRefrescar(codigoMesa, codigoArea);
        }
    }
}