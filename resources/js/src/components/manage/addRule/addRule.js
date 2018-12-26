import React, { Component, Fragment } from 'react';
import MainProduct from './mainProduct';

export default class AddRule extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            form: {
                products: {}
            },
            currentPage: '',
            itemsPerPage: '',
            totalItems: '',
        }
    }

    render() {
        return (
            <Fragment>
                <div>
                    <MainProduct 
                    />
                </div>
            </Fragment>
        );
    }
}