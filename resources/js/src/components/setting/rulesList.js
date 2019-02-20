import React, { Component, Fragment  } from 'react';
import {head, find} from "lodash";
import {displayPrice} from './../../utility';

export default class RulesList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            variant: head(this.props.cartRule.variants),
        };
        this.handleChange = this.handleChange.bind(this)
    }

    handleChange (event) {
        const value = event.target.value;
        const {cartRule, idProduct} = this.props;
        let variant = find(cartRule.variants, function(variant) { return variant.id_variant == value });
        this.props.handleChangeTotalPrice(cartRule, idProduct, variant.price);
        this.setState({
            variant
        });
    }

    render () {
        const { cartRule, productNameStyle, oldPriceStyle, newPriceStyle, currency} = this.props;
        const { variant } = this.state;
        return (
            <Fragment> 
                {
                variant
                ?
                    <div className="col-md-12">
                        <div className="col-md-12 unpadding right-side__option">
                            <div className="col-md-2">
                                <img className="img-option" src={variant.src}/>
                            </div>
                            <div className="col-md-4">
                                <span style={productNameStyle}>{variant.product_name}</span>
                            </div>
                            {
                                variant.title != "Default Title"
                                ?
                                <div className="col-md-3 unpadding-right">
                                    <span className="col-md-10 unpadding-right">
                                        <select className="select-option" name="variants" onChange={this.handleChange}>
                                        {
                                            cartRule.variants.map((variant, j) => {
                                                return <option key={j} value={variant.id_variant}>{variant.title}</option>
                                            })
                                        }
                                        </select>
                                    </span>
                                </div>
                                : null
                            }
                            <div className="col-md-2 unpadding-right">
                            <del><span className="old-price" style={oldPriceStyle}>{displayPrice(variant.price, currency)}</span></del>
                            <span className="new-price" style={newPriceStyle}>
                                {
                                    cartRule.is_main_product
                                    ? 
                                        displayPrice(parseFloat(variant.price), currency)
                                    :
                                        displayPrice((parseFloat(variant.price) - (parseFloat(variant.price) * parseFloat(cartRule.reduction_percent))/100), currency)
                                }
                            </span>
                        </div>
                        </div>
                    </div>
                :
                null
                }
            </Fragment>
        )
    }
}
