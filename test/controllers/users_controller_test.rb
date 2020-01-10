require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # @user = users(:one)
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end  



  test "should get new" do
    
    get new_user_registration_url
    assert_response :success
    assert_select 'em', '(6 characters minimum)'
  end

  test "should create user" do
    assert_difference('User.count') do
      post user_registration_url, params: { user: { email: 'test@test.com', name: @user.name, password: 'secret', organisation_ids: [:one] } }
    end
    assert_redirected_to root_url
  end

  test "should get edit" do
    test_login!

    get edit_user_registration_url(@user)
    assert_response :success
  end

  test "should update user" do
    test_login!
    patch user_registration_url, params: { user: { email: @user.email, name: @user.name, password: 'kaodim', password_confirmation: 'kaodim', current_password: 'kaodim'} }
    assert_redirected_to root_url
  end

  test "should destroy user" do
    test_login!

    assert_difference('User.count', -1) do
      delete user_registration_url
    end

    assert_redirected_to root_url
  end


  test "should prompt for login" do
    
    get new_user_session_url
    assert_response :success
    assert_select 'a', 'Forgot your password?'
  end

  test "should login" do
    
    user1 = users(:one)
    post user_session_url , params: { user: { email: user1.email, password: 'kaodim' } }
    assert_redirected_to root_url
    assert_equal user1, @controller.current_user
  end  

  test "should fail login" do
    
    user1 = users(:one)
    post user_session_url , params: { user: { email: user1.email, password: 'wrongpw' } }
    assert_select 'p.alert', 'Invalid Email or password.'
    assert_nil @controller.current_user
  end

  test "should logout" do
    delete destroy_user_session_url 
    assert_redirected_to root_url
    assert_nil @controller.current_user
  end  

end
