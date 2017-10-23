using BAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


/*===============================================================
File:     InquiriesRepository.cs
Developer:  dpatel2
Date:      10/6/2017 12:49:25 PM
================================================================*/

namespace BAL.Repository
{

    public class InquiriesRepository : RepositoryBase<Inquiry>
    {

        // Private fields
        #region Fields

        const string _insertinqury = "usp_Inqury_INSERT";
        const string _getinquirybyid = "usp_GetInquiry_By_Id";
        const string _updateQuatation = "usp_UploadQuatation";
        const string _getInquiries = "usp_GetInquires";
        #endregion

        // All class constructors, initialize, terminate and dispose methods.
        #region Construct / Init / Terminate / Dispose


        #endregion

        // Use this region to implement interface members for the given interface.
        #region <interface name> Members
        #endregion

        // Properties for this class.
        #region Properties
        #endregion

        // Events for this class.
        #region Events
        #endregion

        // All public methods for this class.
        #region Methods
        public int InsertInquiry(Inquiry inqury)
        {
            return this.InsertAndGetEntityID(inqury, _insertinqury);
        }
        public Inquiry GetInquiryById(Inquiry inquiry)
        {
            return this.GetEntity<Inquiry>(inquiry, _getinquirybyid);
        }
        public bool UpdateQuatation(int Id, byte[] quatation)
        {
            Inquiry inq = new Inquiry
            {
                Id = Id,
                Quotation = quatation
            };
            return this.InsertOrUpdate<Inquiry>(inq, _updateQuatation);
        }
        public List<Inquiry> GetInquiries()
        {
            return this.GetEntityCollection<Inquiry>(new Inquiry { }, _getInquiries);
        }
        #endregion

        // All protected / private methods for this class.
        #region Helper methods
        #endregion

        // All event handlers for this class.
        #region Event handlers
        #endregion


    }
}