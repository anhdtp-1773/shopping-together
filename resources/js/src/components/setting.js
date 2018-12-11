import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Link, Switch, Redirect } from "react-router-dom";
import { Home } from './home'
import { HomePage } from './page'
const Index = () => <h2>Home</h2>;

class Setting extends Component {
  constructor(props) {
    super(props);
    this.state = {
        errors:{},
    };
  }

  render() {
    return (
        <Router>
          <div>
          <nav>
              <ul>
              <li>
                  <Link to="/">Index</Link>
              </li>
              <li>
                  <Link to="/home/">Home</Link>
              </li>
              <li>
                  <Link to="/homepage/">Page</Link>
              </li>
              </ul>
          </nav>

          <Switch>
            <Route exact path="/"  component={Index} />
            <Route path="/home" component={Home} />
            <Route path="/homepage" component={HomePage} />
            <Redirect to="/" />
          </Switch>
          </div>
        </Router>
    );
  }
}

export default Setting;
