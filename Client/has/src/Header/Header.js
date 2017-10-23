import React from 'react';
import $ from "jquery";
import './Header.css';
import '../common/common.css';
import LoginStore from '../stores/LoginStore';
$(document).mouseup(function (e) {
    var container = $(".dropdown-menu");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
    }
});
var ctrmModules = [
    {
        "Admin": [
            {
                "Add Inquiry": [
                    {
                        "color": "#ED7D31",
                        "icon": "fa fa-refresh"
                    }
                ],
                "New Swap": [
                    {
                        "color": "#70AD47",
                        "icon": "fa fa-plus"
                    }
                ]
            }
        ],
        "Employeer": [
            {
                "Trading Positions and P/L": [
                    {
                        "color": "#70AD47",
                        "icon": "fa fa-bar-chart"
                    }
                ]
            }
        ]

    }
];
export default class Header extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            navCollapsed: true
        };
        this.menuItemClicked = this.menuItemClicked.bind(this);
        this.Logout = this.Logout.bind(this);
    }
    _onToggleNav = () => {
        this.setState({ navCollapsed: !this.state.navCollapsed })
    }
    componentDidMount() {
        $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                $(this).toggleClass('open');
            },
            function () {
                $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                $(this).toggleClass('open');
            }
        );
    }
    renderChildMegaMenu(nestedData) {
        return (
            nestedData.map(function (finalValue, key) {
                return (
                    <li key={key}>
                        <a className="pointer" onClick={() => { this.props.getSelectedGrid(finalValue) }}>{finalValue}</a>
                    </li>
                )
            }.bind(this))
        )
    }
    menuItemClicked(event) {
        switch (event.target.id) {
            case "addinq":
                this.context.router.push({
                    pathname: `/addinquiry/${event.target.id}`
                });
                break;
            case "viewinq":
                this.context.router.push({
                    pathname:`viewinquiry/${event.target.id}`
                });
            default:
                break;
        }
    }
    Logout() {
        this.context.router.push('/');
    }
    render() {

        var data = ctrmModules;
        var finalData = Object.keys(data[0]);
        const { navCollapsed } = this.state
        return (
            <div className="container">
                <nav className="navbar navbar-fixed-top ">
                    <div className="navbar-header">
                        <button
                            aria-expanded='false'
                            className='navbar-toggle collapsed'
                            onClick={this._onToggleNav}
                            type='button'
                        >
                            <span className="sr-only">Toggle navigation</span>
                            <span className="icon-bar"></span>
                            <span className="icon-bar"></span>
                            <span className="icon-bar"></span>
                        </button>
                        <a className="navbar-brand" href="#">HAS</a>
                    </div>

                    <div
                        className={(navCollapsed ? 'collapse' : '') + ' navbar-collapse'}>
                        <ul className="nav navbar-nav">
                            <li className="dropdown mega-dropdown">
                                <a className="dropdown-toggle" data-toggle="dropdown">Inquiry <span className="caret"></span></a>
                                <ul className="dropdown-menu mega-dropdown-menu">
                                    <li className="col-sm-3">
                                        <ul>
                                            <li className="dropdown-header">Inquiry Operations</li>
                                            <li><a id="addinq" className="pointer" onClick={this.menuItemClicked}>Add Inquiry</a></li>
                                            <li><a id="viewinq" className="pointer" onClick={this.menuItemClicked}>View Inquiries</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li className="dropdown mega-dropdown">
                                <a className="dropdown-toggle" data-toggle="dropdown">Projects <span className="caret"></span></a>
                                <ul className="dropdown-menu mega-dropdown-menu">
                                    <li className="col-sm-3">
                                        <ul>
                                            <li className="dropdown-header">Project Operations</li>
                                            <li><a id="addproj" className="pointer" onClick={this.menuItemClicked}>Add Project</a></li>

                                        </ul>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                        <ul className="nav navbar-nav navbar-right">
                            <li className="dropdown">
                                <a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Welcome, {LoginStore.getUserInfo().emailAddress}</a>
                                <ul className="dropdown-menu" role="menu">
                                    <li><a onClick={this.Logout}>Logout</a></li>

                                </ul>
                            </li>
                           
                        </ul>
                    </div>
                </nav>
            </div>
        )
    }
}
Header.contextTypes = {
    router: React.PropTypes.object.isRequired
};
