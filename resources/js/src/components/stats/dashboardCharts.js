import React, { Component, PropTypes } from 'react'
import { LineChart, Line, XAxis, YAxis, Tooltip, CartesianGrid} from 'recharts';
import Lodash from 'lodash';
import moment from 'moment';

export default class DashboardCharts extends Component{
    formatCharData(data) {
        const {range} = this.props;
        let chartData = [];
        Lodash.forIn(data, function(value, key){
            let item = {};
            let formattedDate = range == 'month' ? moment(key*1000).format("MMMM YYYY") : moment(key*1000).format("DD-MM-YYYY");
            item['name'] = formattedDate;
            item['quantity'] = (value);
            chartData.push(item);
        })
        return chartData;
    }
    render(){
        const { chartWidth, chartHeight, data, currency } = this.props;
        return(
            <div className="charts">
                {
                    chartWidth > 0 
                    ?
                    <div className="charts-container">
                        <div className="chart-container">
                            <div className="chart-header">
                                <h3>{lang.view}</h3>
                            </div>
                            <LineChart width={chartWidth} height={chartHeight} data={this.formatCharData(data.views)} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
                                <Line type="monotone" dataKey="quantity" stroke="#8884d8" label={false}/>
                                <CartesianGrid stroke="#ccc" strokeDasharray="5 5" />
                                <XAxis dataKey="name" tickLine={false} tick={false}/>
                                <YAxis />
                                <Tooltip />
                            </LineChart>
                        </div>
                        <div className="chart-container">
                            <div className="chart-header">
                                <h3>{lang.orders}</h3>
                            </div>
                            <LineChart width={chartWidth} height={chartHeight} data={this.formatCharData(data.orders)} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
                                <Line type="monotone" dataKey="quantity" stroke="#8884d8" label={false}/>
                                <CartesianGrid stroke="#ccc" strokeDasharray="5 5" />
                                <XAxis dataKey="name" tickLine={false} tick={false}/>
                                <YAxis />
                                <Tooltip />
                            </LineChart>
                        </div>
                        <div className="chart-container">
                            <div className="chart-header">
                                <h3>{lang.revenue}</h3>
                            </div>
                            <LineChart width={chartWidth} height={chartHeight} data={this.formatCharData(data.revenues)} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
                                <Line type="monotone" dataKey="quantity" stroke="#8884d8" label={false}/>
                                <CartesianGrid stroke="#ccc" strokeDasharray="5 5" />
                                <XAxis dataKey="name" tickLine={false} tick={false}/>
                                <YAxis />
                                <Tooltip />
                            </LineChart>
                        </div>
                    </div>		
                    :
                    null
                }

            </div>
        );
    }
}
