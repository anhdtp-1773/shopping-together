import React, { Component, Fragment } from 'react';
import api from './../../../api';
import RelatedProduct from './relatedProduct';
// import Discount from './discount';
// import Notification from '../../notification';
import {head} from "lodash";

export default class EditRule extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            form: {
                idCartRule: '',
                discountProducts: [],
                reductionPercent: 0,
                startDate: '',
                endDate: '',
            },
            idRelatedProducts: [],
            isFetching: false,
            step: 1,
            relatedKeyWord: '',
            relatedCurrentPage: '',
            message: '',
            showProductQty: 0,
            idMainProduct: '',
        }

        this.onChangeValue = this.onChangeValue.bind(this);
        this.handleChangeValue = this.handleChangeValue.bind(this);
        this.nextStep = this.nextStep.bind(this);
        this.onSelectRelatedProduct = this.onSelectRelatedProduct.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
        this.onChangeDate = this.onChangeDate.bind(this);
    }

    async componentWillMount () {
        const response = await api.getSetup();
        const result = JSON.parse(response.text);
        if(result.data.setting){
            const responseCartRule = await api.getCartRule(this.props.match.params.id);
            const resultCartRule = JSON.parse(responseCartRule.text);
            if(resultCartRule.data.length > 0){
                let idMainProduct = '';
                resultCartRule.data.map((cartRule, key) => {
                    if(cartRule.is_main_product == 1){
                        idMainProduct = cartRule.id_product;
                    }
                })  
                this.setState({
                    form: Object.assign({}, this.state.form, {
                        discountProducts: resultCartRule.data, 
                        reductionPercent: head(resultCartRule.data).reduction_percent,
                        startDate: head(resultCartRule.data).start_date,
                        endDate: head(resultCartRule.data).end_date,
                        showProductQty: result.data.setting.show_product_qty,
                    }),
                    idMainProduct,
                    isFetching: false,
                })
                
            }
        }
      
    }

    handleChangeValue (name, value) {
        this.setState({
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

    onSelectRelatedProduct (products) {
        // let relatedProducts = [];
        // let idRelatedProducts = [];
        // let discountProducts = _.clone(this.state.form.mainProduct);
        // products.map((product, key) => {
        //     if((_.findIndex(relatedProducts, function(o) { return o.id == product.id; })) == -1){
        //         products[key].isMainProduct = false;
        //         relatedProducts.push(product);
        //         idRelatedProducts.push(product.id);
        //     }
        // })  
        // this.setState({
        //     form: Object.assign({}, this.state.form, {
        //         discountProducts: discountProducts.concat(relatedProducts)
        //     }),
        //     idRelatedProducts,
        // })
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
            form, step, idMainProduct, isFetching, showProductQty, idRelatedProducts, 
            validates, relatedCurrentPage, relatedKeyWord, message
        } = this.state;
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
                                    discountProducts = {form.discountProducts}
                                />
                            :
                                null
                        }
                    </div>
                    {/* <div className="steps">
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
                    } */}
                </Fragment>
            );
        }
    }
}
