import React, { Component } from 'react';
import Shelter from './Shelter';

class Shelters extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      selectedShelterId: null
    };
    this.fetchData = this.fetchData.bind(this);
    this.componentWillReceiveProps = this.componentWillReceiveProps.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.zip.length == 5) {
      this.fetchData(nextProps);
    }
  }

  fetchData(nextProps) {
    fetch(`/api/v1/shelters/${nextProps.zip}`)
    .then(response => response.json())
    .then((res) => {
      this.setState({
        data: res.shelters
      });
    });
  }

  handleClick(id) {
    if (id === this.state.selectedShelterId) {
      this.setState({ selectedShelterId: null });
    } else {
      this.setState({ selectedShelterId: id });
    }
  }

  render() {
    let shelters = this.state.data.map(shelter => {
      return (
        <Shelter
          key={shelter.id.$t}
          id={shelter.id.$t}
          name={shelter.name.$t}
          address={shelter.address1.$t}
          city={shelter.city.$t}
          state={shelter.state.$t}
          zip={shelter.zip.$t}
          phone={shelter.phone.$t}
          onClick={this.handleClick}
          clickedState={this.state.selectedShelterId}
        />
      );
    });

    return (
      <div>
        {shelters}
      </div>
    );
  }
}

export default Shelters;
