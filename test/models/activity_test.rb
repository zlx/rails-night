require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  let(:activity) { create(:activity) }
  let(:user) { create(:user) }

  test "can_join? should call ongoing? and has_joined?" do
    #activity.expect(:ongoing?)
    #activity.expect(:has_joined?)
    #activity.can_join? user
  end

  test "ongoing? should return true when activity is ongoing" do
    
  end

  test "has_joined should return true when user has join the activity" do
    
  end

end
