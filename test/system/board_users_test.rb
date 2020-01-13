require "application_system_test_case"

class BoardUsersTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  setup do
    @board_user = board_users(:two)
  end

  test "visiting the index" do
    visit board_users_url
    assert_selector "h1", text: "Board Users"
  end

  test "creating a Board user" do
    @user = users(:four)
    visit board_users_url
    click_on "New Board User"

    fill_in "Board", with: @board_user.board_id
    fill_in "User", with: @user.id
    click_on "Add user to board"

    assert_text "Successfully added #{@user.name} to the board."
    click_on "Back"
  end

  test "updating a Board user" do
    visit board_users_url
    click_on "Edit", match: :first, exact: true

    fill_in "Board", with: @board_user.board_id
    fill_in "User", with: @board_user.user_id
    click_on "Add user to board"

    assert_text "Board user was successfully updated"
    click_on "Back"
  end

  test "destroying a Board user" do
    visit board_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board user was successfully destroyed"
  end
end
