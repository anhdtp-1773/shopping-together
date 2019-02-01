import React, { Component } from 'react';
import api from '../../api';

export default class Preview extends Component {
    constructor(props) {
        super(props);
        this.state = {
            form: {
                title: '',
                src: '',
                price: '',
                option1: '',
                option2: '',
                option3: '',
           }
        };
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
                    src: result.data.src_image,
                    price: result.data.price,
                    option1: result.data.option1,
                    option2: result.data.option2,
                    option3: result.data.option3,
                }),
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

    render (){
        const{title, src, price, option1, option2, option3 } = this.state.form;
        const {titleFontFamily, titleFontColor, titleFontStyle, productFontFamily, productFontStyle, productFontColor, amountFontFamily,
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
            fontFamily: amountFontFamily,
            fontWeight: amountFontStyle == 'italic' ? '' : amountFontStyle,
            fontStyle : amountFontStyle == 'italic' ? amountFontStyle : '',
        };

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
                            <p className="price-product">{price} VND</p>
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

                        <div className="col-md-12 col-xs-12 right-side__translation">
                            <div className="row">
                                <div className="col-md-12 right-side__option-title col-xs-12" style={titleStyle}>{productText}</div>
                                <div className="col-md-12 col-xs-12 right-side__option">
                                    <div className="col-md-1 col-xs-1 unpadding-left">
                                        <label className="check-product">
                                        <input type="checkbox"/>
                                        <span className="checkmark"></span>
                                        </label>
                                    </div>
                                    <div className="col-md-2 col-xs-4">
                                        <img className="img-option" src={src}/>
                                    </div>
                                    <div className="col-md-4 col-xs-7 split-title-product">
                                        <span style={productNameStyle}>{title}</span>
                                    </div>
                                    <div className="col-md-2 col-xs-8">
                                        <span className="col-md-12 col-xs-12 unpadding-left">
                                        <select className="select-option">
                                            <option>{option1}</option>
                                            <option>{option2}</option>
                                            <option>{option3}</option>
                                        </select>
                                        </span>
                                    </div>
                                    <div className="col-md-3 col-xs-4 unpadding-right">
                                        <del><span className="old-price" style={oldPriceStyle}>{price}</span></del>
                                        <span className="new-price" style={newPriceStyle}>20$</span>
                                    </div>
                                </div>
                            </div>
                            <div className="col-md-12 right-side__total unpadding-left">
                                <div className="col-md-6 first col-xs-6">{lang.total}</div>
                                <div className="col-md-6 second col-xs-6" style={totalAmountStyle}>70$</div>
                            </div>
                            <button className="btn-bundle" style={cartStyle}>{cartText}</button>
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
