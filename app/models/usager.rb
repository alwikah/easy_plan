class Usager < ActiveRecord::Base
	attr_accessible :given_name
	attr_accessible :family_name
	attr_accessible :birth_date

  has_one :routine, :class_name => 'Usagers::Routine', :inverse_of => :owner, :autosave => true, :dependent => :destroy, :foreign_key => :owner_id

	def full_name
		"#{self.given_name.capitalize} #{self.family_name.capitalize}"
	end
end
		
