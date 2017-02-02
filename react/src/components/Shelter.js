import React, { Component } from 'react';
import { Callout } from 'react-foundation';
import ShelterTile from './ShelterTile';

 class Shelter extends Component {
   constructor(props) {
     super(props);
     this.state = {
       selectedShelterId: null
     };
     this.handleClick = this.handleClick.bind(this);
   }

   handleClick(id) {
    if (id === this.state.selectedShelterId) {
      this.setState({ selectedShelterId: null });
    } else {
      this.setState({ selectedShelterId: id });
    }
  }

  render () {
    return(
      <div>
        <div className="small-6 columns">
          <Callout className="callout">
            {this.props.name}
          </Callout>
        </div>

        <ShelterTile
          id = {this.props.id}
          name = {this.props.name}
          address = {this.props.address}
          city = {this.props.city}
          state = {this.props.state}
          zip = {this.props.zip}
          phone = {this.props.phone}
          onClick = {this.handleClick}
          clickedState = {this.state.selectedShelterId}
        />
      </div>
    );
  }
}

export default Shelter;
