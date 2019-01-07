import React, { Component, Fragment } from 'react';
import {fontFamilyOptions, fontStyleOptions, rangeFontSizeMin, rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class Cart extends Component {
    constructor(props) {
        super(props);
        this.state = {
            displayFontColor: false,
            displayBackgroundColor: false,
        };
    }
    handleClick(event){
        switch(event.target.name) {
            case 'cartFontColor':
                this.setState({
                    displayFontColor: !this.state.displayFontColor,
                    displayBackgroundColor: false,
                });
                break;
            case 'backgroundColor':
                this.setState({
                    displayBackgroundColor: !this.state.displayBackgroundColor,
                    displayFontColor: false,
                });
                break;
            default:
                return;
        }
    }
    
    handleClose(){
        this.setState({ 
            displayFontColor: false,
        })
    }

    changeHandlerColor (name, colors) {
        this.props.handleChangeValue(name, colors.color)
    };

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value)
    };

    render(){
        const {cartFontFamily, cartFontStyle, cartFontSize, cartFontColor, backgroundColor, validates} = this.props;
        const {displayFontColor, displayBackgroundColor } = this.state;
        return (
            <div className="full-width display-block">
                <p> {lang.add_to_cart_button}</p>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_family}
                            <select 
                                name = "cartFontFamily"
                                className="form-control" 
                                onChange = {this.handleChangeValue.bind(this)}
                                value =  {cartFontFamily} 
                            >
                                {fontFamilyOptions.map((value, i) =>
                                    <option key={i} value={value.value}>{value.label}</option>
                                )}
                            </select>
                        </p>
                    </div>
                </div>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_style}
                            <select 
                                name = "cartFontStyle"
                                className="form-control" 
                                onChange = {this.handleChangeValue.bind(this)}
                                value =  {cartFontStyle}
                            >
                                {fontStyleOptions.map((value, i) =>
                                    <option key={i} value={value.value}>{value.label}</option>
                                )}
                            </select>
                        </p>
                    </div>
                </div>
                <div className="full-width">
                    <p>{lang.font_color}
                        <input 
                            type="text" 
                            style={{ backgroundColor: cartFontColor }} 
                            value={cartFontColor} 
                            onChange={this.handleChangeValue.bind(this)} 
                            onClick={this.handleClick.bind(this)}
                            name="cartFontColor"
                            className={classNames('form-control', validates.cartFontColor)}
                        />
                        {
                            displayFontColor 
                            ?
                            <Fragment>
                                <ColorPickerPanel 
                                    alpha={80} 
                                    color= {cartFontColor} 
                                    onChange={this.changeHandlerColor.bind(this, 'cartFontColor')} 
                                    mode="HSB" 
                                    onBlur={this.handleClose.bind(this) }
                                />
                            </Fragment>
                            :
                            null
                        }
                    </p>
                </div>
                <div className="full-width">
                    <p>{lang.back_ground_color}
                        <input 
                            type="text" 
                            style={{ backgroundColor: backgroundColor }} 
                            value={backgroundColor} 
                            onChange={this.handleChangeValue.bind(this)} 
                            onClick={this.handleClick.bind(this)}
                            name="backgroundColor"
                            className={classNames('form-control', validates.backgroundColor)}
                        />
                        {
                            displayBackgroundColor 
                            ?
                            <Fragment>
                                <ColorPickerPanel 
                                    alpha={80} 
                                    color= {backgroundColor} 
                                    onChange={this.changeHandlerColor.bind(this, 'backgroundColor')} 
                                    mode="HSB" 
                                    onBlur={this.handleClose.bind(this) }
                                />
                            </Fragment>
                            :
                            null
                        }
                    </p>
                </div>
                <div className="full-width">
                    <p>{lang.font_size}
                        <input 
                            className="slidecontainer" 
                            type="range" 
                            name = "cartFontSize"
                            value ={cartFontSize} 
                            min = {rangeFontSizeMin}
                            max = {rangeFontSizeMax}
                            onChange={this.handleChangeValue.bind(this)} 
                        />
                     </p>
                </div>
            </div>
        );
    }
}