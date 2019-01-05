import React, { Component } from 'react';
import { Link } from 'react-router-dom';

export default class Manage extends Component {

    render() {
        return (
            <Link to={'/cart-rule/add'} className="btn btn-sm btn-add_a_new_rule">
                {lang.add_a_new_rule}
            </Link>
        );
    }
}