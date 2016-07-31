require 'test_helper'

class MonthActionsControllerTest < ActionController::TestCase
  setup do
    @month_action = month_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:month_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create month_action" do
    assert_difference('MonthAction.count') do
      post :create, month_action: { month: @month_action.month, result: @month_action.result, target: @month_action.target, user_id: @month_action.user_id }
    end

    assert_redirected_to month_action_path(assigns(:month_action))
  end

  test "should show month_action" do
    get :show, id: @month_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @month_action
    assert_response :success
  end

  test "should update month_action" do
    patch :update, id: @month_action, month_action: { month: @month_action.month, result: @month_action.result, target: @month_action.target, user_id: @month_action.user_id }
    assert_redirected_to month_action_path(assigns(:month_action))
  end

  test "should destroy month_action" do
    assert_difference('MonthAction.count', -1) do
      delete :destroy, id: @month_action
    end

    assert_redirected_to month_actions_path
  end
end
