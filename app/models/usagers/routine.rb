class Usagers::Routine < ActiveRecord::Base
  attr_accessible :owner_id, :owner
  attr_accessible :daily_routines_attributes

  belongs_to :owner, :class_name => 'Usager', :foreign_key => :owner_id
  has_many :daily_routines, :class_name => Usagers::DailyRoutine, :inverse_of => :routine, :autosave => true, :dependent => :destroy

  accepts_nested_attributes_for :daily_routines

end
