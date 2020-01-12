require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    test_login!
    @card = cards(:one)
  end

  test "should fail to get index as normal user" do
    get boards_url
    assert_redirected_to new_admin_session_url
  end

  test "should succeed to get index as admin" do
    test_logout!
    test_admin_login!
    get boards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { board_id: @card.board_id, color: @card.color, description: @card.description, title: @card.title } }
    end

    assert_redirected_to board_url(Card.last.board)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { board_id: @card.board_id, color: @card.color, description: @card.description, title: @card.title } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    board = @card.board
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to board_url(board)
  end
end
