import React from 'react';
import { Callout } from 'react-foundation';

 const Shelter = props => {
  return(
    <div>
      <Callout className="callout">
        <div className="small-6 columns">
        <a>{props.name}</a><br/>
        </div>
      </Callout><br/>
    </div>
  );
};

export default Shelter;
