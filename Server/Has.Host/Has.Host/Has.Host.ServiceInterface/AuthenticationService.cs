using Has.Host.ServiceInterface.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Has.Host.ServiceModel;
using ServiceStack.Caching;
using Has.Host.ServiceModel.Types;
using Has.Host.ServiceModel.Common;

namespace Has.Host.ServiceInterface
{
    public class AuthenticationService : ServiceBase,IAuthenticationService
    {
        public ICacheClient CacheClient { get; set; }
        public object Any(LoginRequest request)
        {
            LoginResponse response = new LoginResponse();
            var guid = Guid.NewGuid().ToString();
            CacheItems cacheItems = new CacheItems { UserType = "Emp", AuthToken = guid, UserID = "13" };
            CacheClient.Add(guid, cacheItems, new TimeSpan(0, 1, 0, 0));
            return response;
        }
    }
}
