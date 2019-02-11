import React, { Component } from 'react';
import api from '../../api';
import * as _ from "lodash";
import RulesList from './rulesList';

export default class Preview extends Component {
    constructor(props) {
        super(props);
        this.state = {
            cartRules: [],
            title: '',
            src: '',
            price: '',
            option1: '',
            option2: '',
            option3: '',
            idProduct: '',
            currency: '',
            priceProducts: []
        };
        this.showAlert = this.showAlert.bind(this);
    }
    async componentWillMount () {
        const response = await api.getProductInfo();
        const result = JSON.parse(response.text);
        let priceProducts = [];
        let cartRules = [];
        this.setState({
            product: result.data,
        });
  
	    if(result.data){
            const cartRulesResponse = await api.getCartRules(result.data.id_shopify_product);
            const cartRulesResult = JSON.parse(cartRulesResponse.text);

            if(cartRulesResult.data){
                cartRules = cartRulesResult.data;
                if (cartRules.length > 0) {
                    priceProducts['cartRules'] = [];
                    cartRules.forEach(function(cartRule) {
                        if(cartRule.variants.length > 0) {
                            let variants = cartRule.variants;
                            priceProducts['cartRules'][cartRule.id_product] = [];
                            priceProducts['cartRules'][cartRule.id_product][variants[0]['id_variant']] = cartRule.is_main_product ? parseFloat(variants[0].price) : (parseFloat(variants[0].price) - (parseFloat(variants[0].price) * parseFloat(cartRule.reduction_percent))/100)
                        }
                    })
                }
            }
            this.setState({
                title: result.data.title,
                src: result.data.src_image,
                price: result.data.price,
                priceProducts: priceProducts,
                option1: result.data.option1,
                option2: result.data.option2,
                option3: result.data.option3,
                idProduct: result.data.id_shopify_product,
                currency: result.data.currency,
                cartRules: cartRules
            })
        }
    }

    handleChangeValue (name, newValue) {
        this.setState ({
            form: Object.assign({}, this.state.form, {
                [name]: newValue
            }),
        });
    };

    showAlert () {
        return alert(lang.go_to_your_live_website_to_use_this_function);
    }

