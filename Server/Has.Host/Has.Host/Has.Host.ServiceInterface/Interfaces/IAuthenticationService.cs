using Has.Host.ServiceModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Has.Host.ServiceInterface.Interfaces
{
    public interface IAuthenticationService
    {
        LoginResponse Any(LoginRequest request);
    }
}
