import React, { Component } from 'react';
import Preview from './preview';
import ProductName from './productName';
import TotalAmount from './totalAmount';
import NewPrice from './newPrice';
import OldPrice from './oldPrice';
import Title from './title';
import Cart from './cart';
import Translation from './translation';
import Display from './display';

export default class Setting extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }

    render() {
        return (
            <div className="home-container">
                <div className="left-container">
                    <div>
                        <Title 
                        />
                    </div>
                    <div>
                        <ProductName 
                        />
                    </div>
                    <div>
                        <TotalAmount 
                            />
                    </div>
                    <div>        
                        <NewPrice 
                        />
                    </div>
                    <div>
                        <OldPrice 
                        />
                    </div>
                    <div>
                        <Cart 
                        />
                    </div>
                    <div>
                        <Translation 
                        />
                    </div>
                    <div>
                        <Display 
                        />

                    </div>
                    <span>{lang.design_and_support_by_hamsa_technology}</span>
                    <p>{lang.user_guide}</p>
                    <p>{lang.help}</p>
                    <a>{lang.save}</a>
                </div>
                <div className="right-container">
                    <Preview />
                </div>
           </div>
        );
    }
}