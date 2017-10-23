import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import React from "react";
import Header from '../Header/Header';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';
import InquiryStore from '../stores/InquiryStore';
import LoginStore from '../stores/LoginStore';
import toastr from 'toastr';
import '../common/toastr.css';
import './Inquiry.css';
import {
    Table,
    TableBody,
    TableHeader,
    TableHeaderColumn,
    TableRow,
    TableRowColumn,
} from 'material-ui/Table';

export default class View extends React.Component {
    constructor(props) {
        super(props);
        this.state = this.getDefault();
        this.onChange = this.onChange.bind(this);
    }
    getDefault() {
        return {
            inquiryList: InquiryStore.getInquiries()
        };
    }
    componentDidMount() {
        if (LoginStore.getUserInfo() == "") {
            this.context.router.push('/');
        }
        else {
            InquiryStore.addChangeListener(this.onChange);
            InquiryStore.GetInquiriesApiCall();
        }
    }
    componentWillUnmount() {
        InquiryStore.removeChangeListener(this.onChange);
    }
    onChange() {
        this.state = this.getDefault();
        this.setState({});
    }
    render() {
        console.log(this.state.inquiryList);
        var body = null;
        if (this.state.inquiryList.length > 0) {
            body = this.state.inquiryList.map(function (item) {
                var inqType, region
                if (item.inquiryType == "1")
                    inqType = "Home Theatre"
                else if (item.inqType == "2")
                    inqType = "Automation"
                else
                    inqType = "Both"

                if (item.region == "1")
                    region = "Rajkot";
                else if (item.region == "2")
                    region = "Ahmedabad";
                else
                    region = "Surat";
                return (
                    <TableRow>
                        <TableRowColumn>{item.id}</TableRowColumn>
                        <TableRowColumn>{item.inquiryCode}</TableRowColumn>
                        <TableRowColumn>{item.clientName}</TableRowColumn>
                        <TableRowColumn>{item.city}</TableRowColumn>
                        <TableRowColumn>{item.address}</TableRowColumn>
                        <TableRowColumn>{inqType}</TableRowColumn>
                        <TableRowColumn>{region}</TableRowColumn>
                    </TableRow>
                )
            })
        }
        return (
            <div>
                <Header />
                <br />
                <br />
                <MuiThemeProvider>
                    <Table>
                        <TableHeader>
                            <TableRow>
                                <TableHeaderColumn>ID</TableHeaderColumn>
                                <TableHeaderColumn>Inquiry Code</TableHeaderColumn>
                                <TableHeaderColumn>Client Name</TableHeaderColumn>
                                <TableHeaderColumn>City</TableHeaderColumn>
                                <TableHeaderColumn>Address</TableHeaderColumn>
                                <TableHeaderColumn>Inquiry Type</TableHeaderColumn>
                                <TableHeaderColumn>Region</TableHeaderColumn>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                           {body}
                        </TableBody>
                    </Table>
                </MuiThemeProvider>
            </div>
        )
    }
}

View.contextTypes = {
    router: React.PropTypes.object.isRequired
};

