import React, { Component, Fragment } from 'react';
import {optionsFontFamily, optionsFontStyle, rangeFontSizeMin,rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';

export default class Title extends Component {
    constructor(props) {
        super(props);
        this.state = {
            displayFontColor: false,
        };
    }

    handleClick(event){
        switch(event.target.name) {
            case 'titleFontColor':
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

    changeHandlerColor = (name, colors) => {
        this.props.changeHandlerColor(name, colors)
    };
    
    handleChangeColor(event){
        this.props.handleChangeColor(event.target.name, event.target.value)
    }

    handleChangeValue  = (event) => {
        this.props.handleChangeValue(event.target.name, event.target.value)
    };

    render(){
        const {titleFontFamily,titleFontStyle,titleFontSize,titleFontColor, validates} = this.props;
        const {displayFontColor} = this.state;
        return (
            <div className="full-width display-block">
                <p> {lang.title}</p>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_family}</p>
                        <select 
                            name = "titleFontFamily"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {titleFontFamily} 
                        >
                            {optionsFontFamily.map((value) =>
                                <option value={value.value}>{value.label}</option>
                            )}
                        </select>
                    </div>
                </div>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_style}</p>
                        <select 
                            name = "titleFontStyle"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {titleFontStyle}
                        >
                            {optionsFontStyle.map((value) =>
                                <option value={value.value}>{value.label}</option>
                            )}
                        </select>
                    </div>
                </div>
                <div className="full-width">
                    <p>{lang.font_color}</p>
                    <input 
                        type="text" 
                        style={{ backgroundColor: titleFontColor }} 
                        value={titleFontColor} 
                        onChange={this.handleChangeColor.bind(this)} 
                        onClick={this.handleClick.bind(this)}
                        name="titleFontColor"
                        // className={classNames('form-control', validates.titleFontColor)}
                    />
                    {
                        displayFontColor 
                        ?
                        <Fragment>
                            <ColorPickerPanel 
                                alpha={80} 
                                color= {titleFontColor} 
                                onChange={this.changeHandlerColor.bind(this, 'titleFontColor')} 
                                mode="HSB" 
                                onBlur={ this.handleClose.bind(this) }
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
                        name = "titleFontSize"
                        value={titleFontSize} 
                        min = {rangeFontSizeMin}
                        max = {rangeFontSizeMax}
                        onChange={this.handleChangeValue.bind(this)} 
                    />
                </div>
            </div>
        );
    }
}