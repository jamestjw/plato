require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest

  test 'user sign up' do
    user_count = User.count
    sub_count = Subscription.count
    solo_plan = plans(:solo)

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
    assert_difference "Organisation.count" do
      post '/organisations/join', params: { "user"=>{
        "organisation_type"=>"New Organisation", 
        "new_organisation_name"=>"Touch and Go", 
        "new_organisation_description"=>"Touch and GoTouch and Go",
        "new_organisation_plan_type"=>"Startup", 
        "new_organisation_duration_type"=>"Monthly", 
        "new_organisation_end_date"=>150.days.from_now.strftime("%Y-%m-%d")
        } 
      }
    end
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
      assert_select 'a.navbar-link', 'User Login'
      assert_select 'a.navbar-link', 'Sign up'
  end

  test 'organisation payment fees' do
      assert_difference('User.count',6) do
        (1..6).to_a.each do |i|
          signup_and_signout("User#{i}")
        end
      end

      post '/users/sign_in', params: { user: { email: 'User1@kaodim.com', password: 'secret' } }

      post '/organisations/join', params: { "user"=>{
        "organisation_type"=>"New Organisation", 
        "new_organisation_name"=>"Kaodim", 
        "new_organisation_description"=>"RedRedRed",
        "new_organisation_plan_type"=>"Startup", 
        "new_organisation_duration_type"=>"Monthly", 
        "new_organisation_end_date"=>150.days.from_now.strftime("%Y-%m-%d")
        } 
      }   
      assert_equal "Kaodim", Organisation.last.name 
      assert_equal 1, Organisation.last.users.count
      kaodim = Organisation.last
      assert_fees 20, 216, kaodim


      ## max capacity price same as base price
      assert_difference('kaodim.users.count',4) do
        (2..5).to_a.each do |i|
          kaodim.users << User.where(name: "User#{i}")
        end
      end
      assert_fees 20, 216, kaodim

      ## price with one additional user
      kaodim.users << User.where(name: "User6")
      assert_fees 27, 300, kaodim
  end

  private
  def signup_and_signout(name)
    post '/users', params: { user: { email: "#{name}@kaodim.com", name: name, password: 'secret' } }
    delete '/users/sign_out'
  end

  def assert_fees(expected_monthly, expected_yearly, org)
      fees = org.subscription_fees
      monthly_fees = fees[:monthly]
      annual_fees = fees[:yearly]
      assert_equal monthly_fees, expected_monthly
      assert_equal annual_fees, expected_yearly
  end
end
