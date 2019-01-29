import React, { Component, Fragment } from 'react';
import api from './../../api';
import * as _ from "lodash";

export default class ChangeStatusRules extends Component {
    constructor(props){
        // super(...arguments);
        super(props);
        this.state = {
            rules: this.props.rules,
            isFetching: true,
            itemsChecked: false,
            idCartRules: [],
            status: true,
        }
        this.deleteRule = this.deleteRule.bind(this);
        this.selectItems = this.selectItems.bind(this);
        this.handleClick = this.handleClick.bind(this);
        this.handleChange = this.handleChange.bind(this);
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

    async handleChange (id, status) {
        const {rules} = this.state;
        let ids = [];
        this.setState({
            isFetching: true
        });
        if (id) {
            ids = [id];
            if (status === true) {
                let changeStatusAll = true;
                rules.map((rule, i) => {
                    if (rule.id !== id){
                        if(rule.status == false) {
                            changeStatusAll = false;
                        }}
                });
                if (changeStatusAll === true ){
                    this.state.status = true;
                } else {
                    this.state.status = false;
                }
            } else {
                this.state.status = false;
            }
            rules.map((rule, i) => {
                if (rule.id == id){
                 rule.status = status;
                }
            });
        } else {
            this.state.status = status;
            rules.map((rule) => {
                rule.status = status;
                ids.push(rule.id);
            }); 
        }
        try {
            const fetch = await api.changeRuleStatus(ids,status);
            const result = JSON.parse(fetch.text);
            if (result.status) {
                this.setState({
                    isFetching: false,
                    rules,
                    status: this.state.status ? this.state.status : false
                });
            }else{
                this.setState({
                    message: result.message,
                    isFetching: false,
                })
            }
        } catch(errors){
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
        const {rules, itemsChecked} = this.state;
        return (
                <div className="container table-rule">
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
                                                this.handleChange(0, !this.state.status)
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
                                                    this.handleChange(rule.id, !rule.status)
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
                    </tbody>
                    </table>
                </div>
        );
    }
}
