import React, { Component } from 'react';
import * as _ from "lodash";

export default class RulesList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            cartRule: this.props.onHandleChange,
          };

    }

    // handleChange1 (event,key11) {
    //     debugger;
    //     let aaa = event.target.value;
    //     const index = _.findIndex((this.state.cart_rules)[key11].variants, function(c) { return c.id_variant == event.target.value })
    //     // this.setState({key: index});
    //    this.state.key = index;
    // }

    // submit handler
    onHandleChange (cartRule, event) {
        console.log(event);
        console.log(cartRule);
        // cartRule.preventDefault();
        const variant_id = event.target.value;
        const index = _.findIndex(cartRule.variants, function(c) { return c.id_variant == variant_id });
        cartRule.key = index;

        this.setState({
            [cartRule]: cartRule,
        });
    }

    render (){
        const {cartRule} = this.state;
        console.log(cartRule);
        return (
            cartRule
            ?
                <select className="select-option" name="variants" onChange={this.onHandleChange.bind(this, cartRule)}>
                    {
                        cartRule.variants.map((variant, j) => {
                            return <option value={variant.id_variant}>{variant.title}</option>
                        })
                    }
                </select>
            :
            <p>{lang.record_not_found}</p>
        )
    }
}
