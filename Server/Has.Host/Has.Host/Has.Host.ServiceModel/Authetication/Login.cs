using ServiceStack;
using System;

namespace Has.Host.ServiceModel
{
    [Route("/LoginRequest")]
    public class LoginRequest : IReturn<LoginResponse>
    {
        public string EmailAddress { get; set; }
        public string Password { get; set; }
    }
    public class LoginResponse : ResultResponse
    {
        public string EmailAddress { get; set; }
        public string FullName { get; set; }
        public string AuthToken { get; set; }
        public string UserType { get; set; }
        public int UserTypeID { get; set; }
        public int ClientID { get; set; }
        public Guid UserID { get; set; }
    }
}
