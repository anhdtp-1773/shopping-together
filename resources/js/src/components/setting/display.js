import React, {Component } from 'react';
import 'rc-color-picker/assets/index.css';
import {rangeProductQuantityMin, rangeProductQuantityMax} from "../../constants";

export default class Display extends Component {
    constructor(props) {
        super(props);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.toggle = this.toggle.bind(this);
    }

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value);
    };

    toggle (event) {
        this.props.handleChangeToggle(event.target.dataset.index);
    }

    render () {
        const {showProductQty, display} = this.props;
        return (
            <div className="full-width display-block">
                <div data-index="display" className='btn-block left-side__title' onClick={this.toggle}>
                  <span>{lang.display}</span>
                  <span><i className={(display ? 'hide' : 'appear fa fa-plus')} aria-hidden="true"></i></span>
                  <span><i className={(display ? 'appear fa fa-minus' : 'hide')} aria-hidden="true"></i></span>
                </div>
                <div className={(display ? 'left-side__control' : 'collapse')}>
                    <div>
                        <p>{lang.show}</p>
                        <label className="check-product">
                          <input type="checkbox" />
                          <span className="left-side__checkbox-title">{lang.allow_on_pcs}</span>
                          <span className="checkmark"></span>
                        </label>

                        <label className="check-product">
                          <input type="checkbox"/>
                          <span className="left-side__checkbox-title">{lang.allow_on_mobile_devices}</span>
                          <span className="checkmark"></span>
                        </label>
                    </div>
                    <div className="left-side__product-group">
                        <p>{lang.products_to_group}</p>
                        <input
                            type="range"
                            name="showProductQty"
                            className="slider"
                            value={showProductQty}
                            min={rangeProductQuantityMin}
                            max={rangeProductQuantityMax}
                            onChange={this.handleChangeValue}
                        />
                        <span>{showProductQty}</span>
                    </div>
                </div>
            </div>
        );
    }
}
