using BAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class AutheticationRepository : RepositoryBase<Logins>
    {
        #region private member
        const string _checkLogin = "usp_LoginCheck";
        #endregion
        public Logins CheckAuthetication(string username, string password)
        {
            Logins lg = new Logins();
            lg.UserName = username;
            lg.Password = password;
            var entity = this.GetEntity<Logins>(lg, _checkLogin);
            if (entity == null)
            {
                ValidationErrors.Errors.Add(new ValidationError { ErrorMessageResourceKey = "Bad Authetication", ErrorDescription = "Username or Password is invalid" });
            }
            return entity;
        }
    }
}
