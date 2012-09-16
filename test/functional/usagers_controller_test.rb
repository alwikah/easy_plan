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
end
