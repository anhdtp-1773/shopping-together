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
        this.handleChangeToggle = this.handleChangeToggle.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
        this.state = {
            isFetching: true,
            form: {
                active: 1,
                titleFontFamily: 'verdana',
                titleFontStyle: 'italic',
                titleFontColor: '#2296F3',
                productFontFamily: 'verdana',
                productFontStyle:'italic',
                productFontColor:'#2296F3',
                amountFontFamily:'verdana',
                amountFontStyle:'italic',
                amountFontColor:'#2296F3',
                newPriceFontFamily:'verdana',
                newPriceFontStyle:'italic',
                newPriceFontColor:'#2296F3',
                oldPriceFontFamily:'verdana',
                oldPriceFontStyle:'italic',
                oldPriceFontColor:'#2296F3',
                cartFontFamily:'verdana',
                cartFontStyle: 'italic',
                cartFontColor: '#2296F3',
                backgroundColor: '##ff0000',
                cartText:'',
                productText:'',
                showProductQty: 3,
            },
            validates: {},
            message: '',
            title: false,
            productName: false,
            totalAmount: false,
            newPrice: false,
            oldPrice: false,
            cart: false,
            translation: false,
            display: false,
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
                    titleFontColor: result.data.setting.title_font_color,
                    productFontFamily: result.data.setting.product_font_family,
                    productFontStyle: result.data.setting.product_font_style,
                    productFontColor: result.data.setting.product_font_color,
                    amountFontFamily: result.data.setting.amount_font_family,
                    amountFontStyle: result.data.setting.amount_font_style,
                    amountFontColor: result.data.setting.amount_font_color,
                    newPriceFontFamily: result.data.setting.new_price_font_family,
                    newPriceFontStyle: result.data.setting.new_price_font_style,
                    newPriceFontColor: result.data.setting.new_price_font_color,
                    oldPriceFontFamily: result.data.setting.old_price_font_family,
                    oldPriceFontStyle: result.data.setting.old_price_font_style,
                    oldPriceFontColor: result.data.setting.old_price_font_color,
                    cartText: result.data.setting.cart_text,
                    productText: result.data.setting.product_text,
                    showProductQty: result.data.setting.show_product_qty,
                    cartFontFamily: result.data.setting.cart_font_family,
                    cartFontStyle: result.data.setting.cart_font_style,
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
            case 'cartText':
            case 'productText':
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
        this.validate (name, newValue);
        this.setState ({
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

    handleChangeToggle (name) {
        switch(name) {
            case 'title':
                this.setState({
                    title: !this.state.title,
                    productName: false,
                    totalAmount: false,
                    newPrice: false,
                    oldPrice: false,
                    cart: false,
                    translation: false,
                    display: false,
                });
                break;
            case 'productName':
                this.setState({
                    title: false,
                    productName: !this.state.productName,
                    totalAmount: false,
                    newPrice: false,
                    oldPrice: false,
                    cart: false,
                    translation: false,
                    display: false,
                });
                break;
            case 'totalAmount':
                this.setState({
                    title: false,
                    productName: false,
                    totalAmount: !this.state.totalAmount,
                    newPrice: false,
                    oldPrice: false,
                    cart: false,
                    translation: false,
                    display: false,
                });
                break;
            case 'newPrice':
                this.setState({
                    title: false,
                    productName: false,
                    totalAmount: false,
                    newPrice: !this.state.newPrice,
                    oldPrice: false,
                    cart: false,
                    translation: false,
                    display: false,
                });
                break;
            case 'oldPrice':
                this.setState({
                    title: false,
                    productName: false,
                    totalAmount: false,
                    newPrice: false,
                    oldPrice: !this.state.oldPrice,
                    cart: false,
                    translation: false,
                    display: false,
                });
                break;
            case 'cart':
                this.setState({
                    title: false,
                    productName: false,
                    totalAmount: false,
                    newPrice: false,
                    oldPrice: false,
                    cart: !this.state.cart,
                    translation: false,
                    display: false,
                });
                break;
            case 'translation':
                this.setState({
                    title: false,
                    productName: false,
                    totalAmount: false,
                    newPrice: false,
                    oldPrice: false,
                    cart: false,
                    translation: !this.state.translation,
                    display: false,
                });
                break;
            case 'display':
                this.setState({
                    title: false,
                    productName: false,
                    totalAmount: false,
                    newPrice: false,
                    oldPrice: false,
                    cart: false,
                    translation: false,
                    display: !this.state.display,
                });
                break;
            default:
                return;
        }
    }

    render () {
        const{form, validates, isFetching, message, title, productName, totalAmount, newPrice, oldPrice, cart, translation, display} = this.state;
        const disabledOnClick = Lodash.every(Lodash.values(validates), function(value){return value == 'valid'});
        if(isFetching){
            return (
            <div id="page_loading">
                <div className="loading">
                    <i className="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom" />
                </div>
            </div>
        )}else {
            return (
                <div className="container-fluid block-setting">
                  <div className="col-md-3 left-side">
                    <div className="wrap-control">
                      <Fragment>
                          <Title
                              titleFontFamily = {form.titleFontFamily}
                              titleFontStyle = {form.titleFontStyle}
                              titleFontColor = {form.titleFontColor}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              title = {title}
                              handleChangeToggle = {this.handleChangeToggle}
                          />

                          <ProductName
                              productFontFamily = {form.productFontFamily}
                              productFontStyle = {form.productFontStyle}
                              productFontColor = {form.productFontColor}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              productName = {productName}
                              handleChangeToggle = {this.handleChangeToggle}
                          />

                          <TotalAmount
                              amountFontFamily = {form.amountFontFamily}
                              amountFontStyle = {form.amountFontStyle}
                              amountFontColor = {form.amountFontColor}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              totalAmount = {totalAmount}
                              handleChangeToggle = {this.handleChangeToggle}
                              />

                          <NewPrice
                              newPriceFontFamily = {form.newPriceFontFamily}
                              newPriceFontStyle = {form.newPriceFontStyle}
                              newPriceFontColor = {form.newPriceFontColor}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              newPrice = {newPrice}
                              handleChangeToggle = {this.handleChangeToggle}
                              />

                          <OldPrice
                              oldPriceFontFamily = {form.oldPriceFontFamily}
                              oldPriceFontStyle = {form.oldPriceFontStyle}
                              oldPriceFontColor = {form.oldPriceFontColor}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              oldPrice = {oldPrice}
                              handleChangeToggle = {this.handleChangeToggle}
                          />

                          <Cart
                              cartFontFamily = {form.cartFontFamily}
                              cartFontStyle = {form.cartFontStyle}
                              cartFontColor = {form.cartFontColor}
                              backgroundColor = {form.backgroundColor}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              cart = {cart}
                              handleChangeToggle = {this.handleChangeToggle}
                          />

                          <Translation
                              cartText = {form.cartText}
                              productText = {form.productText}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              translation = {translation}
                              handleChangeToggle = {this.handleChangeToggle}
                          />

                          <Display
                              showProductQty = {form.showProductQty}
                              handleChangeValue = {this.handleChangeValue}
                              validates = {validates}
                              display = {display}
                              handleChangeToggle = {this.handleChangeToggle}
                          />

                      </Fragment>
                      </div>
                  </div>
                  <div className="col-md-9 right-side">
                      <Preview
                          titleFontFamily = {form.titleFontFamily}
                          titleFontStyle = {form.titleFontStyle}
                          titleFontColor = {form.titleFontColor}
                          productFontFamily = {form.productFontFamily}
                          productFontStyle = {form.productFontStyle}
                          productFontColor = {form.productFontColor}
                          amountFontFamily = {form.amountFontFamily}
                          amountFontStyle = {form.amountFontStyle}
                          amountFontColor = {form.amountFontColor}
                          newPriceFontFamily = {form.newPriceFontFamily}
                          newPriceFontStyle = {form.newPriceFontStyle}
                          newPriceFontColor = {form.newPriceFontColor}
                          oldPriceFontFamily = {form.oldPriceFontFamily}
                          oldPriceFontStyle = {form.oldPriceFontStyle}
                          oldPriceFontColor = {form.oldPriceFontColor}
                          cartFontFamily = {form.cartFontFamily}
                          cartFontStyle = {form.cartFontStyle}
                          cartFontColor = {form.cartFontColor}
                          backgroundColor = {form.backgroundColor}
                          cartText = {form.cartText}
                          productText = {form.productText}
                          showProductQty = {form.showProductQty}
                          productImageWidth = {form.productImageWidth}
                          productImageHeight = {form.productImageHeight}
                      />
                  </div>
                  <button
                      href="javascript:void(0);"
                      onClick={this.onSubmit}
                      className={ClassNames({'pos-button btn-save': true}, {'disabled-form': !disabledOnClick})}
                  >
                      {lang.save}
                  </button>
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
