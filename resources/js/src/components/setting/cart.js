import React, { Component } from 'react';

export default class Cart extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.add_to_cart_button}</p>
            </div>
        );
    }
}