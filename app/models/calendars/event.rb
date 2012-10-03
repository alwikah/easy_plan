class Calendars::Event < ActiveRecord::Base
  attr_accessible :start_date, :title, :owner, :owner_id

  belongs_to :owner, :class_name => 'Usager'

  validates :start_date,  :presence => true
  validates :title,       :presence => true
  validates :owner,       :presence => true
end
