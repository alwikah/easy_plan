require 'test_helper'

class Usagers::DailyRoutinesHelperTest < ActionView::TestCase

  # Test for the class method clean_params
  test 'should return relevant params' do
    params = {day: 'invalid day', presence: Usagers::DailyRoutine::AcceptablePresences.first, meal: Usagers::DailyRoutine::AcceptableMeals.first}
    assert Usagers::DailyRoutinesHelper.clean_params(params).nil?

    params = {day: Usagers::DailyRoutine::AcceptableDays.first, presence: 'invalid presence', meal: Usagers::DailyRoutine::AcceptableMeals.first}
    assert Usagers::DailyRoutinesHelper.clean_params(params).nil?

    params = {day: Usagers::DailyRoutine::AcceptableDays.first, meal: Usagers::DailyRoutine::AcceptableMeals.first}
    assert Usagers::DailyRoutinesHelper.clean_params(params).nil?

    params = {day: Usagers::DailyRoutine::AcceptableDays.first, presence: Usagers::DailyRoutine::AcceptablePresences.first, meal: Usagers::DailyRoutine::AcceptableMeals.first}
    assert Usagers::DailyRoutinesHelper.clean_params(params) == params

  end
end
