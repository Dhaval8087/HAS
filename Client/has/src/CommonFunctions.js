import React, { Component } from 'react'
import toastr from 'toastr';
import './common/toastr.css';
class CommonFunctions extends Component {
    static handleResponse(data,callback)
    {
       if(data != "undefined")
       {
         if(data.resultSuccess)
         {
             callback();
         }
         else
         {
            toastr.error(data.resultMessages[0].message);
         }
       }
    }
    render () {
        return (
            <div>
                
            </div>
        )
    }
}

export default CommonFunctions