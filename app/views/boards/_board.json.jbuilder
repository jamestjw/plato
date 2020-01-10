json.extract! board, :id, :name, :active, :creator_id, :created_at, :updated_at
json.url board_url(board, format: :json)
