require 'test_helper'

class Usagers::RoutineTest < ActiveSupport::TestCase
  test "I can create a Routine" do
    usager = usagers(:one)
    assert Usagers::Routine.create(owner: usager)
  end

  test "It should be possible to add DailyRoutines to a Routine" do
    usager = usagers(:one)
    routine = Usagers::Routine.create(owner: usager)
    Usagers::DailyRoutine.create(routine: routine, day: Usagers::DailyRoutine::AcceptableDays[1], presence: Usagers::DailyRoutine::AcceptablePresences[0])
    assert routine.daily_routines.count == 1
  end

  test "When a routine is deleted, all its dailyRoutines should be as well" do
    usager = usagers(:one)
    routine = Usagers::Routine.create(owner: usager)
    r1 = Usagers::DailyRoutine.new(day: Usagers::DailyRoutine::AcceptableDays[1], presence: Usagers::DailyRoutine::AcceptablePresences[0])
    r2 = Usagers::DailyRoutine.new(day: Usagers::DailyRoutine::AcceptableDays[3], presence: Usagers::DailyRoutine::AcceptablePresences[1])

    routine.daily_routines << r1
    routine.daily_routines << r2

    routine.save

    id_r1 = r1.id
    id_r2 = r2.id

    routine.destroy

    assert Usagers::DailyRoutine.where(:id => id_r1).empty?
    assert Usagers::DailyRoutine.where(:id => id_r2).empty?

  end
end
