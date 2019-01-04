import React, { Component } from 'react';
import { Link } from 'react-router-dom';

export default class Manage extends Component {
    constructor(){
        super(...arguments);
        this.state = {
        }
    }

    render() {
        return (
            <Link to={'/cart-rule/add'} className="btn btn-block btn-sm">
                {lang.add_a_new_rule}
            </Link>
        );
    }
}