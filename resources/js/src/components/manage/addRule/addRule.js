import React, { Component, Fragment } from 'react';
import MainProduct from './mainProduct';

export default class AddRule extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            form: {
                products: {}
            }
        }
    }

    render() {
        return (
            <Fragment>
                <MainProduct 
                />
            </Fragment>
        );
    }
}