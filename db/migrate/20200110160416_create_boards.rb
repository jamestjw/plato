class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.boolean :active
      t.integer :creator_id

      t.timestamps
    end
  end
end
