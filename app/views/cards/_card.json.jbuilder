json.extract! card, :id, :board_id, :title, :description, :color, :created_at, :updated_at
json.url card_url(card, format: :json)
