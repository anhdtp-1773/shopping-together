import React, { Component } from 'react';
import {AppProvider, Page, Card, Button} from '@shopify/polaris';

class HomePage extends Component {
    constructor(props) {
      super(props);
      this.state = {
          errors:{},
      };
    }
  
    render() {
      return (
        <AppProvider>
            <Page title="Page">
                Page
            </Page>
        </AppProvider>
      );
    }
  }
  
  export default HomePage;
  