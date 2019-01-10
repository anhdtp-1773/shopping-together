import React, { Component, Fragment } from 'react';
import {fontFamilyOptions, fontStyleOptions, rangeFontSizeMin, rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class TotalAmount extends Component {
    constructor(props) {
        super(props);

        this.handleOutsideClick = this.handleOutsideClick.bind(this);
        this.handleClick = this.handleClick.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.changeHandlerColor = this.changeHandlerColor.bind(this, 'amountFontColor');

        this.state = {
            displayFontColor: false,
        };
    }

    handleClick () {
        if (!this.state.displayFontColor) {
            document.addEventListener('click', this.handleOutsideClick, false);
        } else {
            document.removeEventListener('click', this.handleOutsideClick, false);
        }
        this.setState({
            displayFontColor: !this.state.displayFontColor,
        })
    }

    handleOutsideClick (e) {
        if (this.node.contains(e.target)) {
          return;
        }
        this.handleClick ();
    }

    changeHandlerColor (name, colors) {
        this.props.handleChangeValue(name, colors.color)
    };

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value)
    };
    
    render(){
        const {amountFontFamily, amountFontStyle, amountFontSize, amountFontColor, validates} = this.props;
        const {displayFontColor} = this.state;
        return (
            <div className="full-width display-block">
                <p> {lang.total_amount}</p>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_family}</p>
                        <select 
                            name="amountFontFamily"
                            className="form-control" 
                            onChange={this.handleChangeValue}
                            value={amountFontFamily} 
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
                            name="amountFontStyle"
                            className="form-control" 
                            onChange={this.handleChangeValue}
                            value={amountFontStyle}
                        >
                            {fontStyleOptions.map((value, i) =>
                                <option key={i} value={value.value}>{value.label}</option>
                            )}
                        </select>
                    </div>
                </div>
                <div className="full-width" ref={node => { this.node = node; }}>
                    <p>{lang.font_color}</p>
                    <input 
                        type="text" 
                        style={{ backgroundColor: amountFontColor }} 
                        value={amountFontColor} 
                        onChange={this.handleChangeValue} 
                        onClick={this.handleClick}
                        name="amountFontColor"
                        className={classNames('form-control', validates.amountFontColor)}
                        onBlur={this.handleClose}
                    />
                    {
                        displayFontColor 
                        ?
                        <Fragment>
                            <ColorPickerPanel 
                                alpha={80}
                                color={amountFontColor} 
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
                        name="amountFontSize"
                        value={amountFontSize} 
                        min={rangeFontSizeMin}
                        max={rangeFontSizeMax}
                        onChange={this.handleChangeValue} 
                    />
                </div>
            </div>
        );
    }
}