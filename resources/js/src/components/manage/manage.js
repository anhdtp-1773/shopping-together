import React, { Component, Fragment } from 'react';
import api from './../../api';
import * as _ from "lodash";
import Pagination from "react-js-pagination";
import { Link } from 'react-router-dom';

export default class Manage extends Component {
    constructor(){
        super(...arguments);
        this.state = {
            rules: [],
            itemsPerPage: '',
            totalItems: '',
            currentPage: '',
            isFetching: true,
            msg: '',
            keyWord: '',
            itemsChecked: false,
            isChecked: false,
            idCartRules: [],
            status: true,
        }
        this.handlePageChange = this.handlePageChange.bind(this); 
        this.onChangeKeyWord = this.onChangeKeyWord.bind(this);
        this.deleteRule = this.deleteRule.bind(this);
        this.onSearchRule =  _.debounce(this.onSearchRule, 500);
        this.selectItems = this.selectItems.bind(this);
        this.handleClick = this.handleClick.bind(this);
    }

    componentWillMount () {
        if(this.state.keyWord){
            this.onSearchRule(this.state.keyWord, this.state.currentPage);
        }
        else{
            this.getRulesList(this.state.currentPage);
        }
    }

    async getRulesList (currentPage) {
        const response = await api.getRules(currentPage);
        const result = JSON.parse(response.text);
        if(result.status){
            this.setState({ 
                itemsPerPage: result.data.items_per_page,
                totalItems: result.data.total_items,
                rules: result.data.items,
                currentPage: result.data.current_page,
                isFetching: false,
            });
        }
    }   

