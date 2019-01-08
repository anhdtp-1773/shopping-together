import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import { optionsDiscountType } from "./../../../constants";
import classNames from 'classnames'
import Product from './product';

export default class Discount extends Component {
    constructor(){
        super(...arguments);
        this.state = {

        }
    }

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value);
    }

    changeMainProduct (event) {
       this.props.changeMainProduct(event);
    }

    changeRelatedProduct (index, event) {
        this.props.changeRelatedProduct(index, event);
    }

    nextStep (step) {
        this.props.nextStep(step);
    }
    
    render(){
        const {mainProduct, relatedProducts, discountType, validates} = this.props;
        let relatedProductPrice = 0;
        {relatedProducts.map((relatedProduct, key)=>(
            discountType == 'percentage' 
            ? 
                relatedProduct.number 
                ?
                    relatedProductPrice += (parseInt(relatedProduct.price) - (parseInt(relatedProduct.price) * parseInt(relatedProduct.number))/100)
                :
                    relatedProductPrice += parseInt(relatedProduct.price)
            :   
                relatedProduct.number
                ?
                    relatedProductPrice += (parseInt(relatedProduct.price) - parseInt(relatedProduct.number))
                :   
                    relatedProductPrice += parseInt(relatedProduct.price)
        ))}
        let mainProductPrice = parseInt(mainProduct.price);
        if(discountType == 'percentage'){
            if(mainProduct.number){
                mainProductPrice = parseInt(mainProduct.price) - (parseInt(mainProduct.price) * parseInt(mainProduct.number)/100);
            }
        }else{
            if(mainProduct.number){
                mainProductPrice = parseInt(mainProduct.price) - parseInt(mainProduct.number);
            }
        }
        let total = relatedProductPrice + mainProductPrice;
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
                                <th>{lang.image}</th>
                                <th>{lang.name}</th>
                                <th>{lang.original_price}</th>
                                <th>{lang.discount}</th>
                                <th>{lang.sale_price}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img className="img-discount-product" src={mainProduct.src} alt="..." /></td>
                                <td>{mainProduct.title}</td>
                                <td>{mainProduct.price}</td>
                                <td>
                                    <input
                                        type="text"
                                        onChange={this.changeMainProduct.bind(this)}
                                        defaultValue={mainProduct.number}
                                        name="mainProduct"
                                        className={classNames('text-discount', validates.mainProduct)}
                                    />
                                    <span>{discountType  == 'percentage' ? '%' : ''}</span>
                                </td>
                                <td className="price-product">
                                    {mainProductPrice}
                                </td>
                            </tr>
                            {relatedProducts.map((relatedProduct, key)=>(
                                <tr key={key}>
                                    <td><img className="img-discount-product" src={relatedProduct.src} alt="..." /></td>
                                    <td>{relatedProduct.title}</td>
                                    <td>{relatedProduct.price}</td>
                                    <td>
                                        <input
                                            key={key}   
                                            type="text"
                                            className={classNames('text-discount', validates.relatedProduct)}
                                            // className={`text-discount ${validates.relatedProduct ? validates.relatedProduct[key]: validates.relatedProduct}`}
                                            className={`text-discount`}
                                            onChange={this.changeRelatedProduct.bind(this, key)}
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
                                // <Product 
                                //     relatedProduct = {relatedProduct}
                                //     key = {key}
                                //     discountType = {discountType}
                                // />
                            ))}
                            <tr>
                                <td>{lang.total}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td className="price-product">{total}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div className="container">
                    <button
                        onClick={() => this.props.onSubmit()}
                        type="button"
                        className={classNames('btn btn-primary', {'disabled-form': !disabledOnClick})}
                        style={{float:"right"}}
                    >
                        {lang.save}
                    </button>
                    <button onClick={this.nextStep.bind(this, 2)} type="button" className="btn btn-primary" style={{float:"right"}}>{lang.back}</button>
                </div>
            </Fragment>
        )
    }
}
