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

    render(){
        const {mainProduct, relatedProducts, discountType} = this.props;
        let priceRelatedProduct = 0;
        {relatedProducts.map((relatedProduct, key)=>(
            priceRelatedProduct += parseInt(relatedProduct.price)
        ))}
        let total = priceRelatedProduct + parseInt(mainProduct.price);
        return(
            <Fragment>
                <p>{lang.discount_type}</p>
                <div className="form-group col-md-4">
                    <select name="discountType" onChange={this.handleChangeValue.bind(this)} className='form-control input-sm'>
                        {optionsDiscountType.map((type)=>(
                            <option value={type.value}>{type.label}</option>
                        ))}
                    </select>
                </div>
                <div className="panel panel-default container">
                    <div className="panel-heading">{lang.set_discount}</div>
                    <table className="table">
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
                                        className="col-md-3"
                                        onBlur={this.changeMainProduct.bind(this)}
                                        // value={0}
                                    />
                                    <span>{discountType  == 'percentage' ? '%' : ''}</span>
                                </td>
                                <td>{mainProduct.price}</td>
                            </tr>
                            {relatedProducts.map((relatedProduct, key)=>(
                                <tr>
                                    <td><img className="img-discount-product" src={relatedProduct.src} alt="..." /></td>
                                    <td>{relatedProduct.title}</td>
                                    <td>{relatedProduct.price}</td>
                                    <td>
                                        <input 
                                            type="text" 
                                            className="col-md-3" 
                                            onBlur={this.changeRelatedProduct.bind(this, key)}
                                            // value = {0}
                                        />
                                        <span>{discountType  == 'percentage' ? '%' : ''}</span>
                                    </td>
                                    <td>{relatedProduct.price}</td>
                                </tr>
                            ))}
                            <tr>
                                <td>{lang.total}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>{total}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <button 
                    onClick={() => this.props.onSubmit()}
                    type="button" 
                    class="btn btn-primary" 
                    style={{float:"right"}}
                >
                    {lang.save}
                </button>
            </Fragment>
        )
    }
}