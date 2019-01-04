import React, { Component } from 'react';

export default class OldPrice extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.original_price}</p>
            </div>
        );
    }
}