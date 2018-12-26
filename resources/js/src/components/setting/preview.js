import React, { Component } from 'react';

export default class Preview extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <p> {lang.preview}</p>
            </div>
        );
    }
}