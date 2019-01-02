import React, { Component, Fragment } from 'react';
import * as _ from "lodash";
import { optionsDiscountType } from "./../../../constants";
export default class Discount extends Component {
    constructor(){
        super(...arguments);
        this.state = {

        }
    }

    handleChangeValue (event) {
        this.props.handleChangeValue(event.target.name, event.target.value);
    }

    render(){
        console.log(this.props);
        return(
            <Fragment>
                <p>{lang.discount_type}</p>
                <div className="form-group col-md-4">
                    <select name="discountType" onChange={this.handleChangeValue.bind(this)} className='form-control input-sm'>
                        {optionsDiscountType.map((type)=>(
                            <option value={type.value}>{type.label}</option>
                        ))}
                    </select>
                </div>
                <br />
                <br />
                <br />
                <div className="panel panel-default container">
                    <div className="panel-heading">{lang.set_discount}</div>
                    <table className="table">
                        <thead>
                            <tr>
                                <th>{lang.image}</th>
                                <th>{lang.name}</th>
                                <th>{lang.original_price}</th>
                                <th>{lang.discount}</th>
                                <th>{lang.sale_price}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Doe</td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                            </tr>
                            <tr>
                                <td>Mary</td>
                                <td>Moe</td>
                                <td>mary@example.com</td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                            </tr>
                            <tr>
                                <td>July</td>
                                <td>Dooley</td>
                                <td>july@example.com</td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </Fragment>
        )
    }
}