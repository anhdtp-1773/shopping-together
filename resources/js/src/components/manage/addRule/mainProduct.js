import React, { Component, Fragment } from 'react';
import Pagination from "react-js-pagination";

export default class MainProduct extends Component {
    constructor(){
        super(...arguments);
        this.state = {

        }
    }

    render() {
        return (
            <div className="container">
                <div className="form-inline">
                    <div className="form-group mb-2">
                        <span>{lang.set_the_rule_name}</span>
                    </div>
                    <div className="form-group mx-sm-3 mb-2">
                        <input type="text" className="form-control" placeholder={lang.rule} />
                    </div>
                </div>

                <div className="form-group">
                    <label htmlFor="formGroupExampleInput">{lang.choose_a_main_product}</label>
                    <input type="text" className="form-control" placeholder={lang.search} />
                </div>

                <div className="row">
                    <div className="col-sm-6 col-md-3">
                        <div className="thumbnail">
                            <img src="https://cdn.shopify.com/s/files/1/0014/9988/9775/products/10446026_348247681989429_3852309148307758203_o.jpg?v=1545359213" alt="..." />
                            <input type="checkbox" defaultValue />
                            <div className="caption">
                            <h3>product 3</h3>
                            <p>$30</p>
                            </div>
                        </div>
                    </div>

                     <div className="col-sm-6 col-md-3">
                        <div className="thumbnail">
                            <img src="https://cdn.shopify.com/s/files/1/0014/9988/9775/products/10446026_348247681989429_3852309148307758203_o.jpg?v=1545359213" alt="..." />
                            <input type="checkbox" defaultValue />
                            <div className="caption">
                            <h3>product 3</h3>
                            <p>$30</p>
                            </div>
                        </div>
                    </div>

                    <div className="col-sm-6 col-md-3">
                        <div className="thumbnail">
                            <img src="https://cdn.shopify.com/s/files/1/0014/9988/9775/products/10446026_348247681989429_3852309148307758203_o.jpg?v=1545359213" alt="..." />
                            <input type="checkbox" defaultValue />
                            <div className="caption">
                            <h3>product 3</h3>
                            <p>$30</p>
                            </div>
                        </div>
                    </div>

                    <div className="col-sm-6 col-md-3">
                        <div className="thumbnail">
                            <img src="https://cdn.shopify.com/s/files/1/0014/9988/9775/products/10446026_348247681989429_3852309148307758203_o.jpg?v=1545359213" alt="..." />
                            <input type="checkbox" defaultValue />
                            <div className="caption">
                            <h3>product 3</h3>
                            <p>$30</p>
                            </div>
                        </div>
                    </div>
                </div>

                <Pagination
                    pageRangeDisplayed={5}
                    activePage={1}
                    itemsCountPerPage={2}
                    totalItemsCount={4}
                    // onChange={this.handlePageChange}
                />
                <button type="button" class="btn btn-primary" style={{float:"right"}}>{lang.next}</button>
                 {/* <Pagination
                    activePage={currentPage}
                    itemsCountPerPage={itemsPerPage}
                    totalItemsCount={totalItems}
                    pageRangeDisplayed={5}
                    onChange={this.handlePageChange}
                /> */}
            </div>
        );
    }
}