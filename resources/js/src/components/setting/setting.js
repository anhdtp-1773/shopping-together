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
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
        this.state = {
            isFetching: true,
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
                showProductQty: 3,
                productImageWidth: 30 ,
                productImageHeight: 30,
                oldPriceFontFamily:'verdana',
                newPriceFontStyle:'italic',
                oldPriceFontSize: 20,
                oldPriceFontColor:'#2296F3',
                cartFontFamily:'verdana',
                cartFontStyle: 'italic',
                cartFontSize: 20,
                cartFontColor: '#2296F3',
                backgroundColor: '#2296F3',
                productImageWidth: 20,
                productImageHeight: 20,
            },
            validates: {},
            message: '',
            displayFontColor: false,
        };
    }
    async componentWillMount(){
        const response = await api.getSetup();
        const result = JSON.parse(response.text);

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
                    showProductQty: result.data.setting.show_product_qty,
                    productImageWidth: result.data.setting.product_image_width,
                    productImageHeight: result.data.setting.product_imgae_height,
                    cartFontFamily: result.data.setting.cart_font_family,
                    cartFontStyle: result.data.setting.cart_font_style,
                    cartFontSize: result.data.setting.cart_font_size,
                    cartFontColor: result.data.setting.cart_font_color,
                    backgroundColor: result.data.setting.back_ground_color,
                }),
                isFetching: false,
            })
        }else{
            this.setState({
                isFetching: false,
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
            case 'cartFontColor':
            case 'backgroundColor':
                validates[name] = Validate.require(value) ? 'valid' : 'invalid';
                break;
            case 'productImageWidth':
            case 'productImageHeight':
                validates[name] = Validate.isNumeric(value) ? 'valid' : 'invalid';
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
        this.setState({
            isFetching: true
        });
        try{
            const fetch = await api.saveSetting(this.state.form);
            const result = JSON.parse(fetch.text);
            if(result.data){
                this.setState({
                    isFetching: false,
                    message: result.message
                })
            }
        }catch(errors){
            alert(errors.message)
        }
    }   
    render() {
        const{form, validates, isFetching, message} = this.state;
        const disabledOnClick = Lodash.every(Lodash.values(validates), function(value){return value == 'valid'});
        if(isFetching){ return (
            <div id="page_loading">
                <div className="loading">
                    <i className="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom" />
                </div>
            </div>
        )}else {
            return (
                <div className="home-container">
                    <div className="left-container">
                        <Fragment>
                            <Title 
                                titleFontFamily = {form.titleFontFamily}
                                titleFontStyle = {form.titleFontStyle}
                                titleFontColor = {form.titleFontColor}
                                titleFontSize = {form.titleFontSize}
                                handleChangeValue = {this.handleChangeValue}
                                validates = {validates}
                            />
                    
                            <ProductName 
                                productFontFamily = {form.productFontFamily}
                                productFontStyle = {form.productFontStyle}
                                productFontColor = {form.productFontColor}
                                productFontSize = {form.productFontSize}
                                handleChangeValue = {this.handleChangeValue}
                                validates = {validates}
                            />
                        
                            <TotalAmount 
                                amountFontFamily = {form.amountFontFamily}
                                amountFontStyle = {form.amountFontStyle}
                                amountFontSize = {form.amountFontSize}
                                amountFontColor = {form.amountFontColor}
                                handleChangeValue = {this.handleChangeValue}
                                validates = {validates}
                                />

                            <NewPrice 
                                newPriceFontFamily = {form.newPriceFontFamily}
                                newPriceFontStyle = {form.newPriceFontStyle}
                                newPriceFontSize = {form.newPriceFontSize}
                                newPriceFontColor = {form.newPriceFontColor}
                                handleChangeValue = {this.handleChangeValue}
                                validates = {validates}
                                />
                        
                            <OldPrice 
                                oldPriceFontFamily = {form.oldPriceFontFamily}
                                oldPriceFontStyle = {form.oldPriceFontStyle}
                                oldPriceFontSize = {form.oldPriceFontSize}
                                oldPriceFontColor = {form.oldPriceFontColor}
                                handleChangeValue = {this.handleChangeValue}
                                validates = {validates}
                            />
                        
                            <Cart 
                                cartFontFamily = {form.cartFontFamily}
                                cartFontStyle = {form.cartFontStyle}
                                cartFontSize = {form.cartFontSize}
                                cartFontColor = {form.cartFontColor}
                                backgroundColor = {form.backgroundColor}
                                handleChangeValue = {this.handleChangeValue}
                                validates = {validates}
                            />
                        
                            <Translation 
                            />
                        
                            <Display 
                                showProductQty = {form.showProductQty}
                                productImageWidth = {form.productImageWidth}
                                productImageHeight = {form.productImageHeight}
                                handleChangeValue = {this.handleChangeValue}
                                validates = {validates}
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
                            onClick={this.onSubmit} 
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
                            cartFontFamily = {form.cartFontFamily}
                            cartFontStyle = {form.cartFontStyle}
                            cartFontSize = {form.cartFontSize}
                            cartFontColor = {form.cartFontColor}
                            backgroundColor = {form.backgroundColor}
                            showProductQty = {form.showProductQty}
                            productImageWidth = {form.productImageWidth}
                            productImageHeight = {form.productImageHeight}
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
}