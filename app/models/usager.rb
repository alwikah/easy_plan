class Usager < ActiveRecord::Base
	attr_accessible :given_name
	attr_accessible :family_name
	attr_accessible :birth_date
  attr_accessible :routine, :routine_attributes

  has_one :routine, :class_name => 'Usagers::Routine', :inverse_of => :owner, :autosave => true, :dependent => :destroy, :foreign_key => :owner_id

  accepts_nested_attributes_for :routine

  validates :given_name, :presence => true, :exclusion => { :in => [''] }
  validates :family_name, :presence => true, :exclusion => { :in => [''] }

	def full_name
		"#{self.given_name.capitalize} #{self.family_name.capitalize}"
  end

end
		
