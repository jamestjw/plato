require 'test_helper'

class BoardUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user_must_belong_to_organisation" do
    # belongs to org2
    board = boards(:two)
    # belongs to org1
    user = users(:one)
    board_user = BoardUser.new(
      user: user,
      board: board
    )
    assert board_user.invalid?

    board_user.user = users(:four)
    assert board_user.valid?
  end

  test "same user cant be added twice to board" do
    board_user = BoardUser.new(
      user: users(:one),
      board: boards(:one)
    )
    assert board_user.invalid?
  end
end
