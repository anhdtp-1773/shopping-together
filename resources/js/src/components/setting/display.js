import React, {Component } from 'react';
import 'rc-color-picker/assets/index.css';
import {rangeProductQuantityMin, rangeProductQuantityMax} from "../../constants";
import classNames from 'classnames'

export default class Display extends Component {
    constructor(props) {
        super(props);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.toggle = this.toggle.bind(this);
    }

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value)
    };

    toggle (event) {
        this.props.handleChangeToggle(event.target.dataset.index);
    }

    render () {
        const{showProductQty, productImageWidth, productImageHeight, validates, display} = this.props;
        return (
            <div className="full-width display-block">
                <p data-index="display" className={(display ? 'active-dropdown btn-block left-side__title' : 'btn-block left-side__title')} onClick={this.toggle}>{lang.display}</p>
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
                    </div>

                    <div className="left-side__product-img-size">
                      <p>{lang.product_image_size}</p>
                      <div>
                        <input
                              type="text"
                              name="productImageWidth"
                              value={productImageWidth}
                              onChange={this.handleChangeValue}
                              className={classNames('form-control', validates.productImageWidth)}
                          />
                          <span>{lang.width}</span>
                      </div>
                      <div>
                          <input
                              type="text"
                              name="productImageHeight"
                              value={productImageHeight}
                              onChange={this.handleChangeValue}
                              className={classNames('form-control', validates.productImageHeight)}
                          />
                          <span>{lang.height}</span>
                      </div>
                    </div>

                </div>
            </div>
        );
    }
}
