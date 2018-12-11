import React, { Component } from 'react';


export default class Home extends Component {
    constructor(props) {
        super(props);
        this.state = {
            errors:{},
        };
    }
    render() {
        return (
            <div className="container">
                <h2>Home</h2>
            </div>
        );
    }
}


