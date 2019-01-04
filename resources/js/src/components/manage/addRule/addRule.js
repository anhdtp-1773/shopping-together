import React, { Component, Fragment } from 'react';
import MainProduct from './mainProduct';
import api from './../../../api';
import RelatedProduct from './relatedProduct';
import Discount from './discount';
import * as Validate from "../../../models/validate.model"; 

export default class AddRule extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            form: {
                ruleName: '',
                products: {},
                discountType: 'percentage',
                relatedProducts: [],
                mainProduct: {},
            },
            currentPage: '',
            itemsPerPage: '',
            totalItems: '',
            isFetching: true,
            msg: '',
            step: 1,
            idMainProduct: '',
            validates: {},
            requiredFields: {},
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
        let {validates, requiredFields} = this.state;
        switch(name){
            case 'ruleName':
                validates[name] = Validate.require(value) ? 'valid' : 'invalid';
                requiredFields[name] = Validate.isName(value);
                break;
        }

        if (_.isEmpty(value)){
			typeof requiredFields[name] !== 'undefined'? _.unset(requiredFields, name) : null;
		}
    
        this.setState({
            validates: _.assign({}, this.state.validates, validates),
            requiredFields: _.assign({}, this.state.requiredFields, requiredFields),
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

    async onSubmit () {
        this.setState({
            isFetching: true
        });
        try{
            const fetch = await api.saveCartRule(this.state.form);
            const result = JSON.parse(fetch.text);
            if(result.status){
                this.setState({
                    isFetching: false,
                })
            }
        }catch(errors){
            alert(errors.message)
        }
    }

    onSelectMainProduct (products) {
        this.setState({
            form: Object.assign({}, this.state.form, {
                mainProduct: _.head(products),
            }),
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
            form: Object.assign({}, this.state.form, {
                relatedProducts: relatedProducts,
            }),
        })
    }

    changeMainProduct (event) {
        let mainProduct = _.clone(this.state.form.mainProduct);
        if(this.state.form.discountType == 'percentage'){
            mainProduct.reductionPercent = event.target.value;
        }else{
            mainProduct.reductionAmount = event.target.value;
        }
        this.setState({
            form: Object.assign({}, this.state.form, {
                mainProduct: mainProduct
            }),
        })
    }

    changeRelatedProduct (index, event) {
        let relatedProducts = _.clone(this.state.form.relatedProducts);
        if(this.state.form.discountType == 'percentage'){
            relatedProducts[index].reductionPercent = event.target.value;
        }else{
            relatedProducts[index].reductionAmount = event.target.value;
        }
        this.setState({
            form: Object.assign({}, this.state.form, {
                relatedProducts: relatedProducts,
            }),
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
        const {isFetching, form, currentPage, itemsPerPage, totalItems, msg, step, idMainProduct, mainProduct, relatedProducts, validates, requiredFields, keyWord} = this.state;
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
                                    ruleName = {form.ruleName}
                                    handlePageChange = {this.handlePageChange.bind(this)}
                                    handleChangeValue = {this.handleChangeValue.bind(this)}
                                    onSearchProduct = {this.onSearchProduct.bind(this)}
                                    msg = {msg}
                                    onSelectMainProduct = {this.onSelectMainProduct.bind(this)}
                                    nextStep = {this.nextStep.bind(this)}
                                    onChangeIdMainProduct = {this.onChangeIdMainProduct.bind(this)}
                                    idMainProduct = {idMainProduct}
                                    validates = {validates}
                                    requiredFields = {requiredFields}
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
                                    idMainProduct = {idMainProduct}
                                />
                            :
                                null
                        }
                    </div>
                    <div>
                        {
                            step == 3
                            ?
                                <Discount 
                                    mainProduct = {form.mainProduct}
                                    relatedProducts = {form.relatedProducts}
                                    handleChangeValue = {this.handleChangeValue.bind(this)}
                                    changeMainProduct = {this.changeMainProduct.bind(this)}
                                    changeRelatedProduct = {this.changeRelatedProduct.bind(this)}
                                    discountType = {form.discountType}
                                    onSubmit = {this.onSubmit.bind(this)}
                                    keyWord = {keyWord}
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