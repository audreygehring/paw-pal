import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import Search from './components/Search';

$(function() {
  ReactDOM.render(
    <Search />,
    document.getElementById('search-bar')
  );
});

$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
  );
});
