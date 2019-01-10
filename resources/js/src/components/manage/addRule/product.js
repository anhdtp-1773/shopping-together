import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import classNames from 'classnames'
import * as Validate from "../../../models/validate.model"; 

export default class Product extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            validates: {},
        }
        this.handleChangeDisplayProduct =  _.debounce(this.handleChangeDisplayProduct, 500);    
    }

    handleChangeValue (idProduct, price, event) {
        const name = event.target.name;
        const value = event.target.value;
        const {validates} = this.state;
        switch(name){
            case 'relatedProduct':
                validates[name] = Validate.isPercentage(value, price, this.props.discountType) ? 'valid' : 'invalid';;
                break;
        }
        this.setState({
            validates: _.assign({}, this.state.validates, validates),
        })
        this.props.validate(validates);
        this.handleChangeDisplayProduct(idProduct, price, value)
    }

    handleChangeDisplayProduct (idProduct, price, value) {
        this.props.handleChangeDisplayProduct(idProduct, price, value);
    }

    render() {
        const {product, discountType} = this.props;
        const {validates} = this.state;
        let price = parseFloat(product.price);
        if(product.numberDiscount){
            if(discountType == 'percentage'){
                price = (parseFloat(product.price) - (parseFloat(product.price) * parseFloat(product.numberDiscount))/100);
            }else{
                if(parseFloat(product.price) > parseFloat(product.numberDiscount)){
                    price = (parseFloat(product.price) - parseFloat(product.numberDiscount));
                }else{
                    price = parseFloat(product.price)
                }
            }
        }
        return(
            <Fragment>
                <tr >
                    <td><img className="img-discount-product" src={product.src} alt="..." /></td>
                    <td>{product.title}</td>
                    <td>{product.price +" "+ product.currency}</td>
                    <td>
                        <input
                            type="text"
                            className={classNames('text-discount', validates.relatedProduct)}
                            onChange={this.handleChangeValue.bind(this, product.id, product.price)}
                            defaultValue = {product.numberDiscount}
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