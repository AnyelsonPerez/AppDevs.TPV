using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Dynamic;

namespace AppDevs.Tpv.Core.Repository.Extensions
{
    public static class DynamicExtensions
    {
        public static object ToDynamic(this object entity)
        {
            if (entity == null)
            {
                return null;
            }

            IDictionary<string, object> expando = new ExpandoObject();

            foreach (PropertyDescriptor property in TypeDescriptor.GetProperties(entity.GetType()))
            {
                var value = property.GetValue(entity);

                if (!IsDefault(value))
                {
                    expando.Add(property.Name, value);
                }
            }

            return expando as ExpandoObject;
        }

        private static bool IsDefault(object value)
        {
            if (value == null)
            {
                return true;
            }

            if (value is ValueType)
            {
                object obj = Activator.CreateInstance(value.GetType());
                return obj.Equals(value);
            }
            return false;
        }
    }
}