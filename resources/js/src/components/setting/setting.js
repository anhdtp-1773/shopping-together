import React, { Component, Fragment } from 'react';
import Preview from './preview';
import ProductName from './productName';
import TotalAmount from './totalAmount';
import NewPrice from './newPrice';
import OldPrice from './oldPrice';
import Title from './title';
import Cart from './cart';
import Translation from './translation';
import Display from './display';
import ClassNames from 'classnames'
import Notification from '../notification';

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
                    <Fragment>
                        <Title 
                            
                        />
                   
                        <ProductName 
                        />
                    
                        <TotalAmount 
                            />
                           
                        <NewPrice 
                        />
                    
                        <OldPrice 
                        />
                    
                        <Cart 
                        />
                    
                        <Translation 
                        />
                    
                        <Display 
                        />
                        
                    </Fragment>
                    <p>{lang.design_and_support_by_hamsa_technology}</p>
                    <a>{lang.user_guide}</a>
                    <p
                    >
                        {lang.help}
                    </p>
                    <button
                        href="javascript:void(0);" 
                        onClick ={this.onSubmit.bind(this)} 
                        className={ClassNames({'pos-button': true}, {'disabled-form' : !display}, {'disabled-form': !disabledOnClick})}
                    >
                        {lang.save}
                    </button>
                </div>
                <div className="right-container">
                    <Preview />
                </div>
                {
                message 
                ?
                <Notification 
                    content = {message}
                />
                :
                null
            }
           </div>
        );
    }
}