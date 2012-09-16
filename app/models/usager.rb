class Usager < ActiveRecord::Base
	attr_accessible :given_name
	attr_accessible :family_name
	attr_accessible :birth_date

	def full_name
		"#{self.given_name.capitalize} #{self.family_name.capitalize}"
	end
end
		
