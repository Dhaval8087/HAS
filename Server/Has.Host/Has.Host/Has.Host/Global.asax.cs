using Has.Host.App_Start;
using System;
using System.Web;

namespace Has.Host
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            if (HttpContext.Current.Application["AppSettings"] == null)
            {
               /* INameValuesService nameValuesService = new NameValuesService();
                List<NameValues> objNameValue = nameValuesService.GetNameValuesBySuitID(Convert.ToByte(ConfigurationManager.AppSettings["SuiteID"]));
                Hashtable hshAppSettings = new Hashtable(objNameValue.ToDictionary(e => e.Name, e => e.NameValue));
                if (hshAppSettings.Count > 0)
                {
                    HttpContext.Current.Application["AppSettings"] = hshAppSettings;
                }*/
            }
        }
    }
}