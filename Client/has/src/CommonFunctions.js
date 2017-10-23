import React, { Component } from 'react'
import toastr from 'toastr';
import './common/toastr.css';
import LoginStore from './stores/LoginStore';
class CommonFunctions extends Component {
    static handleResponse(data, callback) {
        if (data != "undefined") {
            if (data.resultSuccess) {
                callback();
            }
            else {
                if (data && data.resultMessages && data.resultMessages.length) {
                    toastr.error(data.resultMessages[0].message);
                }

            }
        }
    }
    static getHeaders() {
        var authToken = LoginStore.getUserInfo().authToken;
        return {
            'Authorization': 'D18F5B97-9FC2-4355-B293-0000044B8088',
            'x-user-id': authToken
        };
    }
    render() {
        return (
            <div>

            </div>
        )
    }
}

export default CommonFunctions