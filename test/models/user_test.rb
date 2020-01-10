require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  test "has 1 org" do
    assert_equal @user.organisations.count, 1
  end  
end
