import React from "react";
import Header from '../Header/Header';
import LoginStore from '../stores/LoginStore';
import './Home.css';
import 'font-awesome/css/font-awesome.min.css';
export default class Home extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            isHeader: false
        };
        this.SelectionType = this.SelectionType.bind(this);
    }
    componentDidMount() {
        if (LoginStore.getUserInfo() == "")
            this.context.router.push('/');
    }
    SelectionType(event) {
        /*this.context.router.push({    // use push
            pathname: `/menuheader/${event.target.id}`,
        });*/
        this.setState({ isHeader: true });
    }
    render() {

        return (
            <div >
                {this.state.isHeader ? <Header /> : null}
                <br />
                <section id="about">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 text-center">
                                <div className="section-title">
                                    <p>&nbsp;</p>
                                    <h2>Welcome to HAS</h2>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-7 text-center">
                                <div className="mz-module-about">
                                    <button id="home" className="fa fa-film ot-circle" onClick={this.SelectionType} />
                                    <h3>Home Theatre</h3>
                                </div>
                            </div>
                            <div className="col-md-4 text-center">
                                <div className="mz-module-about">
                                    <button id="auto" className="fa fa-cogs ot-circle" onClick={this.SelectionType} />
                                    <h3>Automation</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* /.container */}
                </section>
            </div>
        )
    }
}
Home.contextTypes = {
    router: React.PropTypes.object.isRequired
};
