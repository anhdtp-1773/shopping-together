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

    handleChangeValue( name, newValue) {
        this.setState(  {
            form: Object.assign({}, this.state.form, {
                [name]: newValue
            }),
        });
    };

    render(){
        const{title, src, price, option1, option2, option3 } = this.state.form;
        const {titleFontFamily, titleFontColor, titleFontSize, titleFontStyle, productFontFamily, productFontStyle, productFontSize, 
            productFontColor, mountFontFamily, amountFontStyle, amountFontSize, amountFontColor, newPriceFontFamily, newPriceFontStyle, 
            newPriceFontSize, newPriceFontColor, oldPriceFontFamily, oldPriceFontStyle, oldPriceFontSize, oldPriceFontColor, cartFontFamily,
            cartFontStyle, cartFontSize, cartFontColor, backgroundColor } = this.props;

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
                       <img className="image-setting-product" src = {src}/>
                    </div>
                    <div className="right-container">
                        <div className="form-group">
                            <p>{title}</p>
                            <p>{price}</p>
                               
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
                            <p style={titleStyle}>{lang.frequently_purchased_together}</p>
                            <p>
                                <input type="checkbox" />
                                <span>
                                    <img src={src} style={{width:"25px"}} /> 
                                </span>
                                <span style={productNameStyle}> {title}</span>
                                <span><input type="text"placeholder={1}/></span>
                                <span>
                                    <select>
                                        <option>{option1}</option>
                                        <option>{option2}</option>
                                        <option>{option3}</option>
                                    </select>
                                </span>
                                <del><span style= {oldPriceStyle}>{price}</span></del>
                                <span style= {newPriceStyle}>20$</span>
                            </p>
                        <p>{lang.total}<span style={totalAmountStyle}>70$</span> </p>
                        <button style= {cartStyle}>{lang.add_bundle_to_cart}</button>
                        </div>
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
