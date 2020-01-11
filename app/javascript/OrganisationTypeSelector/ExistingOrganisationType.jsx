import React from 'react';

class ExistingOrganisationType extends React.Component {
    createForm = () => {
        let options = []
        this.props.organisations.forEach( organisation => {
            options.push(
                <option value={organisation.id}>
                    {organisation.name}
                </option>
            )
        })
        return options
    }

    render() {
        return (
            <div className="field">
                <label htmlFor="user_existing_organisation">
                    Which one?
                </label>
                <select id="user_existing_organisation" name="user[existing_organisation]">
                    {this.createForm()}
                </select>
            </div>
        );          
    }
}

export default ExistingOrganisationType;