require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  test "subscription attributes must not be empty" do 
    subscription = Subscription.new
    assert subscription.invalid?
    assert subscription.errors[:organisation].any?
    assert subscription.errors[:plan].any?
    assert subscription.errors[:start_date].any? 
    assert subscription.errors[:end_date].any? 
    assert subscription.errors[:duration_type].any? 
  end

  test "subscription end date must be more than start date" do 
    subscription = Subscription.new
    subscription.organisation = Organisation.last
    subscription.plan = Plan.last
    subscription.start_date = Time.now
    subscription.duration_type = 'Monthly'

    assert subscription.invalid?
    assert_equal ["can't be blank"], subscription.errors[:end_date]

    subscription.end_date = Time.now
    assert subscription.invalid?
    assert_equal ["can't be in the past"], subscription.errors[:end_date]    

    subscription.end_date = 1.days.ago
    assert subscription.invalid?
    assert_equal ["can't be in the past"], subscription.errors[:end_date] 

    subscription.end_date = 1.days.from_now
    assert subscription.valid?

    subscription.end_date = 1.year.from_now
    assert subscription.valid?
  end
end

