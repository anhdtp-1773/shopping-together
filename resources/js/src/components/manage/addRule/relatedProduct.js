import React, { Component, Fragment } from 'react';
import Pagination from "react-js-pagination";
import * as _ from "lodash";
import classNames from 'classnames'
import api from './../../../api';
import * as Validate from "../../../models/validate.model";

export default class RelatedProduct extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            products: [],
            itemsPerPage: '',
            totalItems: '',
            isFetching: true,
            msg: '',
            validates: {},
        }
        this.handlePageChange = this.handlePageChange.bind(this);
        this.onChangeKeyWord = this.onChangeKeyWord.bind(this);
        this.onSearchProduct =  _.debounce(this.onSearchProduct, 500);
        this.handleChangeValue = this.handleChangeValue.bind(this);
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

        let index = this.props.idRelatedProducts.indexOf(id);
        let idProducts = this.props.idRelatedProducts;
        if(index >= 0){
            idProducts.splice(index, 1);
        }else{
            if(idProducts.length < (this.props.showProductQty)){
                idProducts.push(id);
            }else{
                alert(lang.exceed_allowed_products_to_group)
            }
        }
        let products = _.filter(this.state.products, function(product) {
            return idProducts.indexOf(product.id) >= 0
        });
        this.props.onSelectRelatedProduct(products)
    }

    nextStep (step) {
        if(step == 3){
            if(this.props.idRelatedProducts.length == 0){
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
            this.getListProduct();
        }
    }

    handleChangeValue (event) {
        const name = event.target.name;
        const value = event.target.value;
        const {validates} = this.state;
        switch(name){
            case 'reductionPercent':
                validates[name] = Validate.isPercentage(value) ? 'valid' : 'invalid';
            break;
        }
        this.props.handleChangeValue(name, value);
    }

    render() {
        const {currentPage, msg, keyWord, idMainProduct, idRelatedProducts, reductionPercent} = this.props;
        const {products, itemsPerPage, totalItems, isFetching, validates} = this.state;
        const disabledOnClick = !_.every(_.values(validates), function(value) {return value == 'valid'});
        if(isFetching){ return (
            <div id="page_loading">
                <div className="loading">
                    <i className="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom" />
                </div>
            </div>
        )}else {
            return (
                <div className="container related-wrap">
                    <div className="discount">
                        <p>{lang.set_discount}</p>
                        <input
                            type="text"
                            className={classNames('form-control', validates.reductionPercent)}
                            name="reductionPercent"
                            placeholder={lang.discount_value}
                            onChange={this.handleChangeValue}
                            value = {reductionPercent}
                        />
                        <span className="icon-percent"><i class="fa fa-percent" aria-hidden="true"></i></span>
                    </div>
                    <div className="form-group section-manage">
                        <label className="related-search__title" htmlFor="formGroupExampleInput">{lang.select_relected_product}</label>
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
                                    <span className={classNames('col-sm-6 col-md-2 col-xs-6 product-wrap', {'disabled-form': idMainProduct == product.id ? true : false})} key={i} onClick={this.onSelectRelatedProduct.bind(this, product.id)}>
                                        <div className={classNames('thumbnail', {'disabled-form  product-step2': idMainProduct == product.id ? true : false})}>
                                            <img className="img-main-product" src={product.src} alt="..." />
                                            <div className="check-product">
                                                <input
                                                    type="checkbox"
                                                    name="vehicle3"
                                                    checked = {(_.find(idRelatedProducts, function(id) { return id == product.id})) ? true : false} />
                                                <span className="checkmark"></span>
                                            </div>
                                            <div className="caption">
                                                <h5 className="split-title-product">{product.title}</h5>
                                                <p>{product.price+ " " + product.currency}</p>
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
                            <button
                                onClick={this.nextStep.bind(this, 3)}
                                type="button"
                                className={classNames({'btn btn-primary btn-next-step': true}, {'disabled-form': disabledOnClick})}
                            >
                                {lang.next}
                            </button>
                            <button
                                onClick={this.nextStep.bind(this, 1)}
                                type="button"
                                className={classNames({'btn btn-primary btn-back-step': true}, {'disabled-form': disabledOnClick})}
                            >
                                {lang.back}
                            </button>
                        </div>
                    </Fragment>
                </div>
            );
        }
    }
}
