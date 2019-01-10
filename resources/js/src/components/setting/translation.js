import React, { Component } from 'react';
import classNames from 'classnames'

export default class Translation extends Component {
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
        const{cartText, productText, validates, translation} = this.props;
        return (
            <div className="full-width display-block">
                <p data-index="translation" className="btn btn-block" onClick={this.toggle}>{lang.translation}</p>
                <div className={(translation ? '' : 'collapse')}> 
                    <div className="full-width display-block">
                        <div>
                            <p>{lang.add_bundle_to_cart}</p>
                            <input 
                                type="text" 
                                value={cartText} 
                                onChange={this.handleChangeValue} 
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
                                onChange={this.handleChangeValue} 
                                name="productText"
                                className={classNames('form-control', validates.productText)}
                                placeholder={lang.frequentle_purchased_products}
                            />
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}