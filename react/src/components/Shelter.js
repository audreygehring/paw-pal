import React, { Component } from 'react';
import { Callout } from 'react-foundation';

 class Shelter extends Component {
   constructor(props) {
     super(props);
     this.state = {
    };
  }

  render() {
    let showDetails;
    if (this.props.clickedState === this.props.id) {
      showDetails =
        <div>
          <div>{this.props.address}</div>
          <div>{this.props.city}, {this.props.state} {this.props.zip}</div><br/>
          <a className="button small" href={`/shelters/${this.props.id}${this.props.zip}`}>More</a>
        </div>;
      }

      let onClick = () => {
        this.props.onClick(this.props.id);
      };

   return(
     <div className="large-6 small-6 columns">
      <Callout id="shelters-index">
        <div onClick={onClick}>
          {this.props.name}
          {showDetails}
        </div>
      </Callout>
    </div>
   );
  }
}

export default Shelter;
