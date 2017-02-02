import React from 'react';
import { Callout } from 'react-foundation';

 const Shelter = props => {
  return(
    <div className="small-6 columns">
      <Callout className="callout">
        {props.name}
      </Callout>
    </div>
  );
};

export default Shelter;
