require 'test_helper'

class OrganisationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organisation = organisations(:one)
  end

  test "should fail to get index as normal user" do
    test_login!
    get organisations_url
    assert_redirected_to new_admin_session_url
  end

  test "should succeed to get index as admin" do
    test_admin_login!
    get organisations_url
    assert_response :success
  end

  test "should get new" do
    test_login!
    get new_organisation_url
    assert_response :success
  end

  test "should create organisation" do
    test_login!
    assert_difference('Organisation.count') do
      post organisations_url, params: { organisation: { created_by: @organisation.created_by, description: @organisation.description, name:'new organisation'} }
    end

    assert_redirected_to organisation_url(Organisation.last)
  end

  test "should show organisation" do
    test_admin_login!
    get organisation_url(@organisation)
    assert_response :success
  end

  test "should get edit" do
    test_admin_login!
    get edit_organisation_url(@organisation)
    assert_response :success
  end

  test "should update organisation" do
    test_admin_login!
    patch organisation_url(@organisation), params: { organisation: { created_by: @organisation.created_by, description: @organisation.description, name: @organisation.name } }
    assert_redirected_to organisation_url(@organisation)
  end

  test "should destroy organisation" do
    test_admin_login!
    assert_difference('Organisation.count', -1) do
      delete organisation_url(@organisation)
    end

    assert_redirected_to organisations_url
  end

  test "should fail to join organisation (not logged in)" do
    org_count = Organisation.count
    assert_difference('Subscription.count', 0 ) do
      post '/organisations/join', params: { "user"=>{
        "organisation_type"=>"New Organisation", 
        "new_organisation_name"=>"Daniel company", 
        "new_organisation_description"=>"lorem ipsim dolor sit amet",
        "new_organisation_plan_type"=>"Startup", 
        "new_organisation_duration_type"=>"Monthly", 
        "new_organisation_end_date"=>150.days.from_now.strftime("%Y-%m-%d")
        } 
      }    
    end
    assert_equal org_count, Organisation.count
  end

  test "should succeed to join new organisation (logged in)" do
    login_as users(:newUser), :scope => :user
    org_count = Organisation.count
    assert_difference('Subscription.count', 1) do
      post '/organisations/join', params: { "user"=>{
        "organisation_type"=>"New Organisation", 
        "new_organisation_name"=>"Daniel company", 
        "new_organisation_description"=>"lorem ipsum dolor sit amet",
        "new_organisation_plan_type"=>"Startup", 
        "new_organisation_duration_type"=>"Monthly", 
        "new_organisation_end_date"=>150.days.from_now.strftime("%Y-%m-%d")
        } 
      }    
    end
    assert_equal org_count + 1, Organisation.count
  end

  test "should succeed to join existing organisation (logged in)" do
    # no new subscription or organisation when joining existing organisation
    login_as users(:newUser), :scope => :user
    org_count = Organisation.count
    org = organisations(:two)
    org_user_count = org.users.count

    assert_difference('Subscription.count', 0) do
      post '/organisations/join', params: { "user"=>{
        "organisation_type"=>"Existing", 
        "existing_organisation"=> org.id, 
        } 
      }    
    end
    assert_equal org_count, Organisation.count
    assert_equal org_user_count + 1, org.users.count
  end

  test "should fail to join existing but full organisation (logged in)" do
    # no new subscription or organisation when joining existing organisation
    login_as users(:newUser), :scope => :user
    org_count = Organisation.count
    org = organisations(:one)
    org_user_count = org.users.count

    assert_difference('Subscription.count', 0) do
      post '/organisations/join', params: { "user"=>{
        "organisation_type"=>"Existing", 
        "existing_organisation"=> org.id, 
        } 
      }    
    end
    assert_equal org_count, Organisation.count
    assert_equal org_user_count , org.users.count
    follow_redirect! 
    assert_select "p#alert", "This organisation is already full."
  end

  test "should succeed to create new solo organisation (logged in)" do
    login_as users(:newUser), :scope => :user
    org_count = Organisation.count
    assert_difference('Subscription.count', 1) do
      post '/organisations/join', params: { "user"=>{
        "organisation_type"=>"New Organisation", 
        "new_organisation_name"=>"Daniel company", 
        "new_organisation_description"=>"lorem ipsum dolor sit amet",
        "new_organisation_plan_type"=>"Solo", 
        "new_organisation_duration_type"=>"Monthly", 
        "new_organisation_end_date"=>150.days.from_now.strftime("%Y-%m-%d")
        } 
      }    
    end
    assert_equal org_count + 1, Organisation.count
    assert Organisation.last.full?
  end 
end
