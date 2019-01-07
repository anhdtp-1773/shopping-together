import React, { Component, Fragment } from 'react';
import Preview from './preview';
import ProductName from './productName';
import TotalAmount from './totalAmount';
import NewPrice from './newPrice';
import OldPrice from './oldPrice';
import Title from './title';
import Cart from './cart';
import Translation from './translation';
import Display from './display';
import api from '../../api';
import ClassNames from 'classnames'
import * as Validate from "../../models/validate.model"; 
import Lodash from 'lodash';
import Notification from '../notification';

export default class Setting extends Component {
    constructor(props) {
        super(props);
        this.state = {
            form: {
                active: 1,
                titleFontFamily: 'verdana',
                titleFontStyle: 'italic',
                titleFontSize: 20,
                titleFontColor: '#2296F3',
                productFontFamily: 'verdana',
                productFontStyle:'italic',
                productFontSize: 20,
                productFontColor:'#2296F3',
                amountFontFamily:'verdana',
                amountFontStyle:'italic',
                amountFontSize: 20,
                amountFontColor:'#2296F3',
                newPriceFontFamily:'verdana',
                newPriceFontStyle:'italic',
                newPriceFontSize: 20,
                newPriceFontColor:'#2296F3',
                cartText:'',
                productText:'',
            },
            validates: {},
            message: '',
            displayFontColor: false,
        };
    }
    async componentWillMount(){
        const response = await api.getSetup();
        const result = JSON.parse(response.text);
        this.setState({ 
            setting: result.data.setting,
        });

        if(result.data.setting){
            this.setState({
                form: Object.assign({}, this.state.form, { 
                    titleFontFamily: result.data.setting.title_font_family,
                    titleFontStyle: result.data.setting.title_font_style,
                    titleFontSize: result.data.setting.title_font_size,
                    titleFontColor: result.data.setting.title_font_color,
                    productFontFamily: result.data.setting.product_font_family,
                    productFontStyle: result.data.setting.product_font_style,
                    productFontSize: result.data.setting.product_font_size,
                    productFontColor: result.data.setting.product_font_color,
                    amountFontFamily: result.data.setting.amount_font_family,
                    amountFontStyle: result.data.setting.amount_font_style,
                    amountFontSize: result.data.setting.amount_font_size,
                    amountFontColor: result.data.setting.amount_font_color,
                    newPriceFontFamily: result.data.setting.new_price_font_family,
                    newPriceFontStyle: result.data.setting.new_price_font_style,
                    newPriceFontSize: result.data.setting.new_price_font_size,
                    newPriceFontColor: result.data.setting.new_price_font_color,
                    oldPriceFontFamily: result.data.setting.old_price_font_family,
                    oldPriceFontStyle: result.data.setting.old_price_font_style,
                    oldPriceFontSize: result.data.setting.old_price_font_size,
                    oldPriceFontColor: result.data.setting.old_price_font_color,
                    cartText: result.data.setting.cart_text,
                    productText: result.data.setting.product_text,
                }),
            })
        }
    }

    validate (name, value) {
        let {validates} = this.state;
        switch(name){
            case 'titleFontColor':
            case 'productFontColor':
            case 'amountFontColor':
            case 'newPriceFontColor':
            case 'oldPriceFontColor':
            case 'cartText':
            case 'productText':
                validates[name] = Validate.require(value) ? 'valid' : 'invalid';
                break;
        }

        this.setState({ 
            validates: Lodash.assign({}, this.state.validates, validates),
        });
    }

    handleChangeValue (name, newValue) {
        this.validate(name, newValue);
        this.setState(  {
            form: Object.assign({}, this.state.form, {
                [name]: newValue
            }),
        });
    };

