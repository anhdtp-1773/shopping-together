import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import { optionsDiscountType } from "./../../../constants";
import classNames from 'classnames'
import * as Validate from "../../../models/validate.model"; 

export default class Product extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            validates: {},
        }
    }

    handleChangeDisplayProduct (key, event) {
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
        this.props.handleChangeDisplayProduct(key, event);
    }

    render() {
        const {key, product, discountType} = this.props;
        console.log(key);
        const {validates} = this.state;
        let price = parseFloat(product.price);
        if(product.number){
            if(discountType == 'percentage'){
                price = (parseFloat(product.price) - (parseFloat(product.price) * parseFloat(product.number))/100);
            }else{
                (parseFloat(product.price) - parseFloat(product.number));
            }
        }
        
        return(
            <Fragment>
                <tr key={key}>
                    <td><img className="img-discount-product" src={product.src} alt="..." /></td>
                    <td>{product.title}</td>
                    <td>{product.price +" "+ product.currency}</td>
                    <td>
                        <input
                            key={key}   
                            type="text"
                            className={classNames('text-discount', validates.relatedProduct)}
                            onChange={this.handleChangeDisplayProduct.bind(this, key)}
                            defaultValue = {product.number}
                            name="relatedProduct"
                        />
                        <span>{discountType  == 'percentage' ? '%' : ''}</span>
                    </td>
                    <td className="price-product">
                        {price +" "+ product.currency}
                    </td>
                </tr>
            </Fragment>
        )
    }
}