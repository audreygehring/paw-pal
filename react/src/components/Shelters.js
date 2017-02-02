
import React, { Component } from 'react';
import Shelter from './Shelter';

class Shelters extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: []
    };
    this.fetchData = this.fetchData.bind(this);
    this.componentWillReceiveProps = this.componentWillReceiveProps.bind(this);
}


  fetchData() {
    fetch(`/api/v1/shelters/${this.props.zip}`)
    .then(response => response.json())
    .then((res) => {
      this.setState({
        data: res.shelters
      });
    });
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.zip.length == 6) {
      this.fetchData();
    }
  }

  render() {
    return (
      <div>
        {this.state.data.map(shelter => {
          return (
            <Shelter
              key = {shelter["id"]["$t"]}
              id = {shelter["id"]["$t"]}
              name = {shelter["name"]["$t"]}
            />
          );
        })}
      </div>
    );
  }
}

export default Shelters;