    async onSubmit (){
        try{
            const fetch = await api.saveSetting(this.state.form);
            const result = JSON.parse(fetch.text);
            if(result.data){
                this.setState({
                    message: result.message
                })
            }
        }catch(errors){
            alert(errors.message)
        }
    }   
    render() {
        const{form, validates, message} = this.state;
        const disabledOnClick = Lodash.every(Lodash.values(validates), function(value){return value == 'valid'});
        return (
            <div className="home-container">
                <div className="left-container">
                    <Fragment>
                        <Title 
                            titleFontFamily = {form.titleFontFamily}
                            titleFontStyle = {form.titleFontStyle}
                            titleFontColor = {form.titleFontColor}
                            titleFontSize = {form.titleFontSize}
                            handleChangeValue = {this.handleChangeValue.bind(this)}
                            validates = {validates}
                        />
                   
                        <ProductName 
                            productFontFamily = {form.productFontFamily}
                            productFontStyle = {form.productFontStyle}
                            productFontColor = {form.productFontColor}
                            productFontSize = {form.productFontSize}
                            handleChangeValue = {this.handleChangeValue.bind(this)}
                            validates = {validates}
                        />
                    
                        <TotalAmount 
                            amountFontFamily = {form.amountFontFamily}
                            amountFontStyle = {form.amountFontStyle}
                            amountFontSize = {form.amountFontSize}
                            amountFontColor = {form.amountFontColor}
                            handleChangeValue = {this.handleChangeValue.bind(this)}
                            validates = {validates}
                            />

                        <NewPrice 
                            newPriceFontFamily = {form.newPriceFontFamily}
                            newPriceFontStyle = {form.newPriceFontStyle}
                            newPriceFontSize = {form.newPriceFontSize}
                            newPriceFontColor = {form.newPriceFontColor}
                            handleChangeValue = {this.handleChangeValue.bind(this)}
                            validates = {validates}
                            />
                    
                        <OldPrice 
                            oldPriceFontFamily = {form.oldPriceFontFamily}
                            oldPriceFontStyle = {form.oldPriceFontStyle}
                            oldPriceFontSize = {form.oldPriceFontSize}
                            oldPriceFontColor = {form.oldPriceFontColor}
                            handleChangeValue = {this.handleChangeValue.bind(this)}
                            validates = {validates}
                        />
                    
                        <Cart 
                        />
                    
                        <Translation 
                            cartText = {form.cartText}
                            productText = {form.productText}
                            handleChangeValue = {this.handleChangeValue.bind(this)}
                            validates = {validates}
                        />
                    
                        <Display 
                        />
                        
                    </Fragment>
                    <p>{lang.design_and_support_by_hamsa_technology}</p>
                    <a>{lang.user_guide}</a>
                    <p
                    >
                        {lang.help}
                    </p>
                    <button
                        href="javascript:void(0);" 
                        onClick={this.onSubmit.bind(this)} 
                        className={ClassNames({'pos-button': true}, {'disabled-form': !disabledOnClick})}
                    >
                        {lang.save}
                    </button>
                </div>
                <div className="right-container">
                    <Preview
                        titleFontFamily = {form.titleFontFamily}
                        titleFontStyle = {form.titleFontStyle}
                        titleFontColor = {form.titleFontColor}
                        titleFontSize = {form.titleFontSize}
                        productFontFamily = {form.productFontFamily}
                        productFontStyle = {form.productFontStyle}
                        productFontColor = {form.productFontColor}
                        productFontSize = {form.productFontSize}
                        amountFontFamily = {form.amountFontFamily}
                        amountFontStyle = {form.amountFontStyle}
                        amountFontSize = {form.amountFontSize}
                        amountFontColor = {form.amountFontColor}
                        newPriceFontFamily = {form.newPriceFontFamily}
                        newPriceFontStyle = {form.newPriceFontStyle}
                        newPriceFontSize = {form.newPriceFontSize}
                        newPriceFontColor = {form.newPriceFontColor}
                        oldPriceFontFamily = {form.oldPriceFontFamily}
                        oldPriceFontStyle = {form.oldPriceFontStyle}
                        oldPriceFontSize = {form.oldPriceFontSize}
                        oldPriceFontColor = {form.oldPriceFontColor}
                        cartText = {form.cartText}
                        productText = {form.productText}
                    />
                </div>
                {
                message 
                ?
                <Notification 
                    content = {message}
                />
                :
                null
            }
           </div>
        );
    }
}