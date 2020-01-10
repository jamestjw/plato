class AddOrganisationOwnerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organisation_owner, :boolean, null: false, default: false
  end
end