    async deleteRule (id){
        let idCartRules = id ? id : this.state.idCartRules;
        this.setState({
            isFetching: true
        });
        try{
            const fetch = await api.deleteRule(idCartRules);
            const result = JSON.parse(fetch.text);
            if(result.status){
                window.location.replace('/manage');
            }else{
                this.setState({
                    message: result.message,
                    isFetching: false,
                })
            }
        }catch(errors){
            alert(errors.message)
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
                    currentPage: result.data.current_page,
                    isFetching: false,
                });
            }else{
                this.setState({
                    msg: result.message,
                    rules: '',
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
    
    selectItems (e) {
        const {rules} = this.state;
        const checked = e.target.checked;
        let idCartRules = [];
        rules.map((rule) => {
            if(checked){
                idCartRules.push(rule.id);
            }
            return Object.assign(rule, {
                is_selected: !this.state.itemsChecked
            })
        });
        this.setState({
            itemsChecked: !this.state.itemsChecked,
            idCartRules
        })
    }

    handleClick (e) {
        const id = parseInt(e.target.value);
        const {rules} = this.state;
        let idCartRules = _.clone(this.state.idCartRules);
        let index = idCartRules.indexOf(id)
        if(index >= 0){
            idCartRules.splice(index, 1);
        }else{
            idCartRules.push(id)
        }
        rules.map((rule) => {
            if(rule.id == id){
                return Object.assign(rule, {
                    is_selected: !rule.is_selected
                })
            }
        });
        this.setState({
            idCartRules,
            rules,
            itemsChecked: false,
        })
    }

    async changeStatusOfRules (){
        const {rules} = this.state;
        let ids = [];
        rules.map((rule) => {
            ids.push(rule.id);
        });
        this.setState({
            isFetching: true,
            status: !this.state.status
        });
        try{
            const fetch = await api.changeStatusOfRule(ids, !this.state.status);
            const result = JSON.parse(fetch.text);
            rules.map((rule) => {
                return Object.assign(rule, {
                    status: this.state.status
                })
            })
            if(result.status){
                this.setState({
                    isFetching: false,
                    rules
                });
            }else{
                this.setState({
                    message: result.message,
                    isFetching: false,
                })
            }
        }catch(errors){
            alert(errors.message)
        }
    }
    async changeStatusOfRule (id,status){
        const {rules} = this.state;
        let idCartRules = [id];
        this.setState({
            isFetching: true,
        });
        try{
            const fetch = await api.changeStatusOfRule(idCartRules,status);
            const result = JSON.parse(fetch.text);
            console.log(result)

            rules.map((rule) => {
                if (rule.id == id) {
                    return Object.assign(rule, {
                        status: !rule.status
                    })
                }
                
            })

            if(result.status){
                this.setState({
                    isFetching: false,
                    rules,
                    status:false
                });
            }else{
                this.setState({
                    message: result.message,
                    isFetching: false,
                })
            }
        }catch(errors){
            alert(errors.message)
        }
    }

    selectItems (e) {
        const {rules} = this.state;
        const checked = e.target.checked;
        let idCartRules = [];
        rules.map((rule) => {
            if(checked){
                idCartRules.push(rule.id);
            }
            return Object.assign(rule, {
                is_selected: !this.state.itemsChecked
            })
        });
        this.setState({
            itemsChecked: !this.state.itemsChecked,
            idCartRules
        })
    }

    handleClick (e) {
        const id = parseInt(e.target.value);
        const {rules} = this.state;
        let idCartRules = _.clone(this.state.idCartRules);
        let index = idCartRules.indexOf(id)
        if(index >= 0){
            idCartRules.splice(index, 1);
        }else{
            idCartRules.push(id)
        }
        rules.map((rule) => {
            if(rule.id == id){
                return Object.assign(rule, {
                    is_selected: !rule.is_selected
                })
            }
        });
        this.setState({
            idCartRules,
            rules,
            itemsChecked: false,
        })
    }

    render() {
        const {rules, itemsPerPage, totalItems, isFetching, currentPage, keyWord, msg, itemsChecked} = this.state;
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
                    <div className="container">
                        <table className="table">
                            <thead>
                                <tr>
                                    <th>{lang.select}</th>
                                    <th>{lang.name}</th>
                                    <th>{lang.status}</th>
                                    <th>{lang.actions}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div className="form-group product-search-wrap">
                                            <input 
                                                type="text" 
                                                className="form-control" 
                                                placeholder={lang.search} 
                                                onChange={this.onChangeKeyWord}
                                                value = {keyWord}
                                            />
                                        </div>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                {
                                    rules
                                    ?
                                    <Fragment> 
                                    <tr>
                                        <td>
                                            <input 
                                                type="checkbox"
                                                checked={itemsChecked} 
                                                onClick={this.selectItems}
                                            />
                                        </td>
                                        <td>{lang.all}</td>
                                        <td>
                                            <div className="switch-container">
                                                <label>
                                                    <input 
                                                        ref="switch" 
                                                        className="glyphicon glyphicon-trash"
                                                        checked = {this.state.status}
                                                        onClick={e =>
                                                            this.changeStatusOfRules()
                                                        } 
                                                        className="switch" 
                                                        type="checkbox" 
                                                        />
                                                    <div>
                                                        <div></div>
                                                    </div>
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                        <span 
                                            className="glyphicon glyphicon-trash"
                                            onClick={e =>
                                                window.confirm(lang.are_you_sure_you_wish_to_delete_all_of_these_rule) &&
                                                this.deleteRule()
                                            }
                                        />
                                        </td>
                                    </tr>
                                    {rules.map((rule, i)=>(
                                        <tr key={i}>
                                            <td>
                                                <input 
                                                    type="checkbox"
                                                    checked={rule.is_selected} 
                                                    value={rule.id}
                                                    onClick={this.handleClick}
                                                />
                                            </td>
                                            <td>{rule.name}</td>
                                            <td>
                                                <div className="switch-container">
                                                    <label>
                                                        <input 
                                                            ref="switch" 
                                                            className="switch" type="checkbox" 
                                                            onClick={e =>
                                                                this.changeStatusOfRule(rule.id, !rule.status)
                                                            } 
                                                            checked={rule.status} 
                                                            />
                                                        <div>
                                                            <div></div>
                                                        </div>
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <span className="glyphicon glyphicon-edit"></span>
                                                <span 
                                                    className="glyphicon glyphicon-trash"
                                                    onClick={e =>
                                                        window.confirm(lang.are_you_sure_you_wish_to_delete_this_rule) &&
                                                        this.deleteRule(rule.id)
                                                    }
                                                >
                                                </span>
                                            </td>
                                        </tr>
                                    ))}
                                    </Fragment>
                                    :
                                    <p>{msg}</p>
                                }
                            </tbody>
                        </table>

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
                    </div>
                </div>
            );
        }
    }
}