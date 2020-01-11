require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan = plans(:one)
  end

  test "should get index" do
    get plans_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_url
    assert_response :success
  end

  test "should create plan" do
    assert_difference('Plan.count') do
      post plans_url, params: { plan: { active: @plan.active, additional_user_price: @plan.additional_user_price, annual_price: @plan.annual_price, monthly_price: @plan.monthly_price, no_of_users: @plan.no_of_users, plan_type: @plan.plan_type, unlimited_boards: @plan.unlimited_boards } }
    end

    assert_redirected_to plan_url(Plan.last)
  end

  test "should show plan" do
    get plan_url(@plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_url(@plan)
    assert_response :success
  end

  test "should update plan" do
    patch plan_url(@plan), params: { plan: { active: @plan.active, additional_user_price: @plan.additional_user_price, annual_price: @plan.annual_price, monthly_price: @plan.monthly_price, no_of_users: @plan.no_of_users, plan_type: @plan.plan_type, unlimited_boards: @plan.unlimited_boards } }
    assert_redirected_to plan_url(@plan)
  end

  test "should fail to destroy plan" do
    assert_difference('Plan.count', 0) do
      delete plan_url(@plan)
    end

    assert_redirected_to plans_url
  end
end
