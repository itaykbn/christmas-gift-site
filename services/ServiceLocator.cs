using regestrationV2.services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace regestrationV2
{

    public interface IServiceLocator
    {
        T GetService<T>();
    }

    /**
     * Usage:
     * IServiceLocator locator = new ServiceLocator();
     * IServiceA myServiceA = locator.GetService<IServiceA>();
     */
    public class ServiceLocator: IServiceLocator
    {

        private static IServiceLocator instance = null;
        public static IServiceLocator Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServiceLocator();
                }
                return instance;
            }
        }


        // map that contains pairs of interfaces and
        // references to concrete implementations
        private IDictionary<object, object> services;

        private ServiceLocator()
        {
            services = new Dictionary<object, object>();
            // fill the map
            this.services.Add(typeof(DBAccesor), new DBAccesor());
            this.services.Add(typeof(XMLAccesor), new XMLAccesor());
            
        }

        public T GetService<T>() 
        {
            try
            {
                return (T)services[typeof(T)];
            }
            catch (KeyNotFoundException)
            {
                throw new ApplicationException("The requested service is not registered");
            }
        }

        public void Register(object o)
        {
            this.services.Add(o.GetType(), o);
        }

    }
}