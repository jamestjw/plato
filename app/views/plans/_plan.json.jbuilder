json.extract! plan, :id, :no_of_users, :unlimited_boards, :active, :plan_type, :monthly_price, :annual_price, :additional_user_price, :created_at, :updated_at
json.url plan_url(plan, format: :json)
