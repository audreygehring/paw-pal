import React, { Component } from 'react';
import Shelters from './Shelters';

class App extends Component {
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
          <input type="text" id="react-search" className="react-search" placeholder="Search Shelters by Zip Code" onChange={this.setZip}/>
        </form>
        <div>
          <Shelters
            zip={this.state.zip}
          />
        </div>
      </div>
    );
  }
}

export default App;
