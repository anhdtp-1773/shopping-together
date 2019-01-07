import React, { Component } from 'react';
import classNames from 'classnames'

export default class Translation extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }

    handleChangeValue  = (event) => {
        this.props.handleChangeValue(event.target.name, event.target.value)
    };
    render() {
        const{cartText, productText, validates} = this.props;
        return (
            <div>
                <p>{lang.translation}</p>
                <div className="text-color full-width">
                    <div>
                        <p>{lang.add_bundle_to_cart}</p>
                        <input 
                            type="text" 
                            value={cartText} 
                            onChange={ this.handleChangeValue.bind(this) } 
                            name="cartText"
                            className={classNames('form-control', validates.cartText)}
                            placeholder={lang.add_bundle_to_cart}
                        />
                    </div>
                    
                    <div>
                        <p>{lang.frequentle_purchased_products}</p>
                        <input 
                            type="text" 
                            value={productText} 
                            onChange={ this.handleChangeValue.bind(this) } 
                            name="productText"
                            className={classNames('form-control', validates.productText)}
                            placeholder={lang.frequentle_purchased_products}
                        />
                    </div>
                </div>
            </div>
        );
    }
}