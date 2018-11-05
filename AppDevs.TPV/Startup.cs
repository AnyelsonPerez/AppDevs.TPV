using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(AppDevs.TPV.Startup))]
namespace AppDevs.TPV
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}