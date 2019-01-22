import React, { Component, Fragment } from 'react';
import api from '../../api';
import * as _ from "lodash";

export default class Preview extends Component {
    constructor(props) {
        super(props);
        this.state = {
            form: {
                cartRules: [],
                reductionPercent: '',
                reductionAmount: '',
                isMainProduct: '',
                title: '',
                src: '',
                price: '',
                option1: '',
                option2: '',
                option3: '',
                idProduct: '',
                currency: '',
           }
        };
        this.showCartRule = this.showCartRule.bind(this);
        this.showAlert = this.showAlert.bind(this);
    }
    async componentWillMount(){
        const response = await api.getProductInfo();
        const result = JSON.parse(response.text);
        this.setState({ 
            product: result.data,
        });
	    if(result.data){
            this.setState({
                form: Object.assign({}, this.state.form, {
                    title: result.data.title,
                    src: result.data.src,
                    price: result.data.price,
                    option1: result.data.option1,
                    option2: result.data.option2,
                    option3: result.data.option3,
                    idProduct: result.data.id_shopify_product,
                    currency: result.data.currency,
                }),
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
                form: Object.assign({}, this.state.form, {
                    cartRules: result.data,
                    reductionPercent: result.data.reduction_percent,
                    reductionAmount: result.data.reduction_amount,
                    isMainProduct: result.data.is_main_product,
                })
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

    render (){
        const{title, src, price, option1, option2, option3, cartRules, currency, reductionAmount, reductionPercent, isMainProduct, idProduct } = this.state.form;
        const {titleFontFamily, titleFontColor, titleFontSize, titleFontStyle, productFontFamily, productFontStyle, productFontSize, 
            productFontColor, mountFontFamily, amountFontStyle, amountFontSize, amountFontColor, newPriceFontFamily, newPriceFontStyle, 
            newPriceFontSize, newPriceFontColor, oldPriceFontFamily, oldPriceFontStyle, oldPriceFontSize, oldPriceFontColor, cartText, 
            productText, cartFontFamily, cartFontStyle, cartFontSize, cartFontColor, backgroundColor, showProductQty, productImageWidth, 
            productImageHeight } = this.props;

        let displayStyle= {
            height : parseInt(productImageHeight),
            width : parseInt(productImageWidth),
        };

        let cartStyle={
            color: cartFontColor,
            backgroundColor: backgroundColor,
            fontFamily: cartFontFamily,
            fontWeight: cartFontStyle == 'italic' ? '' : cartFontStyle,
            fontStyle : cartFontStyle == 'italic' ? cartFontStyle : '',
            fontSize : parseInt(cartFontSize),
        };
        let oldPriceStyle={
            color: oldPriceFontColor,
            fontFamily: oldPriceFontFamily,
            fontWeight: oldPriceFontStyle == 'italic' ? '' : oldPriceFontStyle,
            fontStyle : oldPriceFontStyle == 'italic' ? oldPriceFontStyle : '',
            fontSize : parseInt(oldPriceFontSize),
        };

        let newPriceStyle={
            color: newPriceFontColor,
            fontFamily: newPriceFontFamily,
            fontWeight: newPriceFontStyle == 'italic' ? '' : newPriceFontStyle,
            fontStyle : newPriceFontStyle == 'italic' ? newPriceFontStyle : '',
            fontSize : parseInt(newPriceFontSize),
        };

        let titleStyle={
            color: titleFontColor,
            fontFamily: titleFontFamily,
            fontWeight: titleFontStyle == 'italic' ? '' : titleFontStyle,
            fontStyle : titleFontStyle == 'italic' ? titleFontStyle : '',
            fontSize : parseInt(titleFontSize),
        };

        let productNameStyle={
            color: productFontColor,
            fontFamily: productFontFamily,
            fontWeight: productFontStyle == 'italic' ? '' : productFontStyle,
            fontStyle : productFontStyle == 'italic' ? productFontStyle : '',
            fontSize : parseInt(productFontSize),
        };

        let totalAmountStyle={
            color: amountFontColor,
            fontFamily: mountFontFamily,
            fontWeight: amountFontStyle == 'italic' ? '' : amountFontStyle,
            fontStyle : amountFontStyle == 'italic' ? amountFontStyle : '',
            fontSize : parseInt(amountFontSize),
        };

        return (
            <div className="full-width display-block">
                <div className="form-group">
                    <div>
                        <span>{lang.admin}</span>
                        <span>{lang.home}</span>
                        <span>{lang.catalog}</span>
                    </div>
                    <div className="left-container">
                       <img className="image-setting-product" src={src}/>
                    </div>
                    <div className="right-container">
                        <div className="form-group">
                            <p>{title}</p>
                            <p>{price}{currency}</p>
                               
                            <p>{lang.size}</p>
                            <select 
                                name="size"
                                className="form-control">
                                <option> {option1} </option>
                            </select>
                            <p>{lang.color}</p>
                            <select 
                                name="color"
                                className="form-control" >
                                <option> {option3} </option>
                                <option> {option2} </option>

                            </select>
                        </div>

                        <button>{lang.add_to_cart}</button>
                        <div className="full-width">
                            <p style={titleStyle}>{productText}</p>
                            {
                                cartRules
                                ?
                                <Fragment> 
                                    {cartRules.map((cartRule, i)=>(
                                        <p key={i}>
                                            <input type="checkbox" />
                                            <span>
                                                <img style={displayStyle} src={_.head(cartRule.variants).src}/> 
                                            </span>
                                            <span style={productNameStyle}>{_.head(cartRule.variants).product_name}</span>
                                            <span>
                                                <select name="variants">
                                                    {
                                                        cartRule.variants.map((variant, i) => {
                                                            return <option key={i} value={variant.title}>{variant.title}</option>
                                                        })
                                                    }
                                                </select>
                                            </span>
                                            <del><span style={oldPriceStyle}>{_.head(cartRule.variants).price}{currency}</span></del>
                                            <span style={newPriceStyle}>{_.head(cartRule.variants).price}{currency}</span>
                                        </p>
                                    ))}
                                </Fragment>
                                    :
                                    <p>{msg}</p>
                                }
                            </div>
                            <p>{lang.total}<span style={totalAmountStyle}>{price}{currency}</span></p>
                            <button 
                                className='alert-box'
                                style={cartStyle}
                                onClick= {this.showAlert}
                            >{cartText}</button>
                    </div>
                    <div>
                        <span>{lang.quick_links}</span>
                        <span>{lang.talk_about_your_business}</span>
                        <span>{lang.newsletter}</span>
                    </div>
                </div>
            </div>
        );
    }
}
