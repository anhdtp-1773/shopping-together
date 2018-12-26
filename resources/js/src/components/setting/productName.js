import React, { Component } from 'react';

export default class ProductName extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.product_name}</p>
            </div>
        );
    }
}