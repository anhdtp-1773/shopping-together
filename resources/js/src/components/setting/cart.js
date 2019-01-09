import React, { Component, Fragment } from 'react';
import {fontFamilyOptions, fontStyleOptions, rangeFontSizeMin, rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class Cart extends Component {
    constructor(props) {
        super(props);

        this.handleOutsideClickFontColor = this.handleOutsideClickFontColor.bind(this);
        this.handleOutsideClickBackgroundColor = this.handleOutsideClickBackgroundColor.bind(this);
        this.handleClickFontColor = this.handleClickFontColor.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.handleClickBackgroundColor = this.handleClickBackgroundColor.bind(this);
        this.state = {
            displayFontColor: false,
            displayBackgroundColor: false,
        };
    }

    handleClickFontColor()
    {   
        if (!this.state.displayFontColor) {
            document.addEventListener('click', this.handleOutsideClickFontColor, false);
        } else {
            document.removeEventListener('click', this.handleOutsideClickFontColor, false);
        }
        this.setState({
            displayFontColor: !this.state.displayFontColor,
        });
    }   

    handleClickBackgroundColor()
    {
        if (!this.state.displayBackgroundColor) {
            document.addEventListener('click', this.handleOutsideClickBackgroundColor, false);
        } else {
            document.removeEventListener('click', this.handleOutsideClickBackgroundColor, false);
        }
        this.setState({
            displayBackgroundColor: !this.state.displayBackgroundColor,
        });
    }   
    
    handleOutsideClickFontColor(e) {
        if (this.node.contains(e.target)) {
            return;
        }
        this.handleClickFontColor();
    }

    handleOutsideClickBackgroundColor(e) {
        if (this.node.contains(e.target)) {
            return;
        }
        this.handleClickBackgroundColor();
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
                                name="cartFontFamily"
                                className="form-control" 
                                onChange={this.handleChangeValue}
                                value={cartFontFamily} 
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
                        <p>{lang.font_style}</p>
                            <select 
                                name="cartFontStyle"
                                className="form-control" 
                                onChange={this.handleChangeValue}
                                value= {cartFontStyle}
                            >
                                {fontStyleOptions.map((value, i) =>
                                    <option key={i} value={value.value}>{value.label}</option>
                                )}
                            </select>
                    </div>
                </div>
                <div className="full-width"  ref={node => { this.node = node; }}>
                    <p>{lang.font_color}</p>
                        <input 
                            type="text" 
                            style={{ backgroundColor: cartFontColor }} 
                            value={cartFontColor} 
                            onChange={this.handleChangeValue} 
                            name="cartFontColor"
                            className={classNames('form-control', validates.cartFontColor)}
                            onClick={this.handleClickFontColor}
                        />
                        {
                            displayFontColor 
                            ?
                            <Fragment>
                                <ColorPickerPanel 
                                    alpha={80} 
                                    color={cartFontColor} 
                                    onChange={this.changeHandlerColor.bind(this, 'cartFontColor')} 
                                    mode="HSB" 
                                />
                            </Fragment>
                            :
                            null
                        }
                </div>
                <div className="full-width"  ref={node => { this.node = node; }}>
                    <p>{lang.back_ground_color}</p>
                        <input 
                            type="text" 
                            style={{ backgroundColor: backgroundColor }} 
                            value={backgroundColor} 
                            onChange={this.handleChangeValue} 
                            name="backgroundColor"
                            className={classNames('form-control', validates.backgroundColor)}
                            onClick={this.handleClickBackgroundColor}
                        />
                        {
                            displayBackgroundColor 
                            ?
                            <Fragment>
                                <ColorPickerPanel 
                                    alpha={80} 
                                    color={backgroundColor} 
                                    onChange={this.changeHandlerColor.bind(this, 'backgroundColor')} 
                                    mode="HSB" 
                                />
                            </Fragment>
                            :
                            null
                        }
                </div>
                <div className="full-width">
                    <p>{lang.font_size}</p>
                        <input 
                            className="slidecontainer" 
                            type="range" 
                            name="cartFontSize"
                            value={cartFontSize} 
                            min={rangeFontSizeMin}
                            max={rangeFontSizeMax}
                            onChange={this.handleChangeValue} 
                        />
                </div>
            </div>
        );
    }
}