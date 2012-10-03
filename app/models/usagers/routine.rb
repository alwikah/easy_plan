class Usagers::Routine < ActiveRecord::Base
  attr_accessible :owner_id, :owner

  belongs_to :owner, :class_name => 'Usager', :foreign_key => :owner_id
  has_many :daily_routines, :class_name => Usagers::DailyRoutine, :inverse_of => :routine, :autosave => true, :dependent => :destroy

end
