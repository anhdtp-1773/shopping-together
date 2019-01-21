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
                        <li className={(url == '/' || url == '/home') ? 'active treeview' : 'treeview'} >
                            <Link to={'/'}>
                                <span>
                                    {lang.setup}
                                </span>
                            </Link>
                        </li>
                        <li className={(url == '/manage') ? 'active treeview' : 'treeview'}>
                            <Link to={'/manage'}>
                                <span>
                                    {lang.manage}
                                </span>
                            </Link>
                        </li>
                        <li className={(url == '/stats') ? 'active treeview' : 'treeview'}>
                            <Link to={'/stats'}>
                                <span>
                                    {lang.stats}
                                </span>
                            </Link>
                        </li>
                        <li className="icon-close-menu" > <i className="fa fa-times"></i> </li>
                   </div>

                </ul>
                <div className={classNames("content-manage")}>
                    <RouterPath />
                </div>
            </div>
        );
    }
}
