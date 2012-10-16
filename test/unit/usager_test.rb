require 'test_helper'

class UsagerTest < ActiveSupport::TestCase
  test "I can create a Usager" do
    assert Usager.create(given_name: 'Geoarge', family_name: 'Mimo', birth_date: '1975-07-01')
  end

  test "The Usager should have a full_name response based on its given and family names" do
    usager = Usager.create(given_name: 'louis', family_name: 'lolita')
    assert usager.full_name == "Louis Lolita"
  end

  test 'Destroying the Usager should destroy its routine' do
    usager = Usager.create(given_name: 'Testify', family_name: 'Bloup')
    usager.routine = Usagers::Routine.create
    usager.save

    assert !usager.routine.nil?

    id_routine = usager.routine.id
    usager.destroy

    assert Usagers::Routine.where(id: id_routine).empty?
  end

  test 'should not create a Usager if given_name and/or family_name is/are missing' do
    u2 = Usager.create(given_name: 'Given name', family_name: '', birth_date: '1975-07-01')
    u3 = Usager.create(given_name: '', family_name: '', birth_date: '1975-07-01')
    u1 = Usager.create(given_name: '', family_name: 'Mimo', birth_date: '1975-07-01')

    assert !u1.valid?
    assert !u2.valid?
    assert !u3.valid?
  end
end
