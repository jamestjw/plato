require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in 'Card', with: @task.card.id
    check "Completed" if @task.completed
    fill_in "Detail", with: @task.detail
    click_on "Create Task"

    assert_text "Task was successfully created"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first, exact: true

    check "Completed" if @task.completed
    fill_in "Detail", with: @task.detail
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end
