class Calendars::PonctualEvent < Calendars::Event
  attr_accessible :end_date

  validates :end_date, :presence => true

  def duration
    self.end_date - self.start_date
  end
end
