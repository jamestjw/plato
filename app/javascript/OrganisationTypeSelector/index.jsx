import React from 'react';

import NoOrganisationType from './NoOrganisationType';
import IndividualOrganisationType from './IndividualOrganisationType';
import ExistingOrganisationType from './ExistingOrganisationType';
import NewOrganisationType from './NewOrganisationType';


class OrganisationTypeSelector extends React.Component {
    constructor(props) {
        super(props);
        this.onOrganisationTypeSelected = this.onOrganisationTypeSelected.bind(this);
        this.state = { selectedOrganisationType: null };
    }

    onOrganisationTypeSelected(event) {
        this.setState({ selectedOrganisationType: event.target.value });
    }

    render() {
        let OrganisationTypeCustomComponent = NoOrganisationType;
        if (this.state.selectedOrganisationType == 'No Organisation') {
            OrganisationTypeCustomComponent = IndividualOrganisationType;
        } else if (this.state.selectedOrganisationType == 'Existing') {
            OrganisationTypeCustomComponent = ExistingOrganisationType;
        } else if (this.state.selectedOrganisationType == 'New Organisation') {
            OrganisationTypeCustomComponent = NewOrganisationType;
        }

        return (
            <div>
                <div className="field">
                    <label htmlFor="user_organisation_type">
                        What organisation plan to choose?
                    </label>
                    <select id="user_organisation_type" name="user[organisation_type]" onChange={this.onOrganisationTypeSelected}>
                        <option value="">
                            Choose organisation type
                        </option>
                        <option value="Existing">
                            Join existing organisation
                        </option>
                        <option value="No Organisation">
                            Individual Plan
                        </option>
                        <option value="New Organisation">
                            Create new organisation
                        </option>
                    </select>
                </div>
                <OrganisationTypeCustomComponent organisations={this.props.organisations} />
            </div>
        );
    }
  }

export default OrganisationTypeSelector;