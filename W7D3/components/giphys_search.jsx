import React from 'react';

import GiphysIndex from './giphys_index';

class giphysSearch extends React.Component {
  constructor(){
    super();
    this.state = { searchTerm: 'corgis' };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  render(){
    return (
      <div>
        <form className="search-bar">
          <input onChange={this.handleChange} value={this.statesearchTerm}/>
          <button type="submit" onClick={this.handleSubmit}>Search</button>
        </form>
        <GiphysIndex giphys={this.props} />
      </div>
    );
  }

  handleChange(event){
    this.setState({searchTerm: event.currentTarget.value});
  }

  handleSubmit(event){
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }
}
export default giphysSearch;
