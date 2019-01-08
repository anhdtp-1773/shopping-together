import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import { optionsDiscountType } from "./../../../constants";
import classNames from 'classnames'
import * as Validate from "../../../models/validate.model"; 

export default class Product extends Component {
    constructor(){
        super(...arguments);
        const { relatedProduct } = this.props;
        this.state = {
            validates: {},
        }
    }
    test(event){
        const name = event.target.name;
        const value = event.target.value;
        const {validates} = this.state;
        switch(name){
            case 'relatedProduct':
                validates[name] = Validate.isPercentage(value) ? 'valid' : 'invalid';;
                break;
        }
        this.setState({
            validates: _.assign({}, this.state.validates, validates),
        })
    }
    render() {
        console.log(this.state.validates);
        const {key, relatedProduct, discountType} = this.props;
        return(
            <Fragment>
                <tr key={key}>
                    <td><img className="img-discount-product" src={relatedProduct.src} alt="..." /></td>
                    <td>{relatedProduct.title}</td>
                    <td>{relatedProduct.price}</td>
                    <td>
                        <input
                            key={key}   
                            type="text"
                            className={classNames('text-discount')}
                            className="text-discount"
                            onChange={this.test.bind(this)}
                            defaultValue = {relatedProduct.number}
                            name="relatedProduct"
                        />
                        <span>{discountType  == 'percentage' ? '%' : ''}</span>
                    </td>
                    <td className="price-product">
                        {
                            discountType == 'percentage' 
                            ? 
                                relatedProduct.number 
                                ?
                                    (parseInt(relatedProduct.price) - (parseInt(relatedProduct.price) * parseInt(relatedProduct.number))/100)
                                :
                                    parseInt(relatedProduct.price)
                            :   
                                relatedProduct.number
                                ?
                                    (parseInt(relatedProduct.price) - parseInt(relatedProduct.number))
                                :   
                                    parseInt(relatedProduct.price)
                        }
                    </td>
                </tr>
            </Fragment>
        )
    }
}