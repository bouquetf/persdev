require 'test_helper'

class DayActionsControllerTest < ActionController::TestCase
  setup do
    @day_action = day_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_action" do
    assert_difference('DayAction.count') do
      post :create, day_action: { action: @day_action.action, day: @day_action.day, duration: @day_action.duration, importance: @day_action.importance, target: @day_action.target, target: @day_action.target, user_id: @day_action.user_id }
    end

    assert_redirected_to day_action_path(assigns(:day_action))
  end

  test "should show day_action" do
    get :show, id: @day_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_action
    assert_response :success
  end

  test "should update day_action" do
    patch :update, id: @day_action, day_action: { action: @day_action.action, day: @day_action.day, duration: @day_action.duration, importance: @day_action.importance, target: @day_action.target, target: @day_action.target, user_id: @day_action.user_id }
    assert_redirected_to day_action_path(assigns(:day_action))
  end

  test "should destroy day_action" do
    assert_difference('DayAction.count', -1) do
      delete :destroy, id: @day_action
    end

    assert_redirected_to day_actions_path
  end
end
