import React, { Component } from 'react';

import {
  BrowserRouter as Router,
  Route,
  Link,
  Switch,
  Redirect
} from 'react-router-dom';

import Home from './components/home';
import HomePage from './components/page';

class App extends Component {
  render() {
    return (
      <Router>
      <div className="App">
        <header className="App-header">
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <div className="menu">
            <ul>
              <li> <Link to="/home">Home</Link> </li>
              <li> <Link to="/homepage">HomePage</Link> </li>
            </ul>
        </div>
        <div className="App-intro">
          <Switch>
            <Route exact path="/home"  component={Home} />
            <Route path="/homepage" component={HomePage} />
            <Redirect to="/" />
          </Switch>
        </div>
      </div>
      </Router>
    );
  }
}

export default App;
