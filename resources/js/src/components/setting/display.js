import React, {Component } from 'react';
import 'rc-color-picker/assets/index.css';
import {rangeProductQuantityMin, rangeProductQuantityMax} from "../../constants";
import classNames from 'classnames'

export default class Display extends Component {
    constructor(props) {
        super(props);
        this.handleChangeValue = this.handleChangeValue.bind(this);
    }

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value)
    };

    render() {
        const{showProductQty, productImageWidth, productImageHeight, validates} = this.props;
        return (
            <div className="full-width display-block">
                <p> {lang.display}</p>
                <div className="full-width display-block">
                    <p>{lang.show}</p>
                    <div>
                        <input type="checkbox"/>
                        <span>{lang.allow_on_pcs}</span>
                    </div>
                    <div>
                        <input type="checkbox"/>
                        <span>{lang.allow_on_mobile_devices}</span>
                    </div>
                </div>
                <div>
                    <p>{lang.products_to_group}
                        <input 
                            type="range" 
                            name="showProductQty"
                            className="form-control" 
                            value={showProductQty} 
                            min={rangeProductQuantityMin}
                            max={rangeProductQuantityMax}
                            onChange={this.handleChangeValue} 
                        />
                    </p>
                </div>

                <div>
                    <p>{lang.product_image_size}
                        <input 
                            type="text"
                            name="productImageWidth"
                            value={productImageWidth} 
                            onChange={this.handleChangeValue}
                            className={classNames('form-control', validates.productImageWidth)}
                        />
                        <span>{lang.width}</span>
                    </p>
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
        );
    }
}

