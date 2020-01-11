class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :organisation, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :duration
      t.float :total_cost
      t.integer :duration_type

      t.timestamps
    end
  end
end
