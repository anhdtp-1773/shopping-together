import React, { Component, Fragment } from 'react';
import {fontFamilyOptions, fontStyleOptions, rangeFontSizeMin, rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class NewPrice extends Component {
    constructor(props) {
        super(props);
        this.state = {
            displayFontColor: false,
        };
    }
    handleClick(event){
        switch(event.target.name) {
            case 'newPriceFontColor':
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
        const {newPriceFontFamily, newPriceFontStyle, newPriceFontSize, newPriceFontColor, validates} = this.props;
        const {displayFontColor} = this.state;
        return (
            <div className="full-width display-block">
                <p> {lang.sale_price}</p>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_family}</p>
                        <select 
                            name = "newPriceFontFamily"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {newPriceFontFamily} 
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
                            name = "newPriceFontStyle"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {newPriceFontStyle}
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
                        style={{ backgroundColor: newPriceFontColor }} 
                        value={newPriceFontColor} 
                        onChange={this.handleChangeValue.bind(this)} 
                        onClick={this.handleClick.bind(this)}
                        name="newPriceFontColor"
                        className={classNames('form-control', validates.newPriceFontColor)}
                    />
                    {
                        displayFontColor 
                        ?
                        <Fragment>
                            <ColorPickerPanel 
                                alpha={80} 
                                color= {newPriceFontColor} 
                                onChange={this.changeHandlerColor.bind(this, 'newPriceFontColor')} 
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
                        name = "newPriceFontSize"
                        value ={newPriceFontSize} 
                        min = {rangeFontSizeMin}
                        max = {rangeFontSizeMax}
                        onChange={this.handleChangeValue.bind(this)} 
                    />
                </div>
            </div>
        );
    }
}