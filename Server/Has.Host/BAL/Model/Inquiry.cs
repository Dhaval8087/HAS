using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Model
{
    public class Inquiry
    {
        public int UID { get; set; }
        public string InquiryCode { get; set; }
        public int Type { get; set; }
        public int InquiryType { get; set; }
        public string City { get; set; }
        public string Region { get; set; }
        public string ClientName { get; set; }
        public string Address { get; set; }
        public string Comments { get; set; }
        public Byte[] Quotation { get; set; }
        public int? Id { get; set; }
    }
}
