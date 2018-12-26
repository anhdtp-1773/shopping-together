import React, { Component } from 'react';
import {optionsSize} from "../../constants";

export default class Preview extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    render(){
        return (
            <div className="full-width display-block">
                <div className="form-group">
                    <div>
                        <span>{lang.admin}</span>
                        <span>{lang.home}</span>
                        <span>{lang.catalog}</span>
                    </div>
                    <div className="left-container">
                        <img src ="https://www.w3schools.com/images/w3schools_green.jpg" width="350" height="360" /> 
                    </div>
                    <div className="right-container">
                        <div className="form-group">
                            <p>{lang.hello}</p>
                            <p>100$</p>
                            <p>{lang.size}</p>
                            <select 
                                name = "size"
                                className="form-control">
                                <option value="small">Small</option>
                                <option value="medium">Medium</option>
                                <option value="large">Large</option>
                            </select>
                            <p>{lang.color}</p>
                            <select 
                                name = "size"
                                className="form-control" >
                                <option value="red">Red</option>
                                <option value="white">White</option>
                                <option value="black">Black</option>
                                <option value="green">Green</option>
                                <option value="blue">Blue</option>
                            </select>
                        </div>
                        <button>{lang.add_to_cart}</button>
                        <div className="full-width">
                            <p>{lang.frequently_purchased_together}</p>
                            <input type="checkbox" />
                            <span>
                                <img src ="https://www.w3schools.com/images/w3schools_green.jpg" width="20" height="30" /> 
                            </span>
                            <span>{lang.hello}<del>100$</del>30$</span>
                            <span><input type="text"placeholder={1}/></span>
                            <span>
                                <select>
                                    {optionsSize.map((value) =>
                                        <option value={value.value}>{value.label}</option>
                                    )}
                                </select>
                            </span>
                            <p>
                                <input type="checkbox" />
                                <span>
                                    <img src ="https://www.w3schools.com/images/w3schools_green.jpg" width="20" height="30" /> 
                                </span>
                                <span>{lang.hello}<del>70$</del>20$
                                    <span><input type="text" placeholder={1}/></span>
                                </span>
                                <span>
                                    <select>
                                        <option value="combinations">Combinations</option>
                                    </select>
                                </span>
                            </p>
                            <p>
                                <input type="checkbox" />
                                <span>
                                    <img src ="https://www.w3schools.com/images/w3schools_green.jpg" width="20" height="30" /> 
                                </span>
                                <span>{lang.hello} 20$
                                    <span><input type="text" placeholder={1}/></span>
                                </span>
                                <span>
                                    <select>
                                        <option value="combinations">Combinations</option>
                                    </select>
                                </span>
                            </p>
                        <p>{lang.total}<span>70$</span> </p>
                        <button>{lang.add_bundle_to_cart}</button>
                        </div>
                    </div>
                    <div>
                        <span>{lang.quick_links}</span>
                        <span>{lang.talk_about_your_business}</span>
                        <span>{lang.newsletter}</span>
                    </div>
                </div>
            </div>
        );
    }
}