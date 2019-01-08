import React, { Component, Fragment } from 'react';
import {fontFamilyOptions, fontStyleOptions, rangeFontSizeMin, rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class ProductName extends Component {
    constructor(props) {
        super(props);

        this.handleOutsideClick = this.handleOutsideClick.bind(this);
        this.handleClick = this.handleClick.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.changeHandlerColor = this.changeHandlerColor.bind(this, 'productFontColor');

        this.state = {
            displayFontColor: false,
        };
    }

    handleClick()
    {
        if (!this.state.displayFontColor) {
            document.addEventListener('click', this.handleOutsideClick, false);
        } else {
            document.removeEventListener('click', this.handleOutsideClick, false);
        }
        this.setState({
            displayFontColor: !this.state.displayFontColor,
        })
    }

    handleOutsideClick(e) {
        if (this.node.contains(e.target)) {
          return;
        }
        
        this.handleClick();
    }

    changeHandlerColor (name, colors) {
        this.props.handleChangeValue(name, colors.color)
    };
    
    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value)
    };
    render(){
        const {productFontFamily,productFontStyle,productFontSize,productFontColor, validates} = this.props;
        const {displayFontColor} = this.state;
        return (
            <div className="full-width display-block">
                <p> {lang.product_name}</p>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_family}</p>
                        <select 
                            name = "productFontFamily"
                            className="form-control" 
                            onChange = {this.handleChangeValue}
                            value =  {productFontFamily} 
                        >
                            {fontFamilyOptions.map((value, i) =>
                                <option key={i} value={value.value}>{value.label}</option>
                            )}
                        </select>
                    </div>
                </div>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_style}</p>
                        <select 
                            name = "productFontStyle"
                            className="form-control" 
                            onChange = {this.handleChangeValue}
                            value =  {productFontStyle}
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
                        style={{ backgroundColor: productFontColor }} 
                        value={productFontColor} 
                        onChange={this.handleChangeValue} 
                        onClick={this.handleClick}
                        name="productFontColor"
                        className={classNames('form-control', validates.productFontColor)}
                        onBlur={this.handleClose}
                    />
                    {
                        displayFontColor 
                        ?
                        <Fragment>
                            <ColorPickerPanel 
                                alpha={80} 
                                color= {productFontColor} 
                                onChange={this.changeHandlerColor} 
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
                        name = "productFontSize"
                        value={productFontSize} 
                        min = {rangeFontSizeMin}
                        max = {rangeFontSizeMax}
                        onChange={this.handleChangeValue} 
                    />
                </div>
            </div>
        );
    }
}