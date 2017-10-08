import React, { Component } from 'react';
import ReactDOM from "react-dom";
import { Router, Route, IndexRoute, hashHistory } from "react-router";
import Login from './Login/Login';
import Home from './Home/Home';
import RootContainer from './RootContainer';

class App extends Component {
  render() {
    return (
      <Router history={hashHistory}>
      <Route path="/" component={RootContainer}>
        <IndexRoute component={Login}></IndexRoute>
        <Route path="home" name="home" component={Home}></Route>
      </Route>
    </Router>
    );
  }
}

export default App;
