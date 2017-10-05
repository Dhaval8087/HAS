using BAL.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
    public abstract class RepositoryBase<T>
    {
        public RepositoryBase()
        {
            ValidationErrors = new ValidationErrorList();
            
        }

        public ValidationErrorList ValidationErrors { get; set; }
        public string ConnectionString
        {
            get { return ConfigurationManager.AppSettings["ConnectionString"]; }
        }
    }
}