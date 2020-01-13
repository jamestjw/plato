require "application_system_test_case"

class PlansTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  setup do
    @plan = plans(:solo)
  end

  test "visiting the index" do
    visit plans_url
    assert_selector "h1", text: "Plans"
  end

  test "creating a Plan" do
    visit plans_url
    click_on "New Plan"

    check "Active" if @plan.active
    fill_in "Additional user price", with: @plan.additional_user_price
    fill_in "Annual price", with: @plan.annual_price
    fill_in "Monthly price", with: @plan.monthly_price
    fill_in "No of users", with: @plan.no_of_users
    # fill_in "Plan type", with: @plan.plan_type
    check "Unlimited boards" if @plan.unlimited_boards
    click_on "Create Plan"

    assert_text "Plan was successfully created"
    click_on "Back"
  end

  test "updating a Plan" do
    visit plans_url
    click_on "Edit", match: :first, exact: true

    check "Active" if @plan.active
    fill_in "Additional user price", with: @plan.additional_user_price
    fill_in "Annual price", with: @plan.annual_price
    fill_in "Monthly price", with: @plan.monthly_price
    fill_in "No of users", with: @plan.no_of_users
    # fill_in "Plan type", with: @plan.plan_type
    check "Unlimited boards" if @plan.unlimited_boards
    click_on "Update Plan"

    assert_text "Plan was successfully updated"
    click_on "Back"
  end

  # TODO: choose non active plan
  # test "destroying a Plan" do
  #   visit plans_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Plan was successfully destroyed"
  # end
end
