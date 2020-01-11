import React from 'react';

class NewOrganisationPayType extends React.Component {
    render() {
        return (
            <div>
                <div className="field">
                    <label htmlFor="user_new_organisation_name">
                        Organisation Name
                    </label>
                    <input type="text" 
                                name="user[new_organisation_name]" 
                                id="user_new_organisation_name" 
                                />
                </div>

                <div className="field">
                    <label htmlFor="user_new_organisation_description">
                        Organisation Description
                    </label>
                    <input type="text" 
                                name="user[new_organisation_description]" 
                                id="user_new_organisation_description" 
                                />
                </div>
            </div>
        );          
    }
}

export default NewOrganisationPayType;
