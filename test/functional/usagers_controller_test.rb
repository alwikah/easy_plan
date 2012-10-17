require 'test_helper'

class UsagersControllerTest < ActionController::TestCase
  setup do
    @usager = usagers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usagers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usager" do
    assert_difference('Usager.count') do
      post :create, usager: { given_name: 'Billy', family_name: 'Helliot', birth_date: '1992-06-17' }
    end

    assert_redirected_to usagers_path
  end

  test "should show usager" do
    get :show, id: @usager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usager
    assert_response :success
  end

  test "should update usager" do
    put :update, id: @usager, usager: { given_name: @usager.given_name, family_name: @usager.family_name, birth_date: @usager.birth_date }
    assert_redirected_to usager_path(assigns(:usager))
  end

  test "should destroy usager" do
    assert_difference('Usager.count', -1) do
      delete :destroy, id: @usager
    end

    assert_redirected_to usagers_path
  end

  # ------------------------------------------------------
  # ------------- Routines and DailyRoutines -------------
  # ------------------------------------------------------

  test 'should create a usager with a routine that has daily_routines set' do
    assert_difference('Usagers::Routine.count + Usagers::DailyRoutine.count', 3) do
      post :create, usager: {
          given_name: 'Billy', family_name: 'Helliot', routine_attributes: {
              daily_routines_attributes: [
                  {day: Usagers::DailyRoutine::AcceptableDays.first, presence: Usagers::DailyRoutine::AcceptablePresences.sample, meal: Usagers::DailyRoutine::AcceptableMeals.sample},
                  {day: Usagers::DailyRoutine::AcceptableDays[2], presence: Usagers::DailyRoutine::AcceptablePresences.sample, meal: Usagers::DailyRoutine::AcceptableMeals.sample}
              ]
          }
      }
    end
  end

  test 'should create a usager with a routine that has daily_routines set, without invalid daily_routines sent' do
    assert_difference('Usagers::Routine.count + Usagers::DailyRoutine.count', 3) do
      post :create, usager: {
          given_name: 'Billy', family_name: 'Helliot', routine_attributes: {
              daily_routines_attributes: [
                  {day: Usagers::DailyRoutine::AcceptableDays[-1], presence: Usagers::DailyRoutine::AcceptablePresences.sample, meal: Usagers::DailyRoutine::AcceptableMeals.sample},
                  {day: Usagers::DailyRoutine::AcceptableDays[-2], presence: Usagers::DailyRoutine::AcceptablePresences.sample, meal: Usagers::DailyRoutine::AcceptableMeals.sample},
                  {day: '', presence: Usagers::DailyRoutine::AcceptablePresences.sample, meal: Usagers::DailyRoutine::AcceptableMeals.sample},
                  {day: Usagers::DailyRoutine::AcceptableDays[2], presence: '', meal: Usagers::DailyRoutine::AcceptableMeals.sample}
              ]
          }
      }
    end
  end

end
