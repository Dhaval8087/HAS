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
                            <div className="col-md-6">
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
                    </form>
                </MuiThemeProvider>
            </div>
        )
    }
}