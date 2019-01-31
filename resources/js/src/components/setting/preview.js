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
        };
        this.showCartRule = this.showCartRule.bind(this);
        this.showAlert = this.showAlert.bind(this);
    }
    async componentWillMount () {
        const response = await api.getProductInfo();
        const result = JSON.parse(response.text);
        this.setState({
            product: result.data,
        });
	    if(result.data){
            this.setState({
                title: result.data.title,
                src: result.data.src,
                price: result.data.price,
                option1: result.data.option1,
                option2: result.data.option2,
                option3: result.data.option3,
                idProduct: result.data.id_shopify_product,
                currency: result.data.currency,
            })
            this.showCartRule(result.data.id_shopify_product);
        }
    }

    async showCartRule (idProduct) {
        const response = await api.getCartRules(idProduct);
        const result = JSON.parse(response.text);
        this.setState({
            cart_rules: result.data,
        });
        if(result.data){
            this.setState({
                cartRules: result.data,
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
        const {title, src, price, option1, option2, option3, cartRules, currency} = this.state;
        console.log(cartRules)
        const {titleFontFamily, titleFontColor, titleFontStyle, productFontFamily, productFontStyle, productFontColor, amountFontFamily, 
            amountFontStyle, amountFontColor, newPriceFontFamily, newPriceFontStyle, newPriceFontColor, oldPriceFontFamily, oldPriceFontStyle, 
            oldPriceFontColor, productText, cartText, cartFontFamily, cartFontStyle, cartFontColor, backgroundColor, salePrice} = this.props;

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

        let total = 0;
        // cartRules.map((cartRule, i) => {
        //     cartRule.variants.map((variant, i) => {
        //         if(!cartRule.is_main_product){
        //             total += (parseFloat(variant.price) - (parseFloat(variant.price) * parseFloat(cartRule.reduction_percent))/100);
        //         }
        //     })
        // })
        
        return (
            <div className="col-md-12 wrap-preview">
                <div className="row right-side__menu">
                    <div className="menu-title col-md-4">{lang.happypoint}</div>
                    <div className="col-md-5 col-md-offset-1">
                        <span>{lang.home}</span>
                        <span>{lang.catalog}</span>
                    </div>
                    <div className="col-md-2 menu-icon">
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
                                            salePrice = {salePrice}
                                        />
                                    })}
                                    <p className="col-md-12 right-side__total unpadding-left">
                                        <div className="col-md-6 first">{lang.total}</div>
                                        <div className="col-md-6 second" style={totalAmountStyle}>{total+=salePrice}{currency}</div>
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
