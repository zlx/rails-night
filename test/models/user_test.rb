require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email should limit xxx@easyread.ly" do
    user = build(:user, email: 'xxx@126.com', password: '12345', password_confirmation: '12345')
    assert !user.valid?, "email should be match xxx@easyread.ly"
  end

  test "admin? should return true for admin" do
    user = create(:user, email: 'mock@easyread.ly', password: '12345', password_confirmation: '12345')
    Settings.admin_emails << user.email.downcase

    assert user.admin?
  end
end
