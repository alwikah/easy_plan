require 'test_helper'

class Usagers::RoutinesHelperTest < ActionView::TestCase

  # Test for the class method clean_params
  test 'should return relevant params' do
    dr1_params = {day: 'invalid day', presence: Usagers::DailyRoutine::AcceptablePresences.first, meal: Usagers::DailyRoutine::AcceptableMeals.first}
    dr2_params = {day: Usagers::DailyRoutine::AcceptableDays.first, presence: 'invalid presence', meal: Usagers::DailyRoutine::AcceptableMeals.first}
    dr3_params = {day: Usagers::DailyRoutine::AcceptableDays.first, meal: Usagers::DailyRoutine::AcceptableMeals.first}
    dr4_params = {day: Usagers::DailyRoutine::AcceptableDays.first, presence: Usagers::DailyRoutine::AcceptablePresences.first, meal: Usagers::DailyRoutine::AcceptableMeals.first}

    params = {
        daily_routines_attributes: [
          dr1_params, dr2_params, dr3_params, dr4_params
        ]
    }

    cleaned_params = {
            daily_routines_attributes: [
              dr4_params
            ]
        }

    assert Usagers::RoutinesHelper.clean_params(params) == cleaned_params

  end

end
