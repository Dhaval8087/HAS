using BAL.Model;
using BAL.Repository;
using Has.Host.ServiceModel.Inquiry;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Has.Host.ServiceInterface
{
    public class InquiryService : ServiceBase
    {
        InquiriesRepository repository;


        public InquiryResponse Any(AddInquiryRequest request)
        {
            repository = new InquiriesRepository();
            InquiryResponse response = new InquiryResponse();
            try
            {
                Inquiry inqury = new Inquiry
                {
                    Address = request.Address,
                    City = request.City,
                    ClientName = request.ClientName,
                    Comments = request.Comments,
                    InquiryCode = request.InquiryCode,
                    InquiryType = request.InquiryType,
                    Region = request.Region,
                    Quotation = request.Quotation
                };
                //FileStream fStream = File.OpenRead("G:\\t.pdf");

                //byte[] contents = new byte[fStream.Length];

                //fStream.Read(contents, 0, (int)fStream.Length);

                //fStream.Close();
                //Inquiry inq = new Inquiry
                //{
                //    Address = "Temp",
                //    City = "Baroda",
                //    ClientName = "Andromeda",
                //    Comments = "Test Entry",
                //    InquiryCode = "AQLPPS",
                //    InquiryType = 1,
                //    Region="Surat",
                //    Quotation= contents
                //};

                response.UID = repository.InsertInquiry(inqury);
                response.ResultSuccess = true;
            }
            catch (Exception)
            {
                ValidationErrors.AddMany(repository.ValidationErrors);
                ValidationErrors.Add("InquryFail", "Failed to Insert Inqury.");
            }
            finally
            {
                response.ResultMessages = Utility.GetAllValidationErrorCodesAndMessages(ValidationErrors);
            }

            return response;
        }

    }
}
