class Subscription < ApplicationRecord
  belongs_to :organisation
  belongs_to :plan

  validates :organisation, :plan, presence: true
  validates :start_date, :end_date, presence: true
  validate :end_date_cannot_be_in_the_past


  enum duration_type: {
    "Monthly"     => 0, 
    "Annually"    => 1, 
  }
  validates :duration_type, inclusion: duration_types.keys

  private
  def end_date_cannot_be_in_the_past
    if end_date.present? && (end_date.to_date <= start_date.to_date)
      errors.add(:end_date, "can't be in the past")
      throw :abort
    end
  end     
end
