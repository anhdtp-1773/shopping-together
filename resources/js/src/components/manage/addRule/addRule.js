import React, { Component, Fragment } from 'react';
import MainProduct from './mainProduct';
import api from './../../../api';
import RelatedProduct from './relatedProduct';
import Discount from './discount';
import * as Validate from "../../../models/validate.model"; 
import Notification from '../../notification';

export default class AddRule extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            form: {
                ruleName: '',
                discountType: 'percentage',
                relatedProducts: [],
                mainProduct: [],
                discountProducts: [],
                isPercentage: true
            },
            isFetching: false,
            step: 1,
            idMainProduct: '',
            validates: {},
            requiredFields: {},
            mainKeyWord: '',
            mainCurrentPage: '',
            relatedKeyWord: '',
            relatedCurrentPage: '',
            message: '',
        }

        this.onChangeValue = this.onChangeValue.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.onSelectMainProduct = this.onSelectMainProduct.bind(this);
        this.nextStep = this.nextStep.bind(this);
        this.onChangeIdMainProduct = this.onChangeIdMainProduct.bind(this);
        this.onSelectRelatedProduct = this.onSelectRelatedProduct.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
        this.handleChangeDisplayProduct = this.handleChangeDisplayProduct.bind(this);
    }

    handleChangeValue (name, value) {
        let {validates, requiredFields} = this.state;
        let isPercentage = _.clone(this.state.form.isPercentage);
        switch(name){
            case 'ruleName':
                validates[name] = Validate.require(value) ? 'valid' : 'invalid';
                requiredFields[name] = Validate.isName(value);
                break;
            case 'discountType':
                isPercentage = (value == "percentage") ? true : false;
                break;
        }

        if (_.isEmpty(value)){
			typeof requiredFields[name] !== 'undefined'? _.unset(requiredFields, name) : null;
		}
        
        this.setState({
            validates: _.assign({}, this.state.validates, validates),
            requiredFields: _.assign({}, this.state.requiredFields, requiredFields),
            form: Object.assign({}, this.state.form, {
                [name]: value,
                isPercentage
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
            }
        }catch(errors){
            alert(errors.message)
        }
    }

    onSelectMainProduct (products) {
        this.setState({
            form: Object.assign({}, this.state.form, {
                mainProduct: (products),
                discountProducts: products
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
        let discountProducts = _.clone(this.state.form.mainProduct);
        products.map((product) => {
            if((_.findIndex(relatedProducts, function(o) { return o.id== product.id; })) == -1){
                relatedProducts.push(product);
            }
        })
        this.setState({
            form: Object.assign({}, this.state.form, {
                relatedProducts: relatedProducts,
                discountProducts: discountProducts.concat(relatedProducts)
            }),
        })
    }

    handleChangeDisplayProduct (idProduct, value) {
        if(Validate.isPercentage(value)){
            let discountProducts = _.clone(this.state.form.discountProducts);
            discountProducts.map((product, i) => {
                if(product.id == idProduct){
                    discountProducts[i].numberDiscount = value;
                }
            })
            this.setState({
                form: Object.assign({}, this.state.form, {
                    discountProducts
                }),
            })
        }
        
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

    render() {
        const {
            form, step, idMainProduct,
            validates, requiredFields, mainKeyWord, mainCurrentPage, relatedCurrentPage, relatedKeyWord, message
        } = this.state;
        return (
            <Fragment>
                <div>
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
                                onChangeIdMainProduct = {this.onChangeIdMainProduct}
                                idMainProduct = {idMainProduct}
                                validates = {validates}
                                requiredFields = {requiredFields}
                                onChangeValue = {this.onChangeValue}
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
                                currentPage = {relatedCurrentPage}
                                keyWord = {relatedKeyWord}
                                handleChangeValue = {this.handleChangeValue}
                                onSelectRelatedProduct = {this.onSelectRelatedProduct}
                                nextStep = {this.nextStep}
                                idMainProduct = {idMainProduct}
                                onChangeValue = {this.onChangeValue}
                                relatedProducts = {form.relatedProducts}
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
                                handleChangeValue = {this.handleChangeValue}
                                nextStep = {this.nextStep}
                                discountType = {form.discountType}
                                onSubmit = {this.onSubmit}
                                validates = {validates}
                                discountProducts = {form.discountProducts}
                                handleChangeDisplayProduct = {this.handleChangeDisplayProduct}
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