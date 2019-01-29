import React, { Component, Fragment } from 'react';
import api from './../../api';
import * as _ from "lodash";
import Pagination from "react-js-pagination";
import { Link } from 'react-router-dom';
import ChangeStatusRules from './changeStatusRules';

export default class Manage extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            rules: [],
            itemsPerPage: '',
            totalItems: '',
            currentPage: '',
            isFetching: true,
            msg: lang.add_a_new_rule_in_manage_page_to_see_how_it_displays_remember_to_select_this_product_as_the_main_product,
            keyWord: '',
            status: true,
        }
        this.handlePageChange = this.handlePageChange.bind(this);
        this.onChangeKeyWord = this.onChangeKeyWord.bind(this);
        this.onSearchRule =  _.debounce(this.onSearchRule, 500);
    }

    componentWillMount () {
        if(this.state.keyWord){
            this.onSearchRule(this.state.keyWord, this.state.currentPage);
        }
        else{
            this.getRulesList(this.state.currentPage);
        }
    }

    checkState (rules) {
        let checkState = true;
        rules.map((rule, i) => {
            if (rule.status == false){
                checkState = false;
            }
        });
        return checkState;
    }

    async getRulesList (currentPage) {
        const response = await api.getRules(currentPage);
        const result = JSON.parse(response.text);
        if(result.status){
            this.setState({
                itemsPerPage: result.data.items_per_page,
                totalItems: result.data.total_items,
                rules: result.data.items,
                status: this.checkState(result.data.items),
                currentPage: result.data.current_page,
                isFetching: false,
            });
        }
    }

    handlePageChange (currentPage) {
        this.setState({
            isFetching: true
        })
        if(this.state.keyWord){
            this.onSearchRule(this.state.keyWord, currentPage);
        }else{
            this.getRulesList(currentPage);
        }
    }

    onChangeKeyWord (event) {
        this.setState({
            keyWord: event.target.value,
        })
        this.onSearchRule(event.target.value);
    }

    async onSearchRule (keyWord, currentPage = null) {
        this.setState({
            isFetching: true,
        })
        if(keyWord != ''){
            const response = await api.searchRule(keyWord, currentPage);
            const result = JSON.parse(response.text);
            if(result.status){
                this.setState({
                    itemsPerPage: result.data.items_per_page,
                    totalItems: result.data.total_items,
                    rules: result.data.items,
                    status: this.checkState(result.data.items),
                    currentPage: result.data.current_page,
                    isFetching: false,
                });
            }else{
                this.setState({
                    msg: result.message,
                    rules: '',
                    status: false,
                    itemsPerPage: result.data.items_per_page,
                    totalItems: result.data.total_items,
                    currentPage: result.data.current_page,
                    isFetching: false,
                })
            }
        }else{
            this.getRulesList('');
        }
    }

    render() {
        const {rules, itemsPerPage, totalItems, isFetching, currentPage, keyWord, msg} = this.state;
        if(isFetching){ return (
            <div id="page_loading">
                <div className="loading">
                    <i className="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom" />
                </div>
            </div>
        )}else {
            return (
                <div>
                    <Link to={'/cart-rule/add'} className="btn btn-sm btn-add_a_new_rule">
                        {lang.add_a_new_rule}
                    </Link>
                    <div className="product-search-wrap">
                        <input
                            type="text"
                            className="form-control"
                            placeholder={lang.search}
                            onChange={this.onChangeKeyWord}
                            value = {keyWord}
                        />
                    </div>
                    <div className="container table-rule">
                        {
                            rules.length > 0
                            ?
                            (
                                <ChangeStatusRules
                                rules = {rules}
                                />
                            )
                            :
                            null
                        }
                        {
                            rules.length > 0
                            ?
                            <Fragment>
                                <div className="pagination-wrap">
                                    <Pagination
                                        activePage={currentPage}
                                        itemsCountPerPage={itemsPerPage}
                                        totalItemsCount={totalItems}
                                        pageRangeDisplayed={5}
                                        onChange={this.handlePageChange}
                                    />
                                </div>
                            </Fragment>
                            :
                            <p>{msg}</p>
                        }
                    </div>
                </div>
            );
        }
    }
}
