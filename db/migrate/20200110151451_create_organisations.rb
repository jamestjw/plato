class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.text :description
      t.integer :created_by

      t.timestamps
    end
  end
end
