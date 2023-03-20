using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class UnidadesMedidasRepository : IRepository<UnidadesMedidas>
    {
        private readonly IDataContext _dataContext;

        public UnidadesMedidasRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<UnidadesMedidas> Get(UnidadesMedidas entity)
        {
            return _dataContext
                .CallGetProcedure<UnidadesMedidas, object>(
                    "[SPC_GET_UNIDADESMEDIDAS]",
                    entity.ToDynamic())
                .ToList();
        }

        public UnidadesMedidas Set(UnidadesMedidas entity)
        {
            var id = _dataContext
                .CallSetProcedure(
                    "[SPC_SET_UNIDADESMEDIDAS]",
                    entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }

        public UnidadesMedidas Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<UnidadesMedidas, object>(
                     "[SPC_GET_UNIDADESMEDIDAS]",
                     new { Codigo_Unidad_Medida = id })
                 .FirstOrDefault();
        }
    }
}