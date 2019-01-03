import React, { Component, Fragment } from 'react';
import MainProduct from './mainProduct';
import api from './../../../api';
import RelatedProduct from './relatedProduct';

export default class AddRule extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            form: {
                ruleName: '',
                products: {}
            },
            currentPage: '',
            itemsPerPage: '',
            totalItems: '',
            isFetching: true,
            msg: '',
            mainProduct: {},
            step: 1,
            relatedProducts: [],
            idMainProduct: '',
            keyWord: '',
        }
    }

    async componentWillMount () {
        this.getListProduct(this.state.currentPage);
    }

    handlePageChange (currentPage) {
        this.setState({
            currentPage: currentPage,
            isFetching: true,
        })
        if(this.state.keyWord){
            this.onSearchProduct(this.state.keyWord, currentPage);
        }else{
            this.getListProduct(currentPage);
        }   
    }

    async getListProduct (currentPage) {
        const response = await api.getProducts(currentPage);
        const result = JSON.parse(response.text);
        if(result.status){
            this.setState({ 
                currentPage: result.data.current_page,
                itemsPerPage: result.data.items_per_page,
                totalItems: result.data.total_items,
                form: Object.assign({}, this.state.form, {
                    products: result.data.items
                }),
                isFetching: false,
            });
        }
    }

    handleChangeValue (name, value) {
        this.setState({
            form: Object.assign({}, this.state.form, {
                [name]: value
            }),
        })
    }   
    
    async onSearchProduct (keyWord, currentPage = null) {
        if(keyWord != ''){
            this.setState({
                keyWord: keyWord
            })
            const response = await api.searchProduct(keyWord, currentPage);
            const result = JSON.parse(response.text);
            if(result.status){
                this.setState({
                    currentPage: result.data.current_page,
                    itemsPerPage: result.data.items_per_page,
                    totalItems: result.data.total_items,
                    form: Object.assign({}, this.state.form, {
                        products: result.data.items
                    }),
                    isFetching: false,
                });
            }else{
                this.setState({
                    msg: result.message,
                    form: Object.assign({}, this.state.form, {
                        products: ''
                    }),
                })
            }
        }else{
            this.getListProduct('');
        }
        
    }

    onSelectMainProduct (products) {
        this.setState({
            mainProduct: _.head(products),
        })
    } 
    
    onChangeIdMainProduct (idProduct) {
        this.setState({
            idMainProduct: idProduct
        })
    }

    onSelectRelatedProduct (products) {
        let relatedProducts = [];
        products.map((product) => {
            if((_.findIndex(relatedProducts, function(o) { return o.id== product.id; })) == -1){
                relatedProducts.push(product);
            }
        })
        this.setState({
            relatedProducts: relatedProducts,
        })
        
    }

    componentDidMount () {
        this.onSearchProduct =  _.debounce(this.onSearchProduct, 500);      
    }

    nextStep (step) {
        this.setState({
            step: step
        })
    }

    render() {
        const {isFetching, form, currentPage, itemsPerPage, totalItems, msg, step, idMainProduct, mainProduct, relatedProducts, keyWord} = this.state;
        if(isFetching){ return (
            <div id="page_loading">
                <div className="loading">
                    <i className="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom" />
                </div>
            </div>
        )}else {
            return (
                <Fragment>
                    <div>
                        {
                            step == 1
                            ?
                                <MainProduct
                                    products = {form.products}
                                    currentPage = {currentPage}
                                    itemsPerPage = {itemsPerPage}
                                    totalItems = {totalItems}
                                    handlePageChange = {this.handlePageChange.bind(this)}
                                    handleChangeValue = {this.handleChangeValue.bind(this)}
                                    onSearchProduct = {this.onSearchProduct.bind(this)}
                                    msg = {msg}
                                    onSelectMainProduct = {this.onSelectMainProduct.bind(this)}
                                    nextStep = {this.nextStep.bind(this)}
                                    onChangeIdMainProduct = {this.onChangeIdMainProduct.bind(this)}
                                    idMainProduct = {idMainProduct}
                                    keyWord = {keyWord}
                                />
                            :
                                null
                        }
                    </div>
                    <div>
                        {
                            step == 2
                            ?
                                <RelatedProduct 
                                    products = {form.products}
                                    currentPage = {currentPage}
                                    itemsPerPage = {itemsPerPage}
                                    totalItems = {totalItems}
                                    handlePageChange = {this.handlePageChange.bind(this)}
                                    handleChangeValue = {this.handleChangeValue.bind(this)}
                                    onSearchProduct = {this.onSearchProduct.bind(this)}
                                    msg = {msg}
                                    onSelectRelatedProduct = {this.onSelectRelatedProduct.bind(this)}
                                    nextStep = {this.nextStep.bind(this)}
                                />
                            :
                                null
                        }
                    </div>
                </Fragment>
            );
        }
    }
}