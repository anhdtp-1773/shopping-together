import React, { Component, Fragment } from 'react';
import Pagination from "react-js-pagination";
import * as _ from "lodash";
import classNames from 'classnames'
import api from './../../../api';

export default class RelatedProduct extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            idProducts: [],
            relatedProduct: '',
            products: [],
            itemsPerPage: '',
            totalItems: '',
            isFetching: true,
            msg: '',
        }
        this.handlePageChange = this.handlePageChange.bind(this);
        this.onChangeKeyWord = this.onChangeKeyWord.bind(this);
        this.onSearchProduct =  _.debounce(this.onSearchProduct, 500);    
    }

    componentWillMount () {
        if(this.props.keyWord){
            this.onSearchProduct(this.props.keyWord, this.props.currentPage);
        }else{
            this.getListProduct(this.props.currentPage);
        }   
    }

    async getListProduct (currentPage) {
        const response = await api.getProducts(currentPage);
        const result = JSON.parse(response.text);
        if(result.status){
            this.props.onChangeValue('relatedCurrentPage', result.data.current_page);
            this.setState({ 
                itemsPerPage: result.data.items_per_page,
                totalItems: result.data.total_items,
                products: result.data.items,
                isFetching: false,
            });
        }
    }

    onSelectRelatedProduct (id) {
        let index = this.state.idProducts.indexOf(id);
        let idProducts = this.state.idProducts;
        index >= 0 ? idProducts.splice(index, 1) : idProducts.push(id);
        this.setState({
            idProducts: idProducts,
        })
        let products = _.filter(this.state.products, function(product) { return idProducts.indexOf(product.id) >= 0});
        this.setState({
            relatedProduct: _.head(products),
        })
        this.props.onSelectRelatedProduct(products)
    }

    nextStep (step) {
        if(step == 3){
            if(!this.state.relatedProduct){
                alert(lang.please_select_at_least_one_product)
            }else{
                this.props.nextStep(step);
            }
        }else{
            this.props.nextStep(step);
        }
    }

    handlePageChange (currentPage) {
        this.setState({
            isFetching: true
        })
        this.props.onChangeValue('relatedCurrentPage', currentPage);
        if(this.props.keyWord){
            this.onSearchProduct(this.props.keyWord, currentPage);
        }else{
            this.getListProduct(currentPage);
        }   
    }

    onChangeKeyWord (event) {
        this.props.onChangeValue('relatedKeyWord', event.target.value)
        this.onSearchProduct(event.target.value);
    }

    async onSearchProduct (keyWord, currentPage = null) {
        this.setState({
            isFetching: true,
        })
        if(keyWord != ''){
            const response = await api.searchProduct(keyWord, currentPage);
            const result = JSON.parse(response.text);
            if(result.status){
                this.props.onChangeValue('relatedCurrentPage', result.data.current_page);
                this.setState({
                    itemsPerPage: result.data.items_per_page,
                    totalItems: result.data.total_items,
                    products: result.data.items,
                    isFetching: false,
                });
            }else{
                this.setState({
                    msg: result.message,
                    products: '',
                    itemsPerPage: result.data.items_per_page,
                    totalItems: result.data.total_items,
                    isFetching: false,
                })
            }
        }else{
            this.getListProduct('');
        }
    }

    render() {
        const {currentPage, msg, keyWord, idMainProduct} = this.props;
        const {idProducts, products, itemsPerPage, totalItems, isFetching} = this.state;
        if(isFetching){ return (
            <div id="page_loading">
                <div className="loading">
                    <i className="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom" />
                </div>
            </div>
        )}else {
            return (
                <div className="container">
                    <div className="form-group product-search-wrap section-manage">
                        <label className="title-search-product" htmlFor="formGroupExampleInput">{lang.select_relected_product}</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            placeholder={lang.search} 
                            onChange={this.onChangeKeyWord}
                            value = {keyWord}
                        />
                    </div>
                    {
                        products
                        ?
                            <div className="row">
                                {products.map((product, i)=>(
                                    <span className={classNames('col-sm-6 col-md-3 product-wrap', {'disabled-form': idMainProduct == product.id ? true : false})} key={i} onClick={this.onSelectRelatedProduct.bind(this, product.id)}>
                                        <div className={classNames('thumbnail', {'disabled-form  product-step2': idMainProduct == product.id ? true : false})}>
                                            <img src={product.src} alt="..." />
                                            <div className="check-product">
                                                <input type="checkbox" name="vehicle3" checked = {idProducts.indexOf(product.id) >= 0} />
                                                <span class="checkmark"></span>
                                            </div>
                                            <div className="caption">
                                                <h5 className="split-title-product">{product.title}</h5>
                                                <p>{product.price}</p>
                                            </div>
                                        </div>
                                    </span>
                                ))}
                            </div>
                        :
                            <p>{msg}</p>
                    }
                    
                    <Fragment>
                        <div className="pagination-wrap">
                            <Pagination
                                activePage={currentPage}
                                itemsCountPerPage={itemsPerPage}
                                totalItemsCount={totalItems}
                                pageRangeDisplayed={5}
                                onChange={this.handlePageChange}
                            />
                            <button onClick={this.nextStep.bind(this, 3)} type="button" class="btn btn-primary" style={{float:"right"}}>{lang.next}</button>
                            <button onClick={this.nextStep.bind(this, 1)} type="button" class="btn btn-primary" style={{float:"right"}}>{lang.back}</button>
                        </div>
                    </Fragment> 
                </div>
            );
        }
    }
}