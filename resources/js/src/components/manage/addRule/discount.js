import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import { optionsDiscountType } from "./../../../constants";

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
        const {mainProduct, relatedProducts, discountType} = this.props;
        let priceRelatedProduct = 0;
        {relatedProducts.map((relatedProduct, key)=>(
            priceRelatedProduct += parseInt(relatedProduct.price)
        ))}
        let total = priceRelatedProduct + parseInt(mainProduct.price);
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
                                        className="text-discount"
                                        onBlur={this.changeMainProduct.bind(this)}
                                        // value={0}
                                    />
                                    <span>{discountType  == 'percentage' ? '%' : ''}</span>

                                </td>
                                <td className="price-product">{mainProduct.price}</td>
                            </tr>
                            {relatedProducts.map((relatedProduct, key)=>(
                                <tr key={key}>
                                    <td><img className="img-discount-product" src={relatedProduct.src} alt="..." /></td>
                                    <td>{relatedProduct.title}</td>
                                    <td>{relatedProduct.price}</td>
                                    <td>
                                        <input
                                            type="text"
                                            className="text-discount"
                                            onBlur={this.changeRelatedProduct.bind(this, key)}
                                            // value = {0}
                                        />
                                        <span>{discountType  == 'percentage' ? '%' : ''}</span>
                                    </td>
                                    <td className="price-product">{relatedProduct.price}</td>
                                </tr>
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
                        className="btn btn-primary"
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
