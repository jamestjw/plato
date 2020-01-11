class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.integer :no_of_users, null: false, default: 1
      t.boolean :unlimited_boards, null: false, default: false
      t.boolean :active, null: false, default: true
      t.integer :plan_type, null: false
      t.float :monthly_price, null: false
      t.float :annual_price
      t.float :additional_user_price

      t.timestamps
    end
  end
end
