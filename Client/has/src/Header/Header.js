import React from 'react';
import $ from "jquery";
import './Header.css';
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
        "Trading": [
            {
                "Deals": [
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
        "Risk": [
            {
                "Trading Positions and P/L": [
                    {
                        "color": "#70AD47",
                        "icon": "fa fa-bar-chart"
                    }
                ]
            }
        ],
        "Settlement": [
            {
                "Cash Flows": [
                    {
                        "color": "#5B9BD5",
                        "icon": "fa fa-money"
                    }
                ]
            }
        ],
        "Operations": [
            {
            }
        ]
    }
];
export default class Header extends React.Component {
    constructor() {
        super()
        this.state = {
            navCollapsed: true
        };
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
    render() {

        var data = ctrmModules;
        var finalData = Object.keys(data[0]);
        const { navCollapsed } = this.state
        return (
            <div className="container">
                <nav className="navbar navbar-fixed-top bg-dark">
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
                                <a href="#" className="dropdown-toggle" data-toggle="dropdown">Inquiry <span className="caret"></span></a>
                                <ul className="dropdown-menu mega-dropdown-menu">
                                    <li className="col-sm-3">
                                        <ul>
                                            <li className="dropdown-header">Plus</li>
                                            <li><a href="#">Navbar Inverse</a></li>
                                            <li><a href="#">Pull Right Elements</a></li>
                                            <li><a href="#">Coloured Headers</a></li>
                                            <li><a href="#">Primary Buttons & Default</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li className="dropdown mega-dropdown">

                            </li>
                            <li><a href="#">Store locator</a></li>
                        </ul>
                        <ul className="nav navbar-nav navbar-right">
                            <li className="dropdown">
                                <a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account <span className="caret"></span></a>
                                <ul className="dropdown-menu" role="menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li className="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </li>
                            <li><a href="#">My cart (0) items</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        )
    }
}
