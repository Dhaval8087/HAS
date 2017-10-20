import AppDispatcher from '../dispatcher/AppDispatcher';
import { EventEmitter } from 'events';
import constants from '../constants/constants';
import AppConstant from '../constants/AppConstants';
import config from '../Application.config';
import toastr from 'toastr';
import '../common/toastr.css';
import $ from "jquery"
import _ from 'underscore';
let CHANGE_EVENT = 'change';
let _loginResponse = '';
let userInfo = '';
var LoginStore = _.extend({}, EventEmitter.prototype, {
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
    getAutheticateInformation: function () {
        return _loginResponse;
    },
    getUserInfo: function () {
        return userInfo;
    },
    AutheticateUser: function (data, callback) {
        var url = config.dev_Url + AppConstant.LogineRequest;

        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            dataType: 'json',
            processData: true,
            headers: { "Authorization": "D18F5B97-9FC2-4355-B293-0000044B8088" },
            success: function (data) {
                if (data.resultSuccess) {
                    userInfo = data;
                    callback();
                }
                else {
                  toastr.error(data.resultMessages[0].message);
                }


            },
            error: function (xhr) {

            }.bind(this)
        });
    }
});
AppDispatcher.register(function (payload) {
    var action = payload.action;

    switch (action.actionType) {
        case constants.RECEIVE_LOGIN_RES:
            //loadCashFlowData(action.data);
            break;
        default:
            return true;
    }
    // If action was responded to, emit change event
    LoginStore.emitChange();
});
export default LoginStore;
//export { LoginStore as default }
//module.exports = LoginStore;