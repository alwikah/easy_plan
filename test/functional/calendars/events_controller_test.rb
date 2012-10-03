require 'test_helper'

class Calendars::EventsControllerTest < ActionController::TestCase
  setup do
    @calendars_event = calendars_events(:one)
    @calendars_event.owner = usagers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendars_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendars_event" do
    assert_difference('Calendars::Event.count') do
      post :create, calendars_event: { end_date: @calendars_event.end_date, owner_id: @calendars_event.owner.id, start_date: @calendars_event.start_date, title: @calendars_event.title }
    end

    assert_redirected_to calendars_events_path
  end

  test "should show calendars_event" do
    get :show, id: @calendars_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendars_event
    assert_response :success
  end

  test "should update calendars_event" do
    put :update, id: @calendars_event, calendars_event: { end_date: @calendars_event.end_date, owner_id: @calendars_event.owner.id, start_date: @calendars_event.start_date, title: @calendars_event.title}
    assert_redirected_to calendars_events_path
  end

  test "should destroy calendars_event" do
    assert_difference('Calendars::Event.count', -1) do
      delete :destroy, id: @calendars_event
    end

    assert_redirected_to calendars_events_path
  end
end
