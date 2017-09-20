using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Has.Host.ServiceModel
{
    public class ResultResponse
    {
        public bool ResultSuccess { get; set; }
        private List<ResultMessage> resultMessages;
        public ResultResponse()
        {
            resultMessages = new List<ResultMessage>();
        }
        public List<ResultMessage> ResultMessages
        {
            get { return resultMessages; }
            set { resultMessages = value; }
        }
    }
    public class ResultMessage
    {
        public string Key { get; set; }
        public string Message { get; set; }
    }

}
