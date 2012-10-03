require 'test_helper'

class Usagers::DailyRoutineTest < ActiveSupport::TestCase
  test 'It should create a DailyRoutine' do
    usager = usagers(:one)
    routine = usagers_routines(:one)
    routine.owner = usager
    routine.save
    assert Usagers::DailyRoutine.create(routine: routine)
  end

  test 'It should not create a DailyRoutine with non valid day' do
    usager = usagers(:one)
    routine = usagers_routines(:one)
    routine.owner = usager
    routine.save
    dr = Usagers::DailyRoutine.create(routine: routine, day: 'not valid', presence: 'not valid', meal: 'not valid')
    assert !dr.valid?
    assert !dr.errors[:day].empty?
    assert !dr.errors[:presence].empty?
    assert !dr.errors[:meal].empty?

    dr.day = Usagers::DailyRoutine::AcceptableDays.first

    dr.save
    assert !dr.valid?
    # Now day should be ok
    assert dr.errors[:day].empty?

    assert !dr.errors[:presence].empty?
    assert !dr.errors[:meal].empty?

    dr.day = Usagers::DailyRoutine::AcceptablePresences.first

    dr.save
    assert !dr.valid?

    # Now day and presence should be ok
    assert dr.errors[:day].empty?
    assert dr.errors[:presence].empty?

    assert !dr.errors[:meal].empty?

    dr.day = Usagers::DailyRoutine::AcceptableMeals.first

    dr.save
    assert dr.valid?
  end
end
