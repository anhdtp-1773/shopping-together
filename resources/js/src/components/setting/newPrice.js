import React, { Component, Fragment } from 'react';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class NewPrice extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.new_price}</p>
            </div>
        );
    }
}