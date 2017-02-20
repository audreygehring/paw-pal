import Shelters from 'components/Shelters';
import Shelter from 'components/Shelter';
import { shallow } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('Shelters', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = shallow(<Shelters />);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({ data: [] });
  })

  it('should render the shelter component when the props are received', () => {
    wrapper.setState({ data: { "shelters": [
        {
          "country": {
            "$t": "US"
          },
          "longitude": {
            "$t": "-89.4918"
          },
          "name": {
            "$t": "Companion Animal Hospital"
          },
          "phone": {
            "$t": "(608) 277-8888"
          },
          "state": {
            "$t": "WI"
          },
          "address2": {},
          "email": {},
          "city": {
            "$t": "Madison"
          },
          "zip": {
            "$t": "53719"
          },
          "fax": {},
          "latitude": {
            "$t": "43.0296"
          },
          "id": {
            "$t": "WI304"
          },
          "address1": {
            "$t": "660 South Gammon Road"
          }
        }
      ]}
    });
    expect(wrapper.find(Shelter).props()).toEqual({

    })
  });
});
