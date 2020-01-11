class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :board, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :color

      t.timestamps
    end
  end
end
