import React, { Component, Fragment } from 'react';
import MainProduct from './mainProduct';
import api from './../../../api';
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
            isSearchProduct: false,
            msg: '',
            cartProduct: [],
        }
    }

    async componentWillMount(){
        this.getListProduct(this.state.currentPage);
    }

    handlePageChange = (currentPage) => {
        this.setState({
            currentPage: currentPage,
            isFetching: true,
        })
        this.getListProduct(currentPage);
    }

    async getListProduct(currentPage){
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

    handleChangeValue = (name, value) => {
        this.setState({
            form: Object.assign({}, this.state.form, {
                [name]: value
            }),
        })
    }   
    
    async onSearchProduct(keyWord){
        if(keyWord != ''){
            const response = await api.searchProduct(keyWord);
            const result = JSON.parse(response.text);
            this.setState({
                isSearchProduct: true,
            })
            if(result.status){
                this.setState({
                    form: Object.assign({}, this.state.form, {
                        products: result.data.products
                    }),
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
            this.setState({
                isSearchProduct: false,
            })
        }
        
    }

    onSelectProduct = (products) => {
        let mainProduct = '';
        products.map((product) => {
            mainProduct = product;
        })
        this.setState({
            cartProduct: mainProduct
        })
    } 

    componentDidMount() {
        this.onSearchProduct =  _.debounce(this.onSearchProduct, 500);      
    }

    render() {
        const {isFetching, form, currentPage, itemsPerPage, totalItems, isSearchProduct, msg, cartProduct} = this.state;
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
                        <MainProduct
                            products = {form.products}
                            currentPage = {currentPage}
                            itemsPerPage = {itemsPerPage}
                            totalItems = {totalItems}
                            handlePageChange = {this.handlePageChange}
                            handleChangeValue = {this.handleChangeValue}
                            onSearchProduct = {this.onSearchProduct.bind(this)}
                            isSearchProduct = {isSearchProduct}
                            msg = {msg}
                            onSelectProduct = {this.onSelectProduct}
                        />
                    </div>
                </Fragment>
            );
        }
    }
}