require 'test_helper'

class BoardUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    test_login!
    @board_user = board_users(:one)
  end

  test "should fail to get index as normal user" do
    get board_users_url
    assert_redirected_to new_admin_session_url
  end

  test "should succeed to get index as admin" do
    test_logout!
    test_admin_login!
    get board_users_url
    assert_response :success
  end


  test "should get new" do
    get new_board_user_url
    assert_response :success
  end

  test "should create board_user" do
    test_logout!
    test_admin_login!
    @board_user = board_users(:two)
    assert_difference('BoardUser.count') do
      post board_users_url, params: { board_user: { board_id: @board_user.board_id, user_id: users(:four).id } }
    end

    assert_redirected_to board_url(BoardUser.last.board)
  end

  test "should show board_user" do
    get board_user_url(@board_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_user_url(@board_user)
    assert_response :success
  end

  test "should update board_user" do
    patch board_user_url(@board_user), params: { board_user: { board_id: @board_user.board_id, user_id: @board_user.user_id } }
    assert_redirected_to board_url(@board_user.board)
  end

  test "should destroy board_user" do
    board = @board_user.board
    assert_difference('BoardUser.count', -1) do
      delete board_user_url(@board_user)
    end

    assert_redirected_to board_url(board)
  end
end
