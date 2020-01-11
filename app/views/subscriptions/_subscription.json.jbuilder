json.extract! subscription, :id, :organisation_id, :plan_id, :start_date, :end_date, :duration, :total_cost, :duration_type, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
