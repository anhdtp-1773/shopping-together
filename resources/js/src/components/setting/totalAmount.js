import React, { Component } from 'react';

export default class TotalAmount extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.total_amount}</p>
            </div>
        );
    }
}