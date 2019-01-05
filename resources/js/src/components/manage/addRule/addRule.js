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
                discountType: 'percentage',
                relatedProducts: [],
                mainProduct: {},
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
        }

        this.onChangeValue = this.onChangeValue.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.onSelectMainProduct = this.onSelectMainProduct.bind(this);
        this.nextStep = this.nextStep.bind(this);
        this.onChangeIdMainProduct = this.onChangeIdMainProduct.bind(this);
        this.onSelectRelatedProduct = this.onSelectRelatedProduct.bind(this);
        this.changeMainProduct = this.changeMainProduct.bind(this);
        this.changeRelatedProduct = this.changeRelatedProduct.bind.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
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

    nextStep (step) {
        this.setState({
            step: step
        })
    }

    onChangeKeyWord (name, keyWord) {
        this.setState({
            [name]: keyWord
        })
    }

    onChangeCurrentPage (name, value) {
        this.setState({
            [name]: value
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
            validates, requiredFields, mainKeyWord, mainCurrentPage, relatedCurrentPage, relatedKeyWord
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
                                changeMainProduct = {this.changeMainProduct}
                                changeRelatedProduct = {this.changeRelatedProduct}
                                nextStep = {this.nextStep}
                                discountType = {form.discountType}
                                onSubmit = {this.onSubmit}
                            />
                        :
                            null
                    }
                </div>
            </Fragment>
        );
    }
}