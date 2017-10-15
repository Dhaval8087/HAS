import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import AppBar from 'material-ui/AppBar';
import RaisedButton from 'material-ui/RaisedButton';
import TextField from 'material-ui/TextField';
import React, { Component } from 'react';
import './login.css';
class Login extends Component {
    constructor(props) {
        super(props);
        this.state = {
            username: '',
            password: ''
        }
    }

    handleClick(event)
    {
      this.context.router.push('/home');
    }
    render() {
        return (
            <div className="main">
                <MuiThemeProvider>
                <div className="container">
                <div className="row">
                    <div className="col-sm-6 col-md-4 col-md-offset-4">
                        <h1 className="text-center login-title">Sign in to continue to HAS (Hammer Anvil Stirrup)</h1>
                        <div className="account-wall">
                            <img className="profile-img" src={require('../images/1.PNG')} />
                            <form className="form-signin">
                             <TextField
                                                    hintText="Enter your Username"
                                                    floatingLabelText="Username"
                                                    onChange={(event, newValue) => this.setState({ username: newValue })}
                                                />
                            <TextField
                                                    type="password"
                                                    hintText="Enter your Password"
                                                    floatingLabelText="Password"
                                                    onChange={(event, newValue) => this.setState({ password: newValue })}
                                                />					
                           
                             <RaisedButton label="Submit" primary={true} className={style} onClick={(event) => this.handleClick(event)} />              
                            </form>
                        </div>
                        <a href="#" className="text-center new-account">Create an account </a>
                    </div>
                </div>
            </div>

                </MuiThemeProvider>

            </div>
        );
    }
}
const style = {
    margin: 15,
};
Login.contextTypes = {
    router: React.PropTypes.object.isRequired
  };
export default Login;