require "application_system_test_case"

class SubscriptionsTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  setup do
    @subscription = subscriptions(:one)
  end

  test "visiting the index" do
    visit subscriptions_url
    assert_selector "h1", text: "Subscriptions"
  end

  test "creating a Subscription" do
    visit subscriptions_url
    click_on "New Subscription"

    select '2025',  from: 'subscription_end_date_1i'
    select 'January',  from: 'subscription_end_date_2i'
    select '1', from: 'subscription_end_date_3i'
    
    select '2025',  from: 'subscription_end_date_1i'
    select 'January',  from: 'subscription_end_date_2i'
    select '1', from: 'subscription_end_date_3i'

    fill_in "Duration", with: @subscription.duration
    # fill_in "Duration type", with: @subscription.duration_type
    fill_in "Organisation", with: @subscription.organisation_id
    fill_in "Plan", with: @subscription.plan_id
    fill_in "Total cost", with: @subscription.total_cost
    click_on "Create Subscription"

    assert_text "Subscription was successfully created"
    click_on "Back"
  end

  test "updating a Subscription" do
    visit subscriptions_url
    click_on "Edit", match: :first, exact: true

    fill_in "Duration", with: @subscription.duration
    # fill_in "Duration type", with: @subscription.duration_type

    select '2025',  from: 'subscription_end_date_1i'
    select 'January',  from: 'subscription_end_date_2i'
    select '1', from: 'subscription_end_date_3i'

    select '2025',  from: 'subscription_end_date_1i'
    select 'January',  from: 'subscription_end_date_2i'
    select '1', from: 'subscription_end_date_3i'


    fill_in "Organisation", with: @subscription.organisation_id
    fill_in "Plan", with: @subscription.plan_id
    fill_in "Total cost", with: @subscription.total_cost
    click_on "Update Subscription"

    assert_text "Subscription was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription" do
    visit subscriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription was successfully destroyed"
  end
end
