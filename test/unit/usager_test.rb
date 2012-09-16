require 'test_helper'

class UsagerTest < ActiveSupport::TestCase
   test "I can create a Usager" do
     assert Usager.create(given_name: 'Geoarge', family_name: 'Mimo', birth_date: '1975-07-01')
   end

   test "The Usager should have a full_name response based on its given and family names" do
   	usager = Usager.create(given_name: 'louis', family_name: 'lolita')
	assert usager.full_name == "Louis Lolita"
   end
end
