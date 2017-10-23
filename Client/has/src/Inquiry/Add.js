import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import React from "react";
import Header from '../Header/Header';
import TextField from 'material-ui/TextField';
import SelectField from 'material-ui/SelectField';
import MenuItem from 'material-ui/MenuItem';
import Upload from 'material-ui-upload/Upload';
import RaisedButton from 'material-ui/RaisedButton';
import InquiryStore from '../stores/InquiryStore';
import LoginStore from '../stores/LoginStore';
import FileInput from 'react-file-input';
import Dropzone from 'react-dropzone';
import toastr from 'toastr';
import '../common/toastr.css';
import './Inquiry.css';
let file = '';
const styles = {
    customWidth: {
        width: 300,
    },

};
export default class Add extends React.Component {
    constructor(props) {
        super(props);
        this.state = this.getDefault();

        this.saveInquiry = this.saveInquiry.bind(this);
        this.handleChange = this.handleChange.bind(this);
        this.handleCancel = this.handleCancel.bind(this);
    }
    getDefault() {
        return {
            inquirycode: '',
            type: '',
            inqtype: '',
            city: '',
            region: '',
            clientname: '',
            address: '',
            note: '',
            inqcodeerror: '',
            typeerror: '',
            inqtypeerror: '',
            cityerror: '',
            regionerror: '',
            clientnameerror: '',
            addresserror: '',
            filename: 'Browse File or Drop',
            isValid: true
        }
    }
    componentDidMount() {
        if (LoginStore.getUserInfo() == "")
            this.context.router.push('/');
    }
    saveInquiry() {
        this.validation();
        if (this.state.isValid) {
            var data = {
                inquiryCode: this.state.inquirycode,
                type: this.state.type,
                inquiryType: this.state.inqtype,
                city: this.state.city,
                region: this.state.region,
                clientName: this.state.clientname,
                address: this.state.address,
                comments: this.state.note,
            }


            InquiryStore.AddInquiry(data, function (res) {
                if (file != '') {
                    var formData = new FormData();
                    formData.append('file', file);

                    InquiryStore.UploadQuatation(formData, res.uid, function () {
                        toastr.success("Inquiry Added Successfully!!");
                        this.clearField();
                    }.bind(this))
                }

            }.bind(this));
        }

    }
    clearField() {
        this.state = this.getDefault();
        file = '';
        this.setState({});
    }
    handleCancel() {
        this.state = this.getDefault();
        file = '';
        this.setState({});
        this.context.router.push('/home');
    }
    validation() {
        if (this.state.inquirycode == "") {
            this.state.inqcodeerror = "Inquiry Code is required";
            this.state.isValid = false;
        }
        else {
            this.state.inqcodeerror = "";
        }
        if (this.state.type == "") {
            this.state.typeerror = "Inquiry type is required";
            this.state.isValid = false;
        }
        else {
            this.state.typeerror = "";
        }
        if (this.state.inqtype == "") {
            this.state.inqtypeerror = "Inquiry type is required";
            this.state.isValid = false;
        }
        else {
            this.state.inqtypeerror = "";
        }
        if (this.state.city == "") {
            this.state.cityerror = "city is required";
            this.state.isValid = false;
        }
        else {
            this.state.cityerror = "";
        }
        if (this.state.region == "") {
            this.state.regionerror = "region is required";
            this.state.isValid = false;
        }
        else {
            this.state.regionerror = "";
        }
        if (this.state.clientname == "") {
            this.state.clientnameerror = "clientname is required";
            this.state.isValid = false;
        }
        else {
            this.state.clientnameerror = "";
        }
        if (this.state.address == "") {
            this.state.addresserror = "address is required";
            this.state.isValid = false;
        }
        else {
            this.state.addresserror = "";
        }
        this.setState({});
    }
    handleChange(files) {
        file = files[0];
        this.state.filename = file.name;
        this.setState({ filename: this.state.filename });
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
                                    className="width300"
                                    hintText="Enter inquiry code"
                                    errorText={this.state.inqcodeerror}
                                    value={this.state.inquirycode}
                                    onChange={(event, newValue) => {
                                        if (newValue != "") {
                                            this.state.inqcodeerror = "";
                                            this.state.isValid = true;
                                        }
                                        else {
                                            this.state.inqcodeerror = "Inquiry Code is required";
                                            this.state.isValid = false;
                                        }
                                        this.setState({ inquirycode: newValue });
                                    }
                                    }
                                    floatingLabelText="Inquiry Code"
                                />
                            </div>
                        </div>

                        <div className="row">
                            <div className="col-md-6">
                                <SelectField
                                    floatingLabelText="Type"
                                    style={styles.customWidth}
                                    errorText={this.state.typeerror}
                                    value={this.state.type}
                                    onChange={(event, index, newValue) => {
                                        if (newValue != "") {
                                            this.state.typeerror = "";
                                            this.state.isValid = true;
                                        }
                                        else {
                                            this.state.typeerror = "Inquiry type is required";
                                            this.state.isValid = false;
                                        }

                                        this.setState({ type: newValue })
                                    }
                                    }
                                >
                                    <MenuItem value={1} primaryText="Home Theatre" />
                                    <MenuItem value={2} primaryText="Automation" />
                                    <MenuItem value={3} primaryText="Both" />
                                </SelectField>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6">
                                <SelectField
                                    floatingLabelText="Inquiry type"
                                    errorText={this.state.inqtypeerror}
                                    value={this.state.inqtype}
                                    style={styles.customWidth}
                                    onChange={(event, index, newValue) => {
                                        if (newValue != "") {
                                            this.state.inqtypeerror = "";
                                            this.state.isValid = true;
                                        }
                                        else {
                                            this.state.inqtypeerror = "Inquiry type is required";
                                            this.state.isValid = false;
                                        }
                                        this.setState({ inqtype: newValue })
                                    }
                                    }

                                >
                                    <MenuItem value={1} primaryText="Reference" />
                                    <MenuItem value={2} primaryText="Direct" />

                                </SelectField>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    className="width300"
                                    hintText="City"
                                    errorText={this.state.cityerror}
                                    value={this.state.city}
                                    onChange={(event, newValue) => {
                                        if (newValue != "") {
                                            this.state.cityerror = "";
                                            this.state.isValid = true;
                                        }
                                        else {
                                            this.state.cityerror = "city is required";
                                            this.state.isValid = false;
                                        }
                                        this.setState({ city: newValue })
                                    }
                                    }
                                    floatingLabelText="City"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6">
                                <SelectField
                                    floatingLabelText="Region"
                                    errorText={this.state.regionerror}
                                    value={this.state.region}
                                    onChange={(event, index, newValue) => {
                                        if (newValue != "") {
                                            this.state.regionerror = "";
                                            this.state.isValid = true;
                                        }
                                        else {
                                            this.state.regionerror = "region is required";
                                            this.state.isValid = false;
                                        }
                                        this.setState({ region: newValue })
                                    }}
                                    style={styles.customWidth}
                                >
                                    <MenuItem value={1} primaryText="Rajkot" />
                                    <MenuItem value={2} primaryText="Ahmedabad" />
                                    <MenuItem value={3} primaryText="Surat" />
                                </SelectField>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    className="width300"
                                    hintText="Enter Client Name"
                                    errorText={this.state.clientnameerror}
                                    value={this.state.clientname}
                                    onChange={(event, newValue) => {
                                        if (newValue != "") {
                                            this.state.clientnameerror = "";
                                            this.state.isValid = true;
                                        }
                                        else {
                                            this.state.clientnameerror = "clientname is required";
                                            this.state.isValid = false;
                                        }
                                        this.setState({ clientname: newValue })
                                    }}
                                    floatingLabelText="Client Name"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    className="width300"
                                    hintText="Enter Address"
                                    value={this.state.address}
                                    errorText={this.state.addresserror}
                                    onChange={(event, newValue) => {
                                        if (newValue != "") {
                                            this.state.addresserror = "";
                                            this.state.isValid = true;
                                        }
                                        else {
                                            this.state.addresserror = "address is required";
                                            this.state.isValid = false;
                                        }
                                        this.setState({ address: newValue })
                                    }}
                                    floatingLabelText="Address"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 ">
                                <TextField
                                    className="width300"
                                    hintText="Enter Note"
                                    value={this.state.note}
                                    onChange={(event, newValue) => this.setState({ note: newValue })}
                                    floatingLabelText="Note"
                                />
                            </div>
                        </div>
                        <br />
                        <div className="row">
                            <div className="col-md-12">
                                <Dropzone onDrop={this.handleChange} className="browse">
                                    <div>{this.state.filename}</div>
                                </Dropzone>

                            </div>
                        </div>
                        <br />
                        <div className="row">
                            <div className="col-md-3">
                                <RaisedButton label="Submit" primary={true} className={style} onClick={this.saveInquiry} />
                            </div>
                            <div className="col-md-2"></div>
                            <div className="col-md-3">
                                <RaisedButton label="Cancel" primary={true} className={style} onClick={(event) => this.handleCancel(event)} />
                            </div>

                        </div>
                        <div className="row">
                            <br />
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
Add.contextTypes = {
    router: React.PropTypes.object.isRequired
};

