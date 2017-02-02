import React from 'react';

const ShelterTile = props => {
  let onClick = () => {
    props.onClick(props.id);
  };

  let showDetails;
  if(props.clickedState === props.id) {
    showDetails = <div>
        <p>{props.name}</p>
        <p>{props.address}</p>
        <p>{props.city}, {props.state} {props.zip}</p>
      </div>;
    }
 return(
   <div>
    <p onClick = {onClick}></p>
      {showDetails}
   </div>
 );
};

export default ShelterTile;
