ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def test_logout!
    sign_out users(:one)
  end

  def test_login!
    login_as( users(:one), :scope => :user)
  end

  def test_admin_login!
    login_as( admins(:one), :scope => :admin)
  end

  # def setup
  #   test_login!
  # end
end

class ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  def test_logout!
    sign_out users(:one)
  end

  def test_login!
    login_as( users(:one), :scope => :user)
  end

  def test_admin_login!
    login_as( admins(:one), :scope => :admin)
  end

  def setup
    test_admin_login!
  end
end