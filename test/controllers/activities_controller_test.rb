require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  let(:activity) { create(:activity, author: create(:user)) }
  setup do
    activity
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_equal 1, assigns(:activities).size
  end

  test "should get past" do
    activity_past = create(:activity, status: 2)
    get :index
    assert_response :success
    assert_equal 1, assigns(:activities).size
  end

  test "should join activity" do
    login
    post :join, id: activity

    assert_equal [user], assigns(:activity).users
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, activity: { author: activity.author, description: activity.description, start_at: activity.start_at, summary: activity.summary, title: activity.title }
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should show activity" do
    get :show, id: activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: activity
    assert_response :success
  end

  test "should update activity" do
    patch :update, id: activity, activity: { author: activity.author, description: activity.description, start_at: activity.start_at, summary: activity.summary, title: activity.title }
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: activity
    end

    assert_redirected_to activities_path
  end
end
