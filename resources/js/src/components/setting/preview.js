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
                    src: result.data.src,
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
            <div className="col-md-12">
              <div className="row rihgt-side__menu">
                  <div className="menu-title col-md-5">{lang.admin}</div>
                  <div className="col-md-6">
                    <span>{lang.home}</span>
                    <span>{lang.catalog}</span>
                  </div>
              </div>
              <div className="row right-side__form-product">
                <div className="col-md-5">
                   <img className="image-setting-product" src={src}/>
                </div>
                <div className="col-md-7">
                    <div className="form-group">
                        <p className="title-product">{title}</p>
                        <p className="price-product">{price} VND</p>
                        <div className="row">
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

                    <div className="col-md-12 ">
                      <div className="row">
                        <div className="col-md-12 right-side__option-title" style={titleStyle}>{productText}</div>
                        <div className="col-md-12">
                          <div className="row right-side__option">
                            <div className="col-md-1">
                              <label className="check-product">
                                <input type="checkbox"/>
                                <span className="checkmark"></span>
                              </label>
                            </div>
                            <div className="col-md-2">
                              <img style={displayStyle} src={src}/>
                            </div>
                            <div className="col-md-4">
                              <span style={productNameStyle}>{title}</span>
                            </div>
                            <div className="col-md-3">
                              <span className="col-md-2 no-padding"><input className="qty-option" type="text"placeholder={1}/></span>
                              <span className="col-md-10">
                                <select className="select-option">
                                  <option>{option1}</option>
                                  <option>{option2}</option>
                                  <option>{option3}</option>
                                </select>
                              </span>
                            </div>
                            <div className="col-md-2">
                            <del><span className="old-price" style={oldPriceStyle}>{price}</span></del>
                            <span className="new-price" style={newPriceStyle}>20$</span>
                            </div>
                          </div>
                      </div>
                    </div>
                    <p className="col-md-12 right-side__total">
                      <div className="col-md-6 first">{lang.total}</div>
                      <div className="col-md-6 second" style={totalAmountStyle}>70$</div>
                    </p>
                    <button className="btn-bundle" style={cartStyle}>{cartText}</button>
                    </div>
                </div>
              </div>
              <div className="row right-side__footer">
                  <span>{lang.quick_links}</span>
                  <span>{lang.talk_about_your_business}</span>
                  <span>{lang.newsletter}</span>
              </div>
            </div>
        );
    }
}
