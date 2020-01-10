require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @organisation = organisations(:one)
  end

  test "has 2 users" do
    assert_equal @organisation.users.count, 2
  end
end
