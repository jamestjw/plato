require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_url
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post subscriptions_url, params: { subscription: { duration: @subscription.duration, duration_type: @subscription.duration_type, end_date: @subscription.end_date, organisation_id: @subscription.organisation_id, plan_id: @subscription.plan_id, start_date: @subscription.start_date, total_cost: @subscription.total_cost } }
    end

    assert_redirected_to subscription_url(Subscription.last)
  end

  test "should show subscription" do
    get subscription_url(@subscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_url(@subscription)
    assert_response :success
  end

  test "should update subscription" do
    patch subscription_url(@subscription), params: { subscription: { duration: @subscription.duration, duration_type: @subscription.duration_type, end_date: @subscription.end_date, organisation_id: @subscription.organisation_id, plan_id: @subscription.plan_id, start_date: @subscription.start_date, total_cost: @subscription.total_cost } }
    assert_redirected_to subscription_url(@subscription)
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete subscription_url(@subscription)
    end

    assert_redirected_to subscriptions_url
  end
end
