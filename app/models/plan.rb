class Plan < ApplicationRecord
    has_many :subscriptions
    before_destroy :ensure_not_referenced_by_subscription

    enum plan_type: {
        "Solo"     => 0, 
        "Startup"    => 1, 
        "Enterprise"    => 2
    }
    validates :plan_type, inclusion: plan_types.keys


    class Error < StandardError
    end

    private 
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_subscription
        unless subscriptions.empty?
            raise Error.new "This plan is active."
        end
    end
end
