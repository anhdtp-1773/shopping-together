import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import classNames from 'classnames'

export default class Discount extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            validates: {}
        }
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
                    <h1 className="title-heading">{lang.summary}</h1>
                </div>

                <div className="panel panel-default container ">
                    <table className="table set-discount-wrap">
                        <thead>
                            <tr>
                                <th className="set-discount__title-img">{lang.image}</th>
                                <th>{lang.name}</th>
                                <th>{lang.original_price}</th>
                                <th className="set-discount__title-sale">{lang.sale_price}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {discountProducts.map((product, key)=>(
                                <tr className="info-product" key={key}>
                                    <td><img className="set-discount__img" src={product.src} alt="..." /></td>
                                    <td>{product.title}</td>
                                    <td>{product.price +" "+ product.currency}</td>
                                    <td className="set-discount__sale-price">
                                        {12 +" "+ product.currency}
                                    </td>
                                </tr>
                            ))} 
                            <tr>
                                <td>{lang.total}</td>
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
