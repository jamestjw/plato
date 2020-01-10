class Organisation < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :user, :foreign_key => 'created_by'
    has_many :boards, class_name: "Board", foreign_key: 'creator_id', dependent: :destroy
end
