using BAL;
using Has.Host.ServiceModel.Common;
using Has.Host.ServiceModel.Types;
using ServiceStack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Has.Host.ServiceInterface
{
    public class ServiceBase : Service
    {
        public UserType UserType { get; set; }
        public int userID { get; set; }
        public string strUserName { get; set; }
        ValidationErrorList validationErrors;
        public ValidationErrorList ValidationErrors { get { if (validationErrors == null) { validationErrors = new ValidationErrorList(); } return validationErrors; } set { validationErrors = value; } }
        ValidationErrorList validationWarnings;
        public ValidationErrorList ValidationWarnings { get { if (validationWarnings == null) { validationWarnings = new ValidationErrorList(); } return validationWarnings; } set { validationWarnings = value; } }
    }
}
