class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :card, null: false, foreign_key: true
      t.string :detail
      t.boolean :completed

      t.timestamps
    end
  end
end
