import React, { Component, Fragment  } from 'react';
import * as _ from "lodash";

export default class RulesList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            variant: _.head(this.props.cartRule.variants),
        };
        this.handleChange = this.handleChange.bind(this)
    }

    handleChange (event) {
        const value = event.target.value;
        let variant = _.find(this.props.cartRule.variants, function(variant) { return variant.id_variant == value });
        this.setState({
            variant
        });
    }

    render () {
        const { cartRule, productNameStyle, oldPriceStyle, newPriceStyle, currency  } = this.props;
        const { variant } = this.state;
        return (
            <Fragment> 
                <div className="col-md-12">
                    <div className="col-md-12 unpadding right-side__option">
                        <div className="col-md-2">
                            <img className="img-option" src={variant.src}/>
                        </div>
                        <div className="col-md-4">
                            <span style={productNameStyle}>{variant.product_name}</span>
                        </div>
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
                        <div className="col-md-2 unpadding-right">
                        <del><span className="old-price" style={oldPriceStyle}>{variant.price}{currency}</span></del>
                        <span className="new-price" style={newPriceStyle}>{variant.price}{currency}</span>
                    </div>
                    </div>
                </div>
            </Fragment>
        )
    }
}
