import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import React from "react";
import Header from '../Header/Header';
import TextField from 'material-ui/TextField';
import DropDownMenu from 'material-ui/DropDownMenu';
import MenuItem from 'material-ui/MenuItem';
import Upload from 'material-ui-upload/Upload';
import RaisedButton from 'material-ui/RaisedButton';
import './Add.css';
const styles = {
    customWidth: {
        width: 300,
    },

};
export default class Add extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            inquirycode: '',
            type: '',
            inqtype: '',
            city: '',
            region: '',
            clientname: '',
            address:'',
            note:''

        };
        this.onFileLoad = this.onFileLoad.bind(this);
    }
    onFileLoad(e, file) {

    }
    render() {
        return (
            <div>
                <Header />
                <br />
                <br />
                <MuiThemeProvider>
                    <form>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    hintText="Enter inquiry code"
                                    onChange={(event, newValue) => this.setState({ inquirycode: newValue })}
                                    floatingLabelText="Inquiry Code"
                                />
                            </div>
                        </div>

                        <div className="row">
                            <div className="col-md-6 margin25">
                                <DropDownMenu
                                    autoWidth={false}
                                    style={styles.customWidth}
                                    onChange={(event, newValue) => this.setState({ type: newValue })}
                                >
                                    <MenuItem value={1} primaryText="Home Theatre" />
                                    <MenuItem value={2} primaryText="Automation" />
                                    <MenuItem value={3} primaryText="Both" />
                                </DropDownMenu>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 margin25">
                                <DropDownMenu
                                    autoWidth={false}
                                    style={styles.customWidth}
                                    onChange={(event, newValue) => this.setState({ inqtype: newValue })}
                                >
                                    <MenuItem value={1} primaryText="Reference" />
                                    <MenuItem value={2} primaryText="Direct" />

                                </DropDownMenu>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    hintText="City"
                                    onChange={(event, newValue) => this.setState({ city: newValue })}
                                    floatingLabelText="City"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 margin25">
                                <DropDownMenu
                                    autoWidth={false}
                                    onChange={(event, newValue) => this.setState({ region: newValue })}
                                    style={styles.customWidth}
                                >
                                    <MenuItem value={1} primaryText="Rajkot" />
                                    <MenuItem value={2} primaryText="Ahmedabad" />
                                    <MenuItem value={2} primaryText="Surat" />
                                </DropDownMenu>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    hintText="Enter Client Name"
                                    onChange={(event, newValue) => this.setState({ clientname: newValue })}
                                    floatingLabelText="Client Name"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    hintText="Enter Address"
                                    onChange={(event, newValue) => this.setState({ address: newValue })}
                                    floatingLabelText="Address"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    hintText="Enter Note"
                                    onChange={(event, newValue) => this.setState({ note: newValue })}
                                    floatingLabelText="Note"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-12">
                                <Upload
                                    label="Browse Quatation"
                                    onFileLoad={this.onFileLoad}
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-3">
                                <RaisedButton label="Submit" primary={true} className={style} onClick={(event) => this.handleClick(event)} />
                            </div>
                            <div className="col-md-2"></div>
                            <div className="col-md-3">
                                <RaisedButton label="Cancel" primary={true} className={style} onClick={(event) => this.handleClick(event)} />
                            </div>

                        </div>

                    </form>
                </MuiThemeProvider>
            </div>
        )
    }
}
const style = {
    margin: 15,
};
