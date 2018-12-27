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

export default class Setting extends Component {
    constructor(props) {
        super(props);
        this.state = {
            isFetching: true,
            isChecked: null,
            form: {
                active: 1,
                titleFontFamily: 'verdana',
                titleFontStyle: 'italic',
                titleFontSize: 25,
                titleFontColor: '#2296F3',
            },
        };
    }
    async componentWillMount(){
        const response = await api.getSetup();
        const result = JSON.parse(response.text);
        this.setState({ 
            isChecked: this.props.isChecked,
            setting: result.data.setting,
        });
	    if(result.data.setting){
            this.setState({
                form: Object.assign({}, this.state.form, { 
                    title_font_family: result.data.setting.titleFontFamily,
                    title_font_style: result.data.setting.titleFontStyle,
                    title_font_size: result.data.setting.titleFontSize,
                    title_font_color: result.data.setting.titleFontColor,
                }),
                isFetching: false,
            })
        }else{
            this.setState({
                isFetching: false,
            })
        }
    }
    
    changeHandlerColor = (name, colors) => {
        this.setState({ 
            form: Object.assign({}, this.state.form, {
                [name]: colors.color
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

    handleChangeColor(name, value){
        this.setState({ 
            form: Object.assign({}, this.state.form, {
                [name]: value
            }),
            validates: Lodash.assign({}, this.state.validates, validates),
        });
    }
    async onSubmit(){
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
        const{form,} = this.state;
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
                    <p>{lang.user_guide}</p>
                    <p>{lang.help}</p>
                    <button>{lang.save}</button>
                </div>
                <div className="right-container">
                    <Preview />
                </div>
           </div>
        );
    }
}