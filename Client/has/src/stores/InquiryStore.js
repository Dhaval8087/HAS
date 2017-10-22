import AppDispatcher from '../dispatcher/AppDispatcher';
import { EventEmitter } from 'events';
import constants from '../constants/constants';
import AppConstant from '../constants/AppConstants';
import config from '../Application.config';
import CommonFunctions from '../CommonFunctions';
import $ from "jquery"
import _ from 'underscore';
let CHANGE_EVENT = 'change';

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

    AddInquiry: function (data, callback) {
        var url = config.dev_Url + AppConstant.AddInquiryRequest;

        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            dataType: 'json',
            processData: true,
            headers: { "Authorization": "D18F5B97-9FC2-4355-B293-0000044B8088" },
            success: function (data) {
                CommonFunctions.handleResponse(data, function () {
                    callback(data);
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
        case constants.ADD_INQUIRY_REQ:

            break;

        default:
            return true;
    }
    // If action was responded to, emit change event
    InquiryStore.emitChange();
});
export default InquiryStore;