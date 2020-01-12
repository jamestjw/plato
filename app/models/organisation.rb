class Organisation < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :user, :foreign_key => 'created_by'
    has_many :boards, class_name: "Board", foreign_key: 'creator_id', dependent: :destroy

    
    has_many :subscriptions, dependent: :destroy
    has_many :plans, through: :subscriptions

    validates :name, :description, :created_by, presence: true
    validates :name, uniqueness: {unique: true}    
    

    def self.new_org(name, description, user)
        org = Organisation.new
        org.name = name
        org.description = description
        org.user = user
        org.users << user
        org.save!
        org
    end

    def full?
        plan = plans.last
        num_users = users.count
        if (num_users >= plan.no_of_users) && plan.additional_user_price.nil?
            true
        else
            false
        end
    end

    def subscription_fees
        plan = plans.last
        num_users = users.count
        monthly_fees = plan.monthly_price 
        yearly_fees = plan.annual_price

        if num_users - plan.no_of_users > 0
            monthly_fees += plan.additional_user_price * (num_users - plan.no_of_users)
            yearly_fees += plan.additional_user_price * (num_users - plan.no_of_users)
        end

        unless plan.unlimited_boards 
            monthly_fees *= boards.count
            yearly_fees *= boards.count
        end

        yearly_fees *= 12
        {   
            monthly: monthly_fees,
            yearly: yearly_fees
        }
    end

    def contains_user?(userobj)
        users.include?(userobj)
    end
end
