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
            },
                key: 0,
                msg: lang.record_not_found,
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
        // console.log(result);
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

    handleChange (event,key11) {
        debugger;
        let aaa = event.target.value;
        const index = _.findIndex((this.state.cart_rules)[key11].variants, function(c) { return c.id_variant == event.target.value })
        // this.setState({
        //     // form: Object.assign({}, this.state.form, {
        //         key: index
        //     // }),
        // });
        // this.setState({key: index});
       this.state.key = index;
    }

    showAlert () {
        return alert(lang.go_to_your_live_website_to_use_this_function);
    }

    render (){
        const{title, src, price, option1, option2, option3, cartRules, currency } = this.state.form;
        const{key} = this.state;
        const {titleFontFamily, titleFontColor, titleFontStyle, productFontFamily, productFontStyle, productFontColor, mountFontFamily, 
            amountFontStyle, amountFontColor, newPriceFontFamily, newPriceFontStyle, newPriceFontColor, oldPriceFontFamily, oldPriceFontStyle, 
            oldPriceFontColor, cartText,productText, cartFontFamily, cartFontStyle, cartFontColor, backgroundColor} = this.props;

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
            fontFamily: mountFontFamily,
            fontWeight: amountFontStyle == 'italic' ? '' : amountFontStyle,
            fontStyle : amountFontStyle == 'italic' ? amountFontStyle : '',
        };
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
                          <div className="col-md-6">
                            <p>{lang.size}</p>
                            <select
                                name="size"
                                className="form-control">
                                <option> {option1} </option>
                            </select>
                          </div>
                          <div className="col-md-6">
                            <p>{lang.color}</p>
                            <select
                                name="color"
                                className="form-control" >
                                <option> {option3} </option>
                                <option> {option2} </option>
                            </select>
                          </div>
                        </div>
                    </div>
                    <button className="btn btn-primary col-md-12">{lang.add_to_cart}</button>
                    <div className="col-md-12 right-side__translation">
                        <div className="row">
                            {
                                cartRules
                                ?
                                <Fragment> 
                                    <div className="col-md-12 right-side__option-title" style={titleStyle}>{productText}</div>
                                    {cartRules.map((cartRule, i)=>(
                                        <div className="col-md-12">
                                            <div key1={i} className="col-md-12 unpadding right-side__option">
                                                <div className="col-md-2">
                                                    <img className="img-option" src={(cartRule.variants)[key].src}/>
                                                </div>
                                                <div className="col-md-4">
                                                    <span style={productNameStyle}>{(cartRule.variants)[key].product_name}</span>
                                                </div>
                                                <div className="col-md-3 unpadding-right">
                                                    <span className="col-md-10 unpadding-right">
                                                        <select className="select-option" name="variants" onChange={(event)=>this.handleChange(event,i)}>
                                                            {
                                                                cartRule.variants.map((variant, j) => {
                                                                    return <option key2={j} value={variant.id_variant}>{variant.title}</option>
                                                                })
                                                            }
                                                        </select>
                                                    </span>
                                                </div>
                                              
                                                <div className="col-md-2 unpadding-right">
                                                <del><span className="old-price" style={oldPriceStyle}>{(cartRule.variants)[key].price}{currency}</span></del>
                                                <span className="new-price" style={newPriceStyle}>{(cartRule.variants)[key].price}{currency}</span>
                                            </div>
                                            </div>
                                            key: {key}
                                        </div>
                                    ))}
                                    <p className="col-md-12 right-side__total unpadding-left">
                                        <div className="col-md-6 first">{lang.total}</div>
                                        <div className="col-md-6 second" style={totalAmountStyle}>{price}{currency}</div>
                                    </p>
                                </Fragment>
                                :
                                <p>{msg}</p>
                            }
                            <button className="btn-bundle alert-box" onClick= {this.showAlert} style={cartStyle}>{cartText}</button>
                        </div>
                    </div>
                    </div>
                </div>
                <div className="row right-side__footer">
                    <span>{lang.label_footer}</span>
                </div>
            </div>
        );
    }
}
