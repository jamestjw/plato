require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  test 'user sign up' do
    user_count = User.count
    sub_count = Subscription.count
    solo_plan = plans(:one)

    # A user goes to the homepage
    get "/"
    assert_redirected_to '/users/sign_in'
    follow_redirect!
    assert_select 'h2', 'Log in'

    post '/users', params: { user: { email: 'mark@kaodim.com', name: 'Mark', password: 'secret' } }
    assert_redirected_to '/'
    assert_equal user_count + 1,  User.count

    follow_redirect!
    assert_select 'h3', 'Subscription plan'
    post '/organisations/join', params: { "user"=>{
      "organisation_type"=>"New Organisation", 
      "new_organisation_name"=>"Touch and Go", 
      "new_organisation_description"=>"Touch and GoTouch and Go",
      "new_organisation_plan_type"=>"Startup", 
      "new_organisation_duration_type"=>"Monthly", 
      "new_organisation_end_date"=>"2020-01-18"
      } 
    }
    assert_equal sub_count + 1,  Subscription.count

    tng = Organisation.last
    assert_equal tng.name, "Touch and Go"
    assert_equal tng.description, "Touch and GoTouch and Go"
    assert_equal tng.plans.first.plan_type, "Startup"
    assert_equal tng.subscriptions.count, 1
    assert_equal tng.subscriptions.first.duration_type, "Monthly"
  end

  test 'user sign in and signs out' do
      # A user goes to the homepage, currently no one is logged in
      get "/"
      assert_redirected_to '/users/sign_in'
      follow_redirect!
      assert_select 'h2', 'Log in'

      # User signs in 
      post '/users/sign_in', params: { user: { email: 'james_tan97@outlook.com', password: 'kaodim' } }
      assert_redirected_to '/'
      follow_redirect!
      assert_select 'p.navbar-text', /Logged in as/
      assert_select 'p.navbar-text', /Nicolas/
      assert_select 'a.navbar-link', 'Logout'
      assert_select 'a.navbar-link', 'Edit profile'

      # User logs out 
      delete '/users/sign_out'
      assert_redirected_to '/'
      follow_redirect!
      
      # redirected to login
      assert_redirected_to '/users/sign_in'
      follow_redirect!
      assert_select 'a.navbar-link', 'Login'
      assert_select 'a.navbar-link', 'Sign up'
  end
end
