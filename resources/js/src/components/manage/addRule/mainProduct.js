import React, { Component, Fragment } from 'react';
import Pagination from "react-js-pagination";
import * as _ from "lodash";

export default class MainProduct extends Component {

    handleChangeValue = (event) =>{
        this.props.handleChangeValue(event.target.name, event.target.value);
    }
    
    onSearchProduct = (event) => {
        this.props.onSearchProduct(event.target.value);
    }

    onSelectProduct(id){
        let product = _.filter(this.props.products, function(product) { return product.id == id; });
        this.props.onSelectProduct(product);
    }

    render() {
        const {currentPage, itemsPerPage, totalItems, products, isSearchProduct, msg} = this.props;
        return (
            <div className="container">
                <div className="form-inline">
                    <div className="form-group mb-2">
                        <span>{lang.set_the_rule_name}</span>
                    </div>
                    <div className="form-group mx-sm-3 mb-2">
                        <input 
                            type="text"
                            name="ruleName" 
                            className="form-control" 
                            placeholder={lang.rule} 
                            onChange={this.handleChangeValue}
                        />
                    </div>
                </div>

                <div className="form-group">
                    <label htmlFor="formGroupExampleInput">{lang.choose_a_main_product}</label>
                    <input 
                        type="text" 
                        className="form-control" 
                        placeholder={lang.search} 
                        onChange={this.onSearchProduct}
                    />
                </div>
                {
                    products
                    ?
                        <div className="row">
                            {products.map((product)=>(
                                <span className="col-sm-6 col-md-3" onClick={this.onSelectProduct.bind(this, product.id)}>
                                    <div className="thumbnail">
                                        <img src="https://cdn.shopify.com/s/files/1/0014/9988/9775/products/10446026_348247681989429_3852309148307758203_o.jpg?v=1545359213" alt="..." />
                                        <div className="caption">
                                        <h3>{product.title}</h3>
                                        <p>$30</p>
                                        </div>
                                    </div>
                                </span>
                            ))}
                        </div>
                    :
                        <p>{msg}</p>
                }
                
                {
                    isSearchProduct
                    ?
                    null
                    :
                    <Fragment>
                        <Pagination
                            activePage={currentPage}
                            itemsCountPerPage={itemsPerPage}
                            totalItemsCount={totalItems}
                            pageRangeDisplayed={5}
                            onChange={this.props.handlePageChange}
                        />
                        <button type="button" class="btn btn-primary" style={{float:"right"}}>{lang.next}</button>
                    </Fragment> 
                }
            </div>
        );
    }
}