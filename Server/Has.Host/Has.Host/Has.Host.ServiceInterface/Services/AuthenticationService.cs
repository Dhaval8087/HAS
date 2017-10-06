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
using BAL.Model;
using System.Data;
using BAL.Repository;

namespace Has.Host.ServiceInterface
{
    public class AuthenticationService : ServiceBase, IAuthenticationService
    {
        public ICacheClient CacheClient { get; set; }
        public LoginResponse Any(LoginRequest request)
        {
            LoginResponse response = new LoginResponse();
            try
            {
                AutheticationRepository repository = new AutheticationRepository();
                var login = repository.CheckAuthetication(request.EmailAddress, request.Password);
                if (login != null && !repository.ValidationErrors.Errors.Any())
                {
                    response.EmailAddress = login.UserName;
                    response.UserTypeID = login.RoleId;

                    var guid = Guid.NewGuid().ToString();
                    CacheItems cacheItems = new CacheItems { AuthToken = guid };
                    CacheClient.Add(guid, cacheItems, new TimeSpan(0, 1, 0, 0));
                    response.AuthToken = guid;
                    response.ResultSuccess = true;
                }
                else
                {
                    response.ResultSuccess = false;
                }
                ValidationErrors.AddMany(repository.ValidationErrors);
            }
            catch (Exception ex)
            {
                ValidationErrors.Add("LoginFail", "Failed to Login.");
            }
            finally
            {
                response.ResultMessages = Utility.GetAllValidationErrorCodesAndMessages(ValidationErrors);
            }
            return response;
        }
    }
}
