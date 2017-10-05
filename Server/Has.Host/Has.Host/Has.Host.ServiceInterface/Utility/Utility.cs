using BAL;
using Has.Host.ServiceModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Has.Host.ServiceInterface
{
    public static class Utility
    {
        /// <summary>
        /// Get all error codes and messages from Validationerrors
        /// </summary>
        /// <param name="validationErrors"></param>
        /// <returns></returns>
        public static List<ResultMessage> GetAllValidationErrorCodesAndMessages(ValidationErrorList validationErrors)
        {
            List<ResultMessage> resultMessages = new List<ResultMessage>();
            foreach (ValidationError validationError in validationErrors.Errors.ToList())
            {
                resultMessages.Add(new ResultMessage { Key = validationError.ErrorMessageResourceKey, Message = validationError.ErrorDescription });
            }
            return resultMessages;
        }
    }
}
