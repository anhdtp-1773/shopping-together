import React, { Component } from 'react';

export default class TotalAmount extends Component {
    constructor(props) {
        super(props);
        this.state = {
            displayFontColor: false,
        };
    }

    handleClick(event){
        switch(event.target.name) {
            case 'amountFontColor':
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
        this.props.changeHandlerColor(name, colors)
    };
    
    handleChangeColor(event){
        this.props.handleChangeColor(event.target.name, event.target.value)
    }

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
                            name = "amountFontFamily"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {amountFontFamily} 
                        >
                            {fontFamilyOptions.map((value) =>
                                <option value={value.value}>{value.label}</option>
                            )}
                        </select>
                    </div>
                </div>
                <div className="full-width display-block">
                    <div className="form-group">
                        <p>{lang.font_style}</p>
                        <select 
                            name = "amountFontStyle"
                            className="form-control" 
                            onChange = {this.handleChangeValue.bind(this)}
                            value =  {amountFontStyle}
                        >
                            {fontStyleOptions.map((value) =>
                                <option value={value.value}>{value.label}</option>
                            )}
                        </select>
                    </div>
                </div>
                <div className="full-width">
                    <p>{lang.font_color}</p>
                    <input 
                        type="text" 
                        style={{ backgroundColor: amountFontColor }} 
                        value={amountFontColor} 
                        onChange={this.handleChangeColor.bind(this)} 
                        onClick={this.handleClick.bind(this)}
                        name="amountFontColor"
                        className={classNames('form-control', validates.amountFontColor)}
                    />
                    {
                        displayFontColor 
                        ?
                        <Fragment>
                            <ColorPickerPanel 
                                alpha={80}
                                color= {amountFontColor} 
                                onChange={this.changeHandlerColor.bind(this, 'amountFontColor')} 
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
                        name = "amountFontSize"
                        value={amountFontSize} 
                        min = {rangeFontSizeMin}
                        max = {rangeFontSizeMax}
                        onChange={this.handleChangeValue.bind(this)} 
                    />
                </div>
            </div>
        );
    }
}