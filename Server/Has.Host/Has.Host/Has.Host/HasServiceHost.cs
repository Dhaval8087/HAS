using Funq;
using ServiceStack;
using Has.Host.ServiceInterface;
using ServiceStack.Caching;
using System.Web;
using System;

[assembly: WebActivatorEx.PreApplicationStartMethod(typeof(Has.Host.App_Start.HasServiceHost), "Start")]
namespace Has.Host.App_Start
{
    //VS.NET Template Info: https://servicestack.net/vs-templates/EmptyAspNet
    public class HasServiceHost : AppHostBase
    {
        /// <summary>
        /// Base constructor requires a Name and Assembly where web service implementation is located
        /// </summary>
        public HasServiceHost()
            : base("Has Service Host", typeof(MyServices).Assembly) { }

        /// <summary>
        /// Application specific configuration
        /// This method should initialize any IoC resources utilized by your web service classes.
        /// </summary>
        public override void Configure(Funq.Container container)
        {
            container.Register<ICacheClient>(new MemoryCacheClient());

            //Set JSON web services to return idiomatic JSON camelCase properties
            ServiceStack.Text.JsConfig.EmitCamelCaseNames = true;
            this.PreRequestFilters.Add((req, res) =>
            {
                var apiKey = req.Headers["x-api-key"];
                if (apiKey == null || !Clients.VerifyKey(apiKey))
                {
                    res.StatusCode = 401;
                    res.Write("Error:" + "Invalid Api-Key");
                    //HttpResponse httpResponse = res.OriginalResponse as HttpResponse;
                    //httpResponse.SuppressFormsAuthenticationRedirect = true;
                    res.End();
                }
            });
            this.PreRequestFilters.Add((req, res) =>
            {
                var cacheClient = req.TryResolve<ICacheClient>();
                string authToken = req.Headers["x-user-id"];
                var cacheValue = cacheClient.Get<CacheItems>(authToken);
                Guid guid;
                Guid.TryParse(authToken, out guid);
                string responseMessage = string.Empty;
                bool IsFailure = false;
                //Checks Whether They Provided Valid AuthToken or not
                if (guid.ToString().Equals("00000000-0000-0000-0000-000000000000"))
                {
                    responseMessage = "Error:Invalid Authentication";
                    IsFailure = true;
                }
                else if (cacheValue != null && authToken != cacheValue.AuthToken)
                {
                    responseMessage = "Error:Invalid Authentication";
                    IsFailure = true;
                }
                else if (cacheValue == null)
                {
                    /*if (authenticationService.GetByAuthTokenID(new Guid(req.Headers["x-user-id"])) != null)
                    {
                        responseMessage = "Error:AuthToken Expired.please login again.";
                    }
                    else
                    {
                        responseMessage = "Error:Invalid Authentication";
                        IsFailure = true;
                    }*/
                }
                if (IsFailure)
                {
                    res.StatusCode = 401;
                    res.Write(responseMessage);
                    HttpResponse httpResponse = res.OriginalResponse as HttpResponse;
                    httpResponse.SuppressFormsAuthenticationRedirect = true;
                    res.End();
                }
            });
            this.PreRequestFilters.Add((req, res) =>
            {
                var cacheClient = req.TryResolve<ICacheClient>();
                var authToken = req.Headers["x-user-id"];
                var cacheValue = cacheClient.Get<CacheItems>(authToken);
                if (cacheValue != null)
                {
                    CacheItems cacheItems = new CacheItems { UserType = cacheValue.UserType, AuthToken = cacheValue.AuthToken };
                    cacheClient.Replace(cacheValue.AuthToken, cacheItems, new TimeSpan(0, 1, 0, 0));
                }
                else
                {

                    res.StatusCode = 401;
                    res.Write("Error:" + "Session Time Out");
                    HttpResponse httpResponse = res.OriginalResponse as HttpResponse;
                    httpResponse.SuppressFormsAuthenticationRedirect = true;
                    res.End();
                }
            });
        }

        public static void Start()
        {
            new HasServiceHost().Init();
        }
    }
}