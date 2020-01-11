class Board < ApplicationRecord
    belongs_to :organisation, class_name: "Organisation", foreign_key: 'creator_id'
    has_many :cards, dependent: :destroy
end
