import React, { Component } from 'react';
import { Callout } from 'react-foundation';

 class Shelter extends Component {
   constructor(props) {
     super(props);
     this.state = {
       shelterId: null
     };
     this.showClick = this.showClick.bind(this);
   }

    showClick(event) {
      this.setState({ shelterId: this.props.id });
    }





  render() {
    let showDetails;
    if (this.props.clickedState === this.props.id) {
      showDetails =
        <div>
          <div>{this.props.address}</div>
          <div>{this.props.city}, {this.props.state} {this.props.zip}</div>
        </div>;
      }

      let onClick = () => {
        this.props.onClick(this.props.id);
      };

   return(
     <div className="small-6 columns">
      <Callout>
        <div className="small-8 columns" onClick={onClick}>
          {this.props.name}
          {showDetails}
        </div>
        <div className="small-4 columns">
          <div onClick={this.showClick}>More</div>
        </div>
      </Callout>
    </div>
   );
  }
}

export default Shelter;
