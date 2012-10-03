require 'test_helper'

class Usagers::RoutinesControllerTest < ActionController::TestCase
  setup do
    @usagers_routine = usagers_routines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usagers_routines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usagers_routine" do
    assert_difference('Usagers::Routine.count') do
      post :create, usagers_routine: { owner_id: @usagers_routine.owner_id }
    end

    assert_redirected_to usagers_routine_path(assigns(:usagers_routine))
  end

  test "should show usagers_routine" do
    get :show, id: @usagers_routine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usagers_routine
    assert_response :success
  end

  test "should update usagers_routine" do
    put :update, id: @usagers_routine, usagers_routine: { owner_id: @usagers_routine.owner_id }
    assert_redirected_to usagers_routine_path(assigns(:usagers_routine))
  end

  test "should destroy usagers_routine" do
    assert_difference('Usagers::Routine.count', -1) do
      delete :destroy, id: @usagers_routine
    end

    assert_redirected_to usagers_routines_path
  end
end
