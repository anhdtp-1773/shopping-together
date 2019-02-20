import React, { Component, Fragment } from 'react';
import MainProduct from './mainProduct';
import api from './../../../api';
import {isEmpty, unset, find, assign, head, findIndex, clone} from "lodash";
import RelatedProduct from './relatedProduct';
import Discount from './discount';
import {require, isName} from "../../../models/validate.model";
import Notification from '../../notification';

export default class AddRule extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            form: {
                ruleName: '',
                mainProduct: [],
                discountProducts: [],
                reductionPercent: 0,
                startDate: new Date(),
                endDate: new Date(),
            },
            idRelatedProducts: [],
            isFetching: true,
            step: 1,
            idMainProduct: '',
            validates: {},
            requiredFields: {},
            mainKeyWord: '',
            mainCurrentPage: '',
            relatedKeyWord: '',
            relatedCurrentPage: '',
            message: '',
            showProductQty: 0,
            rulesNameExist: [],
        }

        this.onChangeValue = this.onChangeValue.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.onSelectMainProduct = this.onSelectMainProduct.bind(this);
        this.nextStep = this.nextStep.bind(this);
        this.onSelectRelatedProduct = this.onSelectRelatedProduct.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
        this.onChangeDate = this.onChangeDate.bind(this);
    }

    async componentWillMount () {
        const response = await api.getSetup();
        const result = JSON.parse(response.text);
        if(result.data.setting){
            this.setState({
                showProductQty: result.data.setting.show_product_qty,
                rulesNameExist: result.data.rules_name,
                isFetching: false,
            })
        }
    }

    handleChangeValue (name, value) {
        let {validates, requiredFields, rulesNameExist} = this.state;
        switch(name){
            case 'ruleName':
                if(rulesNameExist){
                    validates[name] = find(rulesNameExist, function(o) { return o.name == value; }) ? 'invalid' : (require(value.split(' ').join('')) ? 'valid' : 'invalid');
                }else{
                    validates[name] = require(value.split(' ').join('')) ? 'valid' : 'invalid';
                }
                requiredFields[name] = isName(value);
                break;
        }
        if (isEmpty(value)){
			typeof requiredFields[name] !== 'undefined'? unset(requiredFields, name) : null;
		}
        this.setState({
            validates: assign({}, this.state.validates, validates),
            requiredFields: assign({}, this.state.requiredFields, requiredFields),
            form: Object.assign({}, this.state.form, {
                [name]: value,
            }),
        })
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
                    message: result.message
                })
                window.location.replace('/manage');
            }
        }catch(errors){
            alert(errors.message)
        }
    }

    onSelectMainProduct (products) {
        this.setState({
            form: Object.assign({}, this.state.form, {
                    mainProduct: products,
                    discountProducts: products,
                }),
            idMainProduct: head(products).id
        })
    } 
    
    onSelectRelatedProduct (products) {
        let relatedProducts = [];
        let idRelatedProducts = [];
        let discountProducts = clone(this.state.form.mainProduct);
        products.map((product, key) => {
            if((findIndex(relatedProducts, function(o) { return o.id == product.id; })) == -1){
                products[key].isMainProduct = false;
                relatedProducts.push(product);
                idRelatedProducts.push(product.id);
            }
        })  
        this.setState({
            form: Object.assign({}, this.state.form, {
                discountProducts: discountProducts.concat(relatedProducts)
            }),
            idRelatedProducts,
        })
    }

    nextStep (step) {
        this.setState({
            step: step
        })
    }

    onChangeValue (name, value) {
        this.setState({
            [name]: value
        })
    }

    onChangeDate (name, date) {
        this.setState({
            form: Object.assign({}, this.state.form, {
                [name]: date
            })
        });
    }

    render() {
        const {
            form, step, idMainProduct, isFetching, showProductQty, idRelatedProducts, rulesNameExist,
            validates, requiredFields, mainKeyWord, mainCurrentPage, relatedCurrentPage, relatedKeyWord, message} = this.state;
        if(isFetching){ return (
            <div id="page_loading">
                <div className="loading">
                    <i className="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom" />
                </div>
            </div>
        )}else {
            return (
                <Fragment>
                    <div className="steps">
                        {
                            step == 1
                            ?
                                <MainProduct
                                    currentPage = {mainCurrentPage}
                                    keyWord = {mainKeyWord}
                                    ruleName = {form.ruleName}
                                    handleChangeValue = {this.handleChangeValue}
                                    onSelectMainProduct = {this.onSelectMainProduct}
                                    nextStep = {this.nextStep}
                                    idMainProduct = {idMainProduct}
                                    validates = {validates}
                                    requiredFields = {requiredFields}
                                    onChangeValue = {this.onChangeValue}
                                    rulesNameExist = {rulesNameExist}
                                />
                            :
                                null
                        }
                    </div>
                    <div className="steps">
                        {
                            step == 2
                            ?
                                <RelatedProduct
                                    currentPage = {relatedCurrentPage}
                                    keyWord = {relatedKeyWord}
                                    handleChangeValue = {this.handleChangeValue}
                                    onSelectRelatedProduct = {this.onSelectRelatedProduct}
                                    nextStep = {this.nextStep}
                                    idMainProduct = {idMainProduct}
                                    onChangeValue = {this.onChangeValue}
                                    showProductQty = {showProductQty}
                                    idRelatedProducts = {idRelatedProducts}
                                    reductionPercent = {form.reductionPercent}
                                />
                            :
                                null
                        }
                    </div>
                    <div className="steps">
                        {
                            step == 3
                            ?
                                <Discount
                                    handleChangeValue = {this.handleChangeValue}
                                    nextStep = {this.nextStep}
                                    onSubmit = {this.onSubmit}
                                    validates = {validates}
                                    discountProducts = {form.discountProducts}
                                    reductionPercent = {form.reductionPercent}
                                    onChangeDate = {this.onChangeDate}
                                    startDate = {form.startDate}
                                    endDate = {form.endDate}
                                />
                            :
                                null
                        }
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
                </Fragment>
            );
        }
    }
}
