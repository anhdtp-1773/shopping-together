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
                titleFontSize: 25,
                titleFontColor: '#2296F3',
            },
            validates: {},
            message: '',
            displayFontColor: false,
        };
    }
    async componentWillMount(){
        const response = await api.getSetup();
        const result = JSON.parse(response.text);
        // console.log(result)
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
                }),
            })
        }
    }

    validate (name, value) {
        let {validates} = this.state;
        switch(name){
            case 'titleFontColor':
                validates[name] = Validate.require(value) ? 'valid' : 'invalid';
                break;
        }
        this.setState({ 
            validates: Lodash.assign({}, this.state.validates, validates),
        });
    }

    handleChangeColor(name, value){
        this.validate(name, value);
        this.setState({ 
            form: Object.assign({}, this.state.form, {
                [name]: value
            }), 
        });
    };

    handleChangeValue  = ( name, newValue) => {
        this.setState(  {
            form: Object.assign({}, this.state.form, {
                [name]: newValue
            }),
        });
    };

    changeHandlerColor= (name, colors) => {
        this.validate(name, colors.color);
        this.setState({ 
            form: Object.assign({}, this.state.form, {
                [name]: colors.color
            }),
        });
    }

    async onSubmit(){
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
        const disabledOnClick = Lodash.every(Lodash.values(validates), function(value){return value == 'valid'}) ? true :false;
        return (
            <div className="home-container">
                <div className="left-container">
                    <Fragment>
                        <Title 
                            titleFontFamily = {form.titleFontFamily}
                            titleFontStyle = {form.titleFontStyle}
                            titleFontColor = {form.titleFontColor}
                            titleFontSize = {form.titleFontSize}
                            changeHandlerColor = {this.changeHandlerColor.bind(this)}
                            handleChangeColor = {this.handleChangeColor.bind(this)}
                            handleChangeValue = {this.handleChangeValue.bind(this)}
                            validates = {validates}
                        />
                   
                        <ProductName 
                        />
                    
                        <TotalAmount 
                            />
                           
                        <NewPrice 
                        />
                    
                        <OldPrice 
                        />
                    
                        <Cart 
                        />
                    
                        <Translation 
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
                        onClick ={this.onSubmit.bind(this)} 
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