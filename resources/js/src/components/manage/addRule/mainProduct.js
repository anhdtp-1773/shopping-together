import React, { Component, Fragment } from 'react';
import Pagination from "react-js-pagination";


export default class MainProduct extends Component {
    constructor(){
        super(...arguments);
        this.state = {

        }
    }

    handleChangeValue = (event) =>{
        this.props.handleChangeValue(event.target.name, event.target.value);
    }
    
    onSearchProduct = (event) => {
        _.debounce(this.props.onSearchProduct(event.target.value), 500);
    }

    render() {
        const {currentPage, itemsPerPage, totalItems, products} = this.props;
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

                <div className="row">
                    {products.map((product)=>(
                        <div className="col-sm-6 col-md-3">
                            <div className="thumbnail">
                                <img src="https://cdn.shopify.com/s/files/1/0014/9988/9775/products/10446026_348247681989429_3852309148307758203_o.jpg?v=1545359213" alt="..." />
                                <input type="checkbox" defaultValue />
                                <div className="caption">
                                <h3>{product.title}</h3>
                                <p>$30</p>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>

                <Pagination
                    activePage={currentPage}
                    itemsCountPerPage={itemsPerPage}
                    totalItemsCount={totalItems}
                    pageRangeDisplayed={5}
                    onChange={this.props.handlePageChange}
                />

                <button type="button" class="btn btn-primary" style={{float:"right"}}>{lang.next}</button>
                
            </div>
        );
    }
}