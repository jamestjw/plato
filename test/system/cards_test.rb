require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "creating a Card" do
    visit cards_url
    click_on "New Card"

    fill_in "Board", with: @card.board_id
    fill_in "Color", with: @card.color
    fill_in "Description", with: @card.description
    fill_in "Title", with: @card.title
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit cards_url
    click_on "Edit", match: :first, exact: true

    fill_in "Board", with: @card.board_id
    fill_in "Color", with: @card.color
    fill_in "Description", with: @card.description
    fill_in "Title", with: @card.title
    click_on "Update Card"

    assert_text "Card was successfully updated"
  end

  test "destroying a Card" do
    visit cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
