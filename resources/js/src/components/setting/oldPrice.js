import React, { Component, Fragment } from 'react';
import {fontFamilyOptions, fontStyleOptions, rangeFontSizeMin, rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class OldPrice extends Component {
    constructor(props) {
        super(props);
        this.state = {
            displayFontColor: false,
        };
    }
    handleClick(event){
        switch(event.target.name) {
            case 'oldPriceFontColor':
                this.setState({
                    displayFontColor: !this.state.displayFontColor,
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
        const {oldPriceFontFamily, oldPriceFontStyle, oldPriceFontSize, oldPriceFontColor, validates} = this.props;
        const {displayFontColor} = this.state;
        return (
            <div className="full-width display-block">
                <p> {lang.original_price}</p>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_family}</p>
                        <select 
                            name = "oldPriceFontFamily"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {oldPriceFontFamily} 
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
                            name = "oldPriceFontStyle"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {oldPriceFontStyle}
                        >
                            {fontStyleOptions.map((value, i) =>
                                <option key={i} value={value.value}>{value.label}</option>
                            )}
                        </select>
                    </div>
                </div>
                <div className="full-width">
                    <p>{lang.font_color}</p>
                    <input 
                        type="text" 
                        style={{ backgroundColor: oldPriceFontColor }} 
                        value={oldPriceFontColor} 
                        onChange={this.handleChangeValue.bind(this)} 
                        onClick={this.handleClick.bind(this)}
                        name="oldPriceFontColor"
                        className={classNames('form-control', validates.oldPriceFontColor)}
                    />
                    {
                        displayFontColor 
                        ?
                        <Fragment>
                            <ColorPickerPanel 
                                alpha={80} 
                                color= {oldPriceFontColor} 
                                onChange={this.changeHandlerColor.bind(this, 'oldPriceFontColor')} 
                                mode="HSB" 
                                onBlur={this.handleClose.bind(this) }
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
                        name = "oldPriceFontSize"
                        value ={oldPriceFontSize} 
                        min = {rangeFontSizeMin}
                        max = {rangeFontSizeMax}
                        onChange={this.handleChangeValue.bind(this)} 
                    />
                </div>
            </div>
        );
    }
}