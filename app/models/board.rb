class Board < ApplicationRecord
    belongs_to :organisation, class_name: "Organisation", foreign_key: 'creator_id'
    has_many :cards, dependent: :destroy
    has_many :board_users, dependent: :destroy
    has_many :users, through: :board_users
end
