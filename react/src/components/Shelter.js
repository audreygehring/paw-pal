import React, { Component } from 'react';
import { Callout } from 'react-foundation';

 const Shelter = props => {
   let onClick = () => {
     props.onClick(props.id);
   };

  let showDetails;
  if(props.clickedState === props.id) {
    showDetails =
    <div>
      <div>{props.address}</div>
      <div>{props.city}, {props.state} {props.zip}</div>
    </div>;
    }
 return(
   <div className="small-6 columns">
    <Callout className="callout" onClick = {onClick}>
      {props.name}
      {showDetails}
    </Callout>
   </div>
 );
};

export default Shelter;
