import React           from 'react'              
import ReactDOM        from 'react-dom'           
import OrganisationTypeSelector from 'OrganisationTypeSelector'     

document.addEventListener('turbolinks:load', () => {       
  var element = document.getElementById("organisation-type-component"); 
  const data = JSON.parse(element.getAttribute('data'));
  ReactDOM.render(<OrganisationTypeSelector organisations={data} />, element);                 
});