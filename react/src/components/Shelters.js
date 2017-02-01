
import React, { Component } from 'react';
import Shelter from './Shelter';

class Shelters extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: []
    };
    this.fetchData = this.fetchData.bind(this);
  }
  componentDidUpdate(){
    if (this.props.zip.length == 5) {
      this.fetchData();
    }
  }

  fetchData() {
    fetch(`/api/v1/shelters/${this.props.zip}`)
      .then(response => {
        if (response.ok) {
          return response;
      } else {
          let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
    .then(response => response.json())
    .then(body => {
      this.setState({ data: body.shelters });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let shelterList = this.state.data.map(shelter => {
      return (
        <Shelter
          key = {shelter["id"]["$t"]}
          id = {shelter["id"]["$t"]}
          name = {shelter["name"]["$t"]}
        />
      );
    });

    return(
      <div>
          {shelterList}
      </div>
    );
  }
}

export default Shelters;
