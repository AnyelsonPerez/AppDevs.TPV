using System.Reflection;
using System.Web.Http;
using AppDevs.Tpv.Core.DB.Context;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Dto.Interfaces;
using AppDevs.Tpv.Core.Repository;
using AppDevs.Tpv.Core.Services;
using Autofac;
using Autofac.Integration.WebApi;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(AppDevs.Tpv.Core.App_Start.Startup))]

namespace AppDevs.Tpv.Core.App_Start
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

            RegisterRepositories(builder);
            RegisterServices(builder);

            var container = builder.Build();

            config.DependencyResolver = new AutofacWebApiDependencyResolver(container);

            app.UseAutofacLifetimeScopeInjector(container);
            app.UseAutofacMiddleware(container);
            app.UseAutofacWebApi(config);

            config.MapHttpAttributeRoutes();
            config.EnsureInitialized();

            app.UseWebApi(config);
        }

        private void RegisterServices(ContainerBuilder builder)
        {
            builder.RegisterType<UsuariosService>()
                .As<IUsuariosService>()
                .InstancePerRequest();
        }

        private void RegisterRepositories(ContainerBuilder builder)
        {
            builder.Register(ctx => new TpvDataContext())
                .As<TpvDataContext>();

            builder.RegisterType<DataContext>()
                .As<IDataContext>()
                .SingleInstance();

            builder.RegisterType<UsuariosRepository>()
                .As<IUsuariosRepository>()
                .InstancePerRequest();
        }
    }
}