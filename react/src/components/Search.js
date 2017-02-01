import React, { Component } from 'react';
import App from './App';

class Search extends Component {
  constructor(props) {
    super(props);
    this.state = {
      zip: ""
    };
    this.setZip = this.setZip.bind(this);
  }

  setZip(event) {
    this.setState({ zip: event.target.value });
  }

  render () {
    return (
      <div>
        <form>
          <input type="text" placeholder="Search Shelters by Zip Code" onChange={this.setZip} />
        </form>
        <div>
          <App
            zip={this.state.zip}
          />
        </div>
      </div>
    );
  }
}

export default Search;
