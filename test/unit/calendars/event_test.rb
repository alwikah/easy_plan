require 'test_helper'

class Calendars::EventTest < ActiveSupport::TestCase

  test "I can create an Event" do
    usager = Usager.create(given_name: 'louis', family_name: 'lolita')
    assert Calendars::PonctualEvent.create(title: 'Evenement test', start_date: '2012-12-03 10:20:00', end_date: '2012-12-03 12:00:00', owner: usager)
  end
end
