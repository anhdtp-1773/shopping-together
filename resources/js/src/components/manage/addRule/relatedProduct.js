import React, { Component, Fragment } from 'react';
import Pagination from "react-js-pagination";
import * as _ from "lodash";

export default class RelatedProduct extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            idProducts: [],
            relatedProduct: '',
        }
    }

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value);
    }

    onSearchProduct (event) {
        this.props.onSearchProduct(event.target.value);
    }

    onSelectRelatedProduct (id) {
        let idProducts = this.state.idProducts.concat(id);
        this.setState({
            idProducts: idProducts,
        })
        let products = _.filter(this.props.products, function(product) { return idProducts.indexOf(product.id) >= 0});
        this.setState({
            relatedProduct: _.head(products),
        })
        this.props.onSelectRelatedProduct(products)
    }

    nextStep (step) {
        if(!this.state.relatedProduct){
            alert(lang.please_select_at_least_one_product)
        }else{
            this.props.nextStep(step);
        }
    }

    render() {
        const {currentPage, itemsPerPage, totalItems, products, isSearchProduct, msg} = this.props;
        const {idProducts} = this.state;
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
                            onChange={this.handleChangeValue.bind(this)}
                        />
                    </div>
                </div>
    
                <div className="form-group">
                    <label htmlFor="formGroupExampleInput">{lang.select_relected_product}</label>
                    <input 
                        type="text" 
                        className="form-control" 
                        placeholder={lang.search} 
                        onChange={this.onSearchProduct.bind(this)}
                    />
                </div>
                {
                    products
                    ?
                        <div className="row">
                            {products.map((product)=>(
                                <span className="col-sm-6 col-md-2" onClick={this.onSelectRelatedProduct.bind(this, product.id)}>
                                    <div className="thumbnail">
                                        <img src={product.src} alt="..." />
                                        <input type="checkbox" name="vehicle3" checked = {idProducts.indexOf(product.id) >= 0} />
                                        <div className="caption">
                                        <h5>{product.title}</h5>
                                        <p>{product.price}</p>
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
                        <button onClick={this.nextStep.bind(this, 3)} type="button" class="btn btn-primary" style={{float:"right"}}>{lang.next}</button>
                        <button onClick={this.nextStep.bind(this, 1)} type="button" class="btn btn-primary" style={{float:"right"}}>{lang.back}</button>
                    </Fragment> 
                }
            </div>
        );
    }
}