import React, { Component, Fragment  } from 'react';
import * as _ from "lodash";
const MyContext = React.createContext()

export default class RulesList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            variant: _.head(this.props.cartRule.variants),
            salePrice: 0,
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

    handleChangeValue (name, newValue) {
        this.setState ({
            [name]: newValue
        });
    };

    render () {
        const { cartRule, productNameStyle, oldPriceStyle, newPriceStyle, currency} = this.props;
        const { variant, salePrice } = this.state;
        
        // let total = 0;
        // cartRules.map((cartRule, i) => {
        //     cartRule.variants.map((variant, i) => {
        //         if(!cartRule.is_main_product){
        //             total += (parseFloat(variant.price) - (parseFloat(variant.price) * parseFloat(cartRule.reduction_percent))/100);
        //         }
        //     })
        // })

        

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
                        <span className="new-price" style={newPriceStyle}>
                            {
                                cartRule.is_main_product
                                ? 
                                    variant.price + currency
                                :
                                <MyContext.Provider value={salePrice} onChange={this.handleChangeValue.bind(this)}>
                                    {salePrice = (parseFloat(variant.price) - (parseFloat(variant.price) * parseFloat(cartRule.reduction_percent))/100) + currency}
                                </MyContext.Provider>
                            }
                        </span>
                    </div>
                    </div>
                </div>
            </Fragment>
        )
    }
}
