require 'test_helper'

class DayAgendasControllerTest < ActionController::TestCase
  setup do
    @day_agenda = day_agendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_agendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_agenda" do
    assert_difference('DayAgenda.count') do
      post :create, day_agenda: { actions: @day_agenda.actions, agenda: @day_agenda.agenda, date: @day_agenda.date, quote: @day_agenda.quote, success: @day_agenda.success, targets: @day_agenda.targets, user_id: @day_agenda.user_id }
    end

    assert_redirected_to day_agenda_path(assigns(:day_agenda))
  end

  test "should show day_agenda" do
    get :show, id: @day_agenda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_agenda
    assert_response :success
  end

  test "should update day_agenda" do
    patch :update, id: @day_agenda, day_agenda: { actions: @day_agenda.actions, agenda: @day_agenda.agenda, date: @day_agenda.date, quote: @day_agenda.quote, success: @day_agenda.success, targets: @day_agenda.targets, user_id: @day_agenda.user_id }
    assert_redirected_to day_agenda_path(assigns(:day_agenda))
  end

  test "should destroy day_agenda" do
    assert_difference('DayAgenda.count', -1) do
      delete :destroy, id: @day_agenda
    end

    assert_redirected_to day_agendas_path
  end
end
