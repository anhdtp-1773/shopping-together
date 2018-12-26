import React, { Component } from 'react';
import Setting from './components/setting/setting';
import { Switch, Route } from 'react-router-dom'
import Manage from './components/manage/manage';
import AddRule from './components/manage/addRule/addRule';

export default class RouterPath extends Component{
    render(){   
        return (
            <Switch>
                <Route exact path={'/'} component={Setting}/>
                <Route exact path={'/manage'} component={Manage}/>
                <Route path={'/cart-rule/add'} component={AddRule}/>
            </Switch>
        )
    }
}