using BAL.Model;
using BAL.Repository;
using Has.Host.ServiceModel;
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

        public InquiryResponse Any(AddInquiryRequest request)
        {
            InquiriesRepository repository = new InquiriesRepository();
            InquiryResponse response = new InquiryResponse();
            try
            {
                BAL.Model.Inquiry inqury = new BAL.Model.Inquiry
                {
                    Address = request.Address,
                    City = request.City,
                    ClientName = request.ClientName,
                    Comments = request.Comments,
                    InquiryCode = request.InquiryCode,
                    Type = request.Type,
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

        public ResultResponse Any(UploadQuatation request)
        {
            ResultResponse response = new ResultResponse();
            InquiriesRepository repository = new InquiriesRepository();
            try
            {
                var id = Convert.ToInt32(this.Request.QueryString["Id"]);
                byte[] fileData = null;
                using (var binaryReader = new BinaryReader(Request.Files[0].InputStream))
                {
                    fileData = binaryReader.ReadBytes((int)Request.Files[0].ContentLength);
                }
                response.ResultSuccess= repository.UpdateQuatation(id, fileData);

            }
            catch (Exception ex)
            {
                ValidationErrors.AddMany(repository.ValidationErrors);
                ValidationErrors.Add("Exception", ex.Message);
            }
            finally
            {
                response.ResultMessages = Utility.GetAllValidationErrorCodesAndMessages(ValidationErrors);
            }
            return response;
        }

        public GetInquiryReponse Any(GetInquiryRequest request)
        {
            InquiriesRepository repository = new InquiriesRepository();
            GetInquiryReponse response = new GetInquiryReponse();
            try
            {
                repository.GetInquiries().ForEach(item =>
                {
                    response.Inquires.Add(new ServiceModel.Inquiry.Inquiry
                    {
                        Address = item.Address,
                        City = item.City,
                        ClientName = item.ClientName,
                        Comments = item.Comments,
                        Id = item.Id.Value,
                        InquiryCode = item.InquiryCode,
                        InquiryType = item.InquiryType,
                        Region = item.Region,
                        Type = item.Type
                    });
                });
                response.ResultSuccess = true;
            }
            catch (Exception ex)
            {
                ValidationErrors.AddMany(repository.ValidationErrors);
                ValidationErrors.Add("Fail", "Failed to load Inquiry");
            }
            finally
            {
                response.ResultMessages = Utility.GetAllValidationErrorCodesAndMessages(ValidationErrors);
            }
            return response;
        }
    }
}
