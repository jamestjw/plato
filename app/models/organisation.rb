class Organisation < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :user, :foreign_key => 'created_by'
    has_many :boards, class_name: "Board", foreign_key: 'creator_id', dependent: :destroy

    
    has_many :subscriptions, dependent: :destroy
    has_many :plans, through: :subscriptions


    validates :name, :description, presence: true
    validates :name, uniqueness: {unique: true}    
    

    def self.new_org(name, description, user)
        org = Organisation.new
        org.name = name
        org.description = description
        org.user = user
        org.users << user
        org.save!
        return org
    end
end
