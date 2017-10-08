import React from "react";
import Header from '../Header/Header';
export default class Home extends React.Component {
    render(){
        return(
            <div class="container-fluid" >
             <Header />
            </div>
        )
    }
}
Home.contextTypes = {
    router: React.PropTypes.object.isRequired
  };
  