require 'test_helper'

class Usagers::DailyRoutinesControllerTest < ActionController::TestCase
  setup do
    usager = usagers(:one)
    routine = Usagers::Routine.create(owner: usager)
    @usagers_daily_routine = Usagers::DailyRoutine.create(routine: routine, day: Usagers::DailyRoutine::AcceptableDays.second)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usagers_daily_routines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usagers_daily_routine" do
    assert_difference('Usagers::DailyRoutine.count') do
      post :create, usagers_daily_routine: { day: @usagers_daily_routine.day, meal: @usagers_daily_routine.meal, presence: @usagers_daily_routine.presence, routine_id: @usagers_daily_routine.routine_id }
    end

    assert_redirected_to usagers_daily_routine_path(assigns(:usagers_daily_routine))
  end

  test "should show usagers_daily_routine" do
    get :show, id: @usagers_daily_routine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usagers_daily_routine
    assert_response :success
  end

  test "should update usagers_daily_routine" do
    put :update, id: @usagers_daily_routine, usagers_daily_routine: { day: @usagers_daily_routine.day, meal: @usagers_daily_routine.meal, presence: @usagers_daily_routine.presence, routine_id: @usagers_daily_routine.routine_id }
    assert_redirected_to usagers_daily_routine_path(assigns(:usagers_daily_routine))
  end

  test "should destroy usagers_daily_routine" do
    assert_difference('Usagers::DailyRoutine.count', -1) do
      delete :destroy, id: @usagers_daily_routine
    end

    assert_redirected_to usagers_daily_routines_path
  end
end
