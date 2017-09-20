using ServiceStack;

namespace Has.Host.ServiceModel
{
    [Route("/LoginRequest")]
    public class LoginRequest : IReturn<LoginResponse>
    {
        public string EmailAddress { get; set; }
        public string Password { get; set; }
    }
}
