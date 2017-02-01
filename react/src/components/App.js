import React, { Component } from 'react';
import Shelter from './Shelter';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      // selectedShelterId: null
    };
    this.fetchData = this.fetchData.bind(this);
    // this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount(){
    this.fetchData();
    // setInterval(this.fetchData, 3000);
  }

  fetchData() {
    fetch(`/api/v1/shelters/${this.props.zip}`)

      .then(response => {
        if (response.ok) {
          return response.json();
      } else {
          let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })

      .then(response => response.json())
      .then(body => {
        this.setState({ data: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
    }
    // handleClick(id) {
    //   if (id === this.state.selectedShelterId) {
    //     this.setState({ selectedShelterId: null });
    //   } else {
    //     this.setState({ selectedShelterId: id });
    //   }
    // }

  render() {
    let shelters = this.state.data.map(shelter => {
      return (
        <Shelter
          key = {shelter.id}
          id = {shelter.id}
          name = {shelter.name}
          address = {shelter.address}
          city = {shelter.city}
          state = {shelter.state}
          zip = {shelter.zip}
          onClick = {this.handleClick}
          clickedState = {this.state.selectedShelterId}
        />
      );
    });

    return(
      <div>
        {shelters}
      </div>
    );
  }
}

export default App;
