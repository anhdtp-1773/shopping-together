import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import { optionsDiscountType } from "./../../../constants";
import classNames from 'classnames'
import Product from './product';

export default class Discount extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            validates: {}
        }
    }

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value);
    }

    handleChangeDisplayProduct (idProduct, price, value) {
        this.props.handleChangeDisplayProduct(idProduct, price, value);
    }

    nextStep (step) {
        this.props.nextStep(step);
    }

    validate (validates) {
        this.setState({
            validates: _.assign({}, this.state.validates, validates),
        })
    }

    render(){
        const {mainProduct, discountType, discountProducts} = this.props;
        const {validates} = this.state;
        let total = 0;
        discountProducts.map((product) => {
            if(product.numberDiscount){
                if(discountType == 'percentage'){
                    total += (parseFloat(product.price) - (parseFloat(product.price) * parseFloat(product.numberDiscount))/100);
                }else{
                    if(parseFloat(product.price) > parseFloat(product.numberDiscount)){
                        total += (parseFloat(product.price) - parseFloat(product.numberDiscount));
                    }else{
                        total += (parseFloat(product.price));
                    }
                }
            }else{
                total += parseFloat(product.price);
            }
        })
        const disabledOnClick = _.every(_.values(validates), function(value) {return value == 'valid'});
        return(
            <Fragment>
                <div className="container section-heading">
                    <h1 className="title-heading">{lang.set_discount}</h1>
                    <div className="discount-type-wrap">
                        <div className="title-discount">{lang.discount_type}</div>
                        <div className="form-group select-discount-type">
                            <select name="discountType" onChange={this.handleChangeValue.bind(this)} className='form-control input-sm'>
                                {optionsDiscountType.map((type, i)=>(
                                    <option key={i} value={type.value}>{type.label}</option>
                                ))}
                            </select>
                        </div>
                    </div>
                </div>

                <div className="panel panel-default container ">
                    <table className="table set-discount-wrap">
                        <thead>
                            <tr>
                                <th className="set-discount__title-img">{lang.image}</th>
                                <th>{lang.name}</th>
                                <th>{lang.original_price}</th>
                                <th>{lang.discount}</th>
                                <th className="set-discount__title-sale">{lang.sale_price}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {discountProducts.map((product, key)=>(
                                <Product
                                    product = {product}
                                    key = {key}
                                    discountType = {discountType}
                                    handleChangeDisplayProduct = {this.handleChangeDisplayProduct.bind(this)}
                                    validate = {this.validate.bind(this)}
                                />
                            ))}
                            <tr>
                                <td>{lang.total}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td className="set-discount__sale-price">{total +" "+ _.head(mainProduct).currency}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div className="container btn-wrap">
                    <button
                        onClick={() => this.props.onSubmit()}
                        type="button"
                        className={classNames('btn btn-primary btn-next-step', {'disabled-form': !disabledOnClick})}
                    >
                        {lang.save}
                    </button>
                    <button onClick={this.nextStep.bind(this, 2)} type="button" className="btn btn-primary btn-back-step">{lang.back}</button>
                </div>
            </Fragment>
        )
    }
}