    render () {
        const {title, src, price, option1, option2, option3, cartRules, currency, total, priceProducts} = this.state;
        const {titleFontFamily, titleFontColor, titleFontStyle, productFontFamily, productFontStyle, productFontColor, amountFontFamily, 
            amountFontStyle, amountFontColor, newPriceFontFamily, newPriceFontStyle, newPriceFontColor, oldPriceFontFamily, oldPriceFontStyle, 
            oldPriceFontColor, productText, cartText, cartFontFamily, cartFontStyle, cartFontColor, backgroundColor} = this.props;

        let cartStyle={
            color: cartFontColor,
            backgroundColor: backgroundColor,
            fontFamily: cartFontFamily,
            fontWeight: cartFontStyle == 'italic' ? '' : cartFontStyle,
            fontStyle : cartFontStyle == 'italic' ? cartFontStyle : '',
        };

        let oldPriceStyle={
            color: oldPriceFontColor,
            fontFamily: oldPriceFontFamily,
            fontWeight: oldPriceFontStyle == 'italic' ? '' : oldPriceFontStyle,
            fontStyle : oldPriceFontStyle == 'italic' ? oldPriceFontStyle : '',
        };
        
        let newPriceStyle={
            color: newPriceFontColor,
            fontFamily: newPriceFontFamily,
            fontWeight: newPriceFontStyle == 'italic' ? '' : newPriceFontStyle,
            fontStyle : newPriceFontStyle == 'italic' ? newPriceFontStyle : '',
        };

        let titleStyle={
            color: titleFontColor,
            fontFamily: titleFontFamily,
            fontWeight: titleFontStyle == 'italic' ? '' : titleFontStyle,
            fontStyle : titleFontStyle == 'italic' ? titleFontStyle : '',
        };

        let productNameStyle={
            color: productFontColor,
            fontFamily: productFontFamily,
            fontWeight: productFontStyle == 'italic' ? '' : productFontStyle,
            fontStyle : productFontStyle == 'italic' ? productFontStyle : '',
        };

        let totalAmountStyle={
            color: amountFontColor,
            fontFamily: amountFontFamily,
            fontWeight: amountFontStyle == 'italic' ? '' : amountFontStyle,
            fontStyle : amountFontStyle == 'italic' ? amountFontStyle : '',
        };
        
        let totalPrice = 0;
        if((priceProducts['cartRules'])){
            _.mapValues(priceProducts['cartRules'], function(value) {
                totalPrice += Number(_.values(value))
            })
        }
        return (
            <div className="col-md-12 wrap-preview">
                <div className="row right-side__menu">
                    <div className="menu-title col-md-4 col-xs-6 col-sm-4">
                        {lang.happypoint}
                    </div>
                    <div className="col-md-5 col-md-offset-1 col-sm-offset-1 col-xs-6 col-sm-4">
                        <span>{lang.home}</span>
                        <span>{lang.catalog}</span>
                    </div>
                    <div className="col-md-2 menu-icon col-xs-12 col-sm-3">
                        <span><i className="fa fa-search" aria-hidden="true"></i></span>
                        <span><i className="fa fa-shopping-bag" aria-hidden="true"></i></span>
                    </div>
                </div>
                <div className="row right-side__form-product">
                    <div className="col-md-6">
                        <img className="image-setting-product" src={src}/>
                    </div>
                    <div className="col-md-6 unpadding-right">
                        <div className="form-group">
                            <p className="title-product">{title}</p>
                            <p className="price-product">{price}{currency}</p>
                            <div className="col-md-12 option-product">
                            {
                                option1
                                ?
                                <div className="col-md-6">
                                    <p>{lang.option_1}</p>
                                    <select
                                        name="option1"
                                        className="form-control">
                                        <option>{option1}</option>
                                    </select>
                                </div>
                                :
                                null
                            }
                            {
                                option2
                                ?
                                <div className="col-md-6">
                                    <p>{lang.option_2}</p>
                                    <select
                                        name="option2"
                                        className="form-control">
                                        <option>{option2}</option>
                                    </select>
                                </div>
                                :
                                null
                            }
                            {
                                option3
                                ?
                                <div className="col-md-6">
                                    <p>{lang.option_3}</p>
                                    <select
                                        name="option3"
                                        className="form-control">
                                        <option>{option3}</option>
                                    </select>
                                </div>
                                :
                                null
                            }
                            </div>
                        </div>
                        <button className="btn btn-primary col-md-12">{lang.add_to_cart}</button>
                        {
                            cartRules.length > 0
                            ?
                            <div className="col-md-12 right-side__translation">
                                <div className="row">
                                    <div className="col-md-12 right-side__option-title" style={titleStyle}>{productText}</div>
                                    {cartRules.map((cartRule, i)=>{
                                        return <RulesList 
                                            key={i}
                                            cartRule = {cartRule}
                                            productNameStyle = {productNameStyle}
                                            titleStyle = {titleStyle}
                                            oldPriceStyle = {oldPriceStyle}
                                            newPriceStyle = {newPriceStyle}
                                            totalAmountStyle = {totalAmountStyle}
                                            currency = {currency}
                                        />
                                    })}
                                    <p className="col-md-12 right-side__total unpadding-left">
                                        <div className="col-md-6 first">{lang.total}</div>
                                        <div className="col-md-6 second" style={totalAmountStyle}>{totalPrice}</div>
                                    </p>
                                    <button className="btn-bundle alert-box" onClick= {this.showAlert} style={cartStyle}>{cartText}</button>
                                </div>
                            </div>
                            :
                            lang.please_add_one_rule_taking_this_product_as_a_main_product_to_preview
                        }
                    </div>
                </div>
                <div className="row right-side__footer">
                    <span>{lang.label_footer}</span>
                </div>
            </div>
        );
    }
}
