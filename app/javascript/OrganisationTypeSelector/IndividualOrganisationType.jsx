import React from 'react';

class IndividualOrganisationType extends React.Component {
    render() {
        return (
            <div>
                <div className="field">
                    <label htmlFor="user_new_organisation_duration_type">
                        Which subscription plan to choose?
                    </label>
                    <select id="user_new_organisation_duration_type" name="user[new_organisation_duration_type]">
                        <option value="Monthly">
                            Monthly Package- $2/user/month
                        </option>
                        <option value="Annually">
                            Annual Package - $2/user/month
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

export default IndividualOrganisationType;