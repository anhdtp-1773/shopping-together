import React, { Component } from 'react';
import classNames from 'classnames'
import { Link } from 'react-router-dom';
import RouterPath from "./router";

export default class App extends Component {
    constructor(){
        super(...arguments);
        this.state = {
        }
    }
    
    render() {
        const url = window.location.pathname;
        return (
            <div id="manage">
                <ul>
                    <div className="side-menu-inner">
                        <li className={(url == '/' || url == '/home') ? 'active treeview' : 'treeview'}>
                            <Link to={'/'}>
                                <i className="fa fa-home"></i>
                                <span>
                                    {lang.setup}
                                </span>
                            </Link>
                        </li>
                        <li className={(url == '/' || url == '/home') ? 'active treeview' : 'treeview'}>
                            <Link to={'/manage'}>
                                <i className="fa fa-home"></i>
                                <span>
                                    {lang.manage}
                                </span>
                            </Link>
                        </li>
                   </div>
                   <p className="icon-close-menu" > <i className="fa fa-times"></i> </p>
                </ul>
                <div className={classNames("content-manage")}>
                    <RouterPath />
                </div>
            </div>
        );
    }
}

