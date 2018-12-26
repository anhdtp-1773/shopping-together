import React, { Component } from 'react';

export default class Title extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.title}</p>
            </div>
        );
    }
}