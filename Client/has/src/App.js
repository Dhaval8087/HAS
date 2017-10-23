import React, { Component } from 'react';
import ReactDOM from "react-dom";
import { Router, Route, IndexRoute, hashHistory } from "react-router";
import Login from './Login/Login';
import Home from './Home/Home';
import AddInquiry from'./Inquiry/Add';
import ViewInquiry from './Inquiry/View';
import RootContainer from './RootContainer';

class App extends Component {
  render() {
    return (
      <Router history={hashHistory}>
      <Route path="/" component={RootContainer}>
        <IndexRoute component={Login}></IndexRoute>
        <Route path="home" name="home" component={Home}></Route>
        <Route path="addinquiry/:type" name="addinquiry" component={AddInquiry}></Route>
        <Route path="viewinquiry/:type" name="viewinquiry" component={ViewInquiry}></Route>
      </Route>
    </Router>
    );
  }
}

export default App;
