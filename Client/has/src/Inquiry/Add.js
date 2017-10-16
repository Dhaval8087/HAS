import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import React from "react";
import Header from '../Header/Header';
import TextField from 'material-ui/TextField';
import DropDownMenu from 'material-ui/DropDownMenu';
import MenuItem from 'material-ui/MenuItem';
import './Add.css';
const styles = {
    customWidth: {
        width: 300,
    },
};
export default class Add extends React.Component {
    render() {
        return (
            <div>
                <Header />
                <br />
                <br />
                <MuiThemeProvider>
                    <form>
                        <div className="row">
                            <div className="col-md-6 margin10">
                                <TextField
                                    hintText="Enter inquiry code"
                                    floatingLabelText="Inquiry Code"
                                />
                            </div>
                        </div>

                        <div className="row">
                            <div className="col-md-6 margin25">
                                <DropDownMenu
                                    autoWidth={false}
                                    style={styles.customWidth}
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
                                >
                                    <MenuItem value={1} primaryText="Reference" />
                                    <MenuItem value={2} primaryText="Direct" />

                                </DropDownMenu>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 margin10">
                                <TextField
                                    hintText="City"
                                    floatingLabelText="City"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 margin25">
                                <DropDownMenu
                                    autoWidth={false}
                                    style={styles.customWidth}
                                >
                                    <MenuItem value={1} primaryText="Rajkot" />
                                    <MenuItem value={2} primaryText="Ahmedabad" />
                                    <MenuItem value={2} primaryText="Surat" />
                                </DropDownMenu>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 margin10">
                                <TextField
                                    hintText="Enter Client Name"
                                    floatingLabelText="Client Name"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 margin10">
                                <TextField
                                    hintText="Enter Address"
                                    floatingLabelText="Address"
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-6 margin10">
                                <TextField
                                    hintText="Enter Note"
                                    floatingLabelText="Note"
                                />
                            </div>
                        </div>
                    </form>
                </MuiThemeProvider>
            </div>
        )
    }
}