import AppDispatcher from '../dispatcher/AppDispatcher';
import { EventEmitter } from 'events';
import constants from '../constants/constants';
import AppConstant from '../constants/AppConstants';
import config from '../Application.config';
import CommonFunctions from '../CommonFunctions';
import InquiryActions from '../actions/inquiryActions';
import LoginStore from './LoginStore';
import $ from "jquery"
import _ from 'underscore';
let CHANGE_EVENT = 'change';
let _inquires = [];
function loadInquires(data){
    _inquires=data.inquires;
}
var InquiryStore = _.extend({}, EventEmitter.prototype, {
    // Emit Change event
    emitChange: function () {
        this.emit(CHANGE_EVENT);
    },
    // Add change listener
    addChangeListener: function (callback) {
        this.on(CHANGE_EVENT, callback);
    },
    // Remove change listener
    removeChangeListener: function (callback) {
        this.removeListener(CHANGE_EVENT, callback);
    },
    getInquiries: function () {
        return _inquires;
    },
    AddInquiry: function (data, callback) {
        var url = config.dev_Url + AppConstant.AddInquiryRequest;
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            dataType: 'json',
            processData: true,
            headers: CommonFunctions.getHeaders(),
            success: function (data) {
                CommonFunctions.handleResponse(data, function () {
                    callback(data);
                });
            },
            error: function (xhr) {

            }.bind(this)
        });
    },
    GetInquiriesApiCall:function(data){
        var url = config.dev_Url + AppConstant.GetInquiryRequest;
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            dataType: 'json',
            processData: true,
            headers: CommonFunctions.getHeaders(),
            success: function (data) {
                CommonFunctions.handleResponse(data, function () {
                    InquiryActions.receiveInquiries(data);
                });
            },
            error: function (xhr) {

            }.bind(this)
        });
    },
    UploadQuatation: function (formData, id, callback) {
        var url = config.dev_Url + AppConstant.UploadQuatation + "?Id=" + id;
        $.ajax({
            url: url,
            data: formData,
            type: 'POST',
            async: false,
            cache: false,
            contentType: false,
            headers:CommonFunctions.getHeaders(),
            processData: false,
            success: function (data) {
                CommonFunctions.handleResponse(data, function () {
                    callback(data);
                });
            },
            error: function (xhr) {

            }.bind(this)
        });
    }

});
AppDispatcher.register(function (payload) {
    var action = payload.action;
    switch (action.actionType) {
        case constants.RECEIVE_INQUIRES_RES:
             loadInquires(action.data);
            break;

        default:
            return true;
    }
    // If action was responded to, emit change event
    InquiryStore.emitChange();
});
export default InquiryStore;