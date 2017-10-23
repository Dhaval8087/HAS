
import AppDispatcher from '../dispatcher/AppDispatcher';
import constants from '../constants/constants';
let InquiryActions={
    receiveInquiries: function(data) {
        AppDispatcher.handleAction({
          actionType: constants.RECEIVE_INQUIRES_RES,
          data: data
        })
    },
}
export default InquiryActions;