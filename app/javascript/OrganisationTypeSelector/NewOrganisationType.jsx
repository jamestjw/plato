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

                <div className="field">
                    <label htmlFor="user_new_organisation_plan_type">
                        Which enterprise plan to choose?
                    </label>
                    <select id="user_new_organisation_plan_type" name="user[new_organisation_plan_type]">
                        <option value="Startup">
                            Startup
                        </option>
                        <option value="Enterprise">
                            Enterprise
                        </option>
                    </select>
                </div>       

                <div className="field">
                    <label htmlFor="user_new_organisation_duration_type">
                        Which subscription plan to choose?
                    </label>
                    <select id="user_new_organisation_duration_type" name="user[new_organisation_duration_type]">
                        <option value="Monthly">
                            Monthly Package
                        </option>
                        <option value="Annually">
                            Annual Package
                        </option>
                    </select>
                </div>    

                <div className="field">
                    <label htmlFor="user_new_organisation_end_date">
                        End of Subscription
                    </label>
                    <input type="date" id="user_new_organisation_end_date" name="user[new_organisation_end_date]" />
                </div>                
            </div>
        );          
    }
}


export default NewOrganisationPayType;
