require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  context "POST :create" do
    should "login success with mock@easyread.ly" do
      post :create, {user: {email: 'mock@easyread.ly', password: 'password'}}

      assert_kind_of User, assigns(:user)
      assert_redirected_to root_path
      assert_not_nil session[:user_id]
    end

    should "login with error password should fail" do
      user = create(:user, email: 'mock@easyread.ly', password: 'password', password_confirmation: 'password')
      post :create, {user: {email: 'mock@easyread.ly', password: 'error_password'}}

      assert_equal user, assigns(:user)
      assert_redirected_to login_in_path
    end
  end

  context "DELETE :destroy" do
    should "delete session" do
      user = create(:user, email: 'mock@easyread.ly', password: 'password', password_confirmation: 'password')
      session[:user_id] = user
      delete :destroy

      assert_redirected_to root_path
      assert_nil session[:user_id]
    end
  end
end
