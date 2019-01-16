import React, { Component, Fragment } from 'react';
import {fontFamilyOptions, fontStyleOptions, rangeFontSizeMin, rangeFontSizeMax} from "../../constants";
import { Panel as ColorPickerPanel } from 'rc-color-picker';
import 'rc-color-picker/assets/index.css';
import classNames from 'classnames'

export default class OldPrice extends Component {
    constructor(props) {
        super(props);

        this.handleOutsideClick = this.handleOutsideClick.bind(this);
        this.handleClick = this.handleClick.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.changeHandlerColor = this.changeHandlerColor.bind(this, 'titleFontColor');
        this.toggle = this.toggle.bind(this);

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

    toggle (event) {
        this.props.handleChangeToggle(event.target.dataset.index);
    }

    render (){
        const {titleFontFamily, titleFontStyle, titleFontSize, titleFontColor, validates, title} = this.props;
        const {displayFontColor} = this.state;
        return (
            <div className="full-width display-block">
                <p data-index="title" className={(title ? 'active-dropdown btn-block left-side__title' : 'btn-block left-side__title')} onClick={this.toggle}>{lang.title}</p>
                <div className={(title ? 'left-side__control' : 'collapse')}>
                    <div className="full-width display-block">
                        <div className="form-group">
                            <p>{lang.font_family}</p>
                            <select
                                name="titleFontFamily"
                                className="form-control"
                                onChange={this.handleChangeValue}
                                value={titleFontFamily}
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
                                name="titleFontStyle"
                                className="form-control"
                                onChange={this.handleChangeValue}
                                value={titleFontStyle}
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
                            value={titleFontColor}
                            onChange={this.handleChangeValue}
                            onClick={this.handleClick}
                            name="titleFontColor"
                            className={classNames('form-control', validates.titleFontColor)}
                            onBlur={this.handleClose}
                        />
                        {
                            displayFontColor
                            ?
                            <Fragment>
                                <ColorPickerPanel
                                    alpha={80}
                                    color= {titleFontColor}
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
                            className="slider"
                            type="range"
                            name="titleFontSize"
                            value={titleFontSize}
                            min={rangeFontSizeMin}
                            max={rangeFontSizeMax}
                            onChange={this.handleChangeValue}
                        />
                    </div>
                </div>
            </div>
        );
    }
}
