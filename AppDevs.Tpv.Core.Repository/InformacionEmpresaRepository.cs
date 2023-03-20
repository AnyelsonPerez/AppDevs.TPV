using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;

namespace AppDevs.Tpv.Core.Repository
{
    public class InformacionEmpresaRepository : IRepository<InformacionEmpresa>
    {
        private readonly IDataContext _dataContext;

        public InformacionEmpresaRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new ArgumentNullException(nameof(dataContext));
        }

        public InformacionEmpresa Get()
        {
            return _dataContext
                 .CallGetProcedure<InformacionEmpresa, object>(
                     "[SPC_GET_INFORMACIONEMPRESA]",
                     null)
                 .FirstOrDefault();
        }

        public IEnumerable<InformacionEmpresa> Get(InformacionEmpresa entidad)
        {
            return _dataContext
                .CallGetProcedure<InformacionEmpresa, object>(
                    "[SPC_GET_INFORMACIONEMPRESA]",
                    null
                );
        }

        public InformacionEmpresa Get(int id)
        {
            return _dataContext
                .CallGetProcedure<InformacionEmpresa, object>(
                     "[SPC_GET_INFORMACIONEMPRESA]",
                     new { IdInformacionEmpresa = id })
                .FirstOrDefault();
        }

        public InformacionEmpresa Set(InformacionEmpresa info)
        {
            _dataContext
               .CallSetProcedure(
                   "[SPC_SET_INFORMACIONEMPRESA]",
                   info);

            return Get();
        }
    }
}