class CreateOrganisationsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    # # This is enough but
    # create_join_table :organisations, :users
  
    # If you want to add an index for faster querying through this join:
    create_join_table :organisations, :users do |t|
      t.index :organisation_id
      t.index :user_id
    end
  end
end
