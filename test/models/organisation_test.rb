require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase
  setup do
    @organisation = organisations(:one)
  end

  test "has 1 users" do
    assert_equal @organisation.users.count, 1
  end

  test "organisation attributes must not be empty" do 
    organisation = Organisation.new
    assert organisation.invalid?
    assert organisation.errors[:name].any?
    assert organisation.errors[:description].any?
    assert organisation.errors[:created_by].any?
  end  

  test "organisation name uniqueness" do 
    newUser = users(:newUser)
    organisation = Organisation.new
    organisation.name = 'new org name'
    organisation.description = 'new org desc'
    organisation.user = newUser
    assert organisation.valid?

    organisation.name = Organisation.last.name
    assert organisation.invalid?
  end  
end
