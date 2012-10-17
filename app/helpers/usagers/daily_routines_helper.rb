module Usagers::DailyRoutinesHelper

  # This method remove unrelevant params.
  # The hash should be of this kind :
  # {day: monday, presence: all_day, meal: some_meal}
  def self.clean_params(params)
    if params.has_key?(:day) && Usagers::DailyRoutine::AcceptableDays.include?(params[:day])
      if params.has_key?(:presence) && Usagers::DailyRoutine::AcceptablePresences.include?(params[:presence])
        params
      else
        nil
      end
    else
      nil
    end
  end

end
