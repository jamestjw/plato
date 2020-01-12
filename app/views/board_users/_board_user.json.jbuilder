json.extract! board_user, :id, :user_id, :board_id, :created_at, :updated_at
json.url board_user_url(board_user, format: :json)
