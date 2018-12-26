import React, { Component } from 'react';

export default class Translation extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.translation}</p>
            </div>
        );
    }
}