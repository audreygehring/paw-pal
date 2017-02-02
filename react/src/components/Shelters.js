import React, { Component } from 'react';
import Shelter from './Shelter';
import ShelterTile from './ShelterTile';

class Shelters extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: []
    };
    this.fetchData = this.fetchData.bind(this);
    this.componentWillReceiveProps = this.componentWillReceiveProps.bind(this);
}

  componentWillReceiveProps(nextProps) {
    if (nextProps.zip.length == 6) {
      this.fetchData();
    }
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

  render() {
    return (
      <div>
        {this.state.data.map(shelter => {
          return (
            <div>
              <Shelter
                key = {shelter["id"]["$t"]}
                id = {shelter["id"]["$t"]}
                name = {shelter["name"]["$t"]}
                address = {shelter["address1"]["$t"]}
                city = {shelter["city"]["$t"]}
                state = {shelter["state"]["$t"]}
                zip = {shelter["zip"]["$t"]}
                phone = {shelter["phone"]["$t"]}
              />
            </div>
          );
        })}
      </div>
    );
  }
}

export default Shelters;
