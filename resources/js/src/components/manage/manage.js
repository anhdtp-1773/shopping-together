import React, { Component, Fragment } from 'react';
import api from './../../api';
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
        }
        this.handlePageChange = this.handlePageChange.bind(this);
    }

    componentWillMount () {
        this.getRulesList(this.state.currentPage);
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

    handlePageChange (currentPage) {
        this.setState({
            isFetching: true
        })
        this.getRulesList(currentPage);
    }

    render() {
        const {rules, itemsPerPage, totalItems, isFetching, currentPage} = this.state;
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
                                    <td><input/><button className="glyphicon glyphicon-search"></button></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"/></td>
                                    <td>{lang.all}</td>
                                    <td>
                                        <div className="switch-container">
                                            <label>
                                                <input ref="switch" checked={true} className="switch" type="checkbox" />
                                                <div>
                                                    <div></div>
                                                </div>
                                            </label>
                                        </div>
                                    </td>
                                    <td><span className="glyphicon glyphicon-edit"></span> <span className="glyphicon glyphicon-trash"></span></td>
                                </tr>
                                {rules.map((rule, i)=>(
                                    <tr key={i}>
                                        <td><input type="checkbox"/></td>
                                        <td>{rule.name}</td>
                                        <td>
                                            <div className="switch-container">
                                                <label>
                                                    <input ref="switch" checked={true} className="switch" type="checkbox" />
                                                    <div>
                                                        <div></div>
                                                    </div>
                                                </label>
                                            </div>
                                        </td>
                                        <td><span className="glyphicon glyphicon-edit"></span><span className="glyphicon glyphicon-trash"></span></td>
                                    </tr>
                                ))}
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