using System.Reflection;
using System.Web.Http;
using AppDevs.Tpv.Core.DB.Context;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;
using AppDevs.Tpv.Core.Repository;
using AppDevs.Tpv.Core.Services;
using Autofac;
using Autofac.Integration.WebApi;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(AppDevs.Tpv.API.App_Start.Startup))]

namespace AppDevs.Tpv.API.App_Start
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
            builder.RegisterType<AreasService>()
                .As<IService<AreasDto>>()
                .InstancePerRequest();

            builder.RegisterType<CategoriasProductoService>()
                .As<IService<CategoriasProductosDto>>()
                .InstancePerRequest();

            builder.RegisterType<InformacionEmpresaService>()
                .As<IService<InformacionEmpresaDto>>()
                .InstancePerRequest();

            builder.RegisterType<MesasService>()
                .As<IService<MesasDto>>()
                .InstancePerRequest();

            builder.RegisterType<OrdenesDetalleService>()
                .As<IService<OrdenesDetallesDto>>()
                .InstancePerRequest();

            builder.RegisterType<OrdenesService>()
                .As<IService<OrdenesDto>>()
                .InstancePerRequest();

            builder.RegisterType<PerfilesService>()
                .As<IService<PerfilesDto>>()
                .InstancePerRequest();

            builder.RegisterType<PermisosPerfilesService>()
                .As<IService<PermisosPerfilesDto>>()
                .InstancePerRequest();

            builder.RegisterType<PermisosService>()
                .As<IService<PermisosDto>>()
                .InstancePerRequest();

            builder.RegisterType<ProductosService>()
                .As<IService<ProductosDto>>()
                .InstancePerRequest();

            builder.RegisterType<ProductosUnidadesMedidasService>()
                .As<IService<ProductosUnidadesMedidasDto>>()
                .InstancePerRequest();

            builder.RegisterType<TiposProductosService>()
                .As<IService<TiposProductosDto>>()
                .InstancePerRequest();

            builder.RegisterType<UnidadesMedidasService>()
                .As<IService<UnidadesMedidasDto>>()
                .InstancePerRequest();

            builder.RegisterType<UsuariosService>()
                .As<IService<UsuariosDto>>()
                .InstancePerRequest();
        }

        private void RegisterRepositories(ContainerBuilder builder)
        {
            builder.Register(ctx => new TpvDataContext())
                .As<TpvDataContext>();

            builder.RegisterType<DataContext>()
                .As<IDataContext>()
                .InstancePerRequest();

            builder.RegisterType<AreasRepository>()
                .As<IRepository<Areas>>()
                .InstancePerRequest();

            builder.RegisterType<CategoriasProductosRepository>()
                .As<IRepository<CategoriasProductos>>()
                .InstancePerRequest();

            builder.RegisterType<InformacionEmpresaRepository>()
                .As<IRepository<InformacionEmpresa>>()
                .InstancePerRequest();

            builder.RegisterType<MesasRepository>()
                .As<IRepository<Mesas>>()
                .InstancePerRequest();

            builder.RegisterType<OrdenesDetalleRepository>()
                .As<IRepository<OrdenesDetalles>>()
                .InstancePerRequest();

            builder.RegisterType<PerfilesRepository>()
                .As<IRepository<Perfiles>>()
                .InstancePerRequest();

            builder.RegisterType<PermisosPerfilesRepository>()
                .As<IRepository<PermisosPerfiles>>()
                .InstancePerRequest();

            builder.RegisterType<PermisosRepository>()
                .As<IRepository<Permisos>>()
                .InstancePerRequest();

            builder.RegisterType<ProductosRepository>()
                .As<IRepository<Productos>>()
                .InstancePerRequest();

            builder.RegisterType<ProductosUnidadesMedidasRepository>()
                .As<IRepository<ProductosUnidadesMedidas>>()
                .InstancePerRequest();

            builder.RegisterType<TiposProductosRepository>()
                .As<IRepository<TiposProductos>>()
                .InstancePerRequest();

            builder.RegisterType<UnidadesMedidasRepository>()
                .As<IRepository<UnidadesMedidas>>()
                .InstancePerRequest();

            builder.RegisterType<UsuariosRepository>()
                .As<IRepository<Usuarios>>()
                .InstancePerRequest();
        }
    }
}