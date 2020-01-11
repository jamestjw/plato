class Subscription < ApplicationRecord
  belongs_to :organisation
  belongs_to :plan

  validates :organisation, :plan, presence: true


  enum duration_type: {
    "Monthly"     => 0, 
    "Annually"    => 1, 
  }
  validates :duration_type, inclusion: duration_types.keys
end
