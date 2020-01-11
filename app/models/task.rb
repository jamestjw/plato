class Task < ApplicationRecord
    validates :detail, presence: true

    belongs_to :card
end
