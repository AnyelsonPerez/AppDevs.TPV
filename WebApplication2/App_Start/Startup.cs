using System;
using System.Reflection;
using System.Threading.Tasks;
using Autofac.Integration.WebApi;
using Autofac;
using System.Web.Http;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(WebApplication2.App_Start.Startup))]

namespace WebApplication2.App_Start
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            var config = GlobalConfiguration.Configuration;
            RegisterDependencies(app, config);
        }

        private void RegisterDependencies(IAppBuilder app, HttpConfiguration config)
        {
            var builder = new ContainerBuilder();

            builder.RegisterApiControllers(Assembly.GetExecutingAssembly());
            builder.RegisterWebApiFilterProvider(config);
            builder.RegisterWebApiModelBinderProvider();

            //RegisterRepositories(builder);
            //RegisterServices(builder);

            var container = builder.Build();

            config.DependencyResolver = new AutofacWebApiDependencyResolver(container);

            app.UseAutofacLifetimeScopeInjector(container);
            app.UseAutofacMiddleware(container);
            app.UseAutofacWebApi(config);

            config.MapHttpAttributeRoutes();
            config.EnsureInitialized();

            app.UseWebApi(config);
        }
    }
}