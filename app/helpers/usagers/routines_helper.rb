module Usagers::RoutinesHelper

  # This method remove unrelevant params.
  # The hash should be of this kind :
  # {daily_routines_attributes: [
  #     {day: monday, presence: all_day, meal: some_meal},
  #     {day: wednesday, presence: morning, meal: some_other_meal}, etc...
  #   ]
  # }
  def self.clean_params(params)
    if params.has_key?(:daily_routines_attributes) && !params[:daily_routines_attributes].empty?
      daily_routines_params = []
      params[:daily_routines_attributes].each do |daily_routine_p|
        temp = Usagers::DailyRoutinesHelper.clean_params(daily_routine_p)
        daily_routines_params << temp unless temp.nil?
      end
      params[:daily_routines_attributes] = daily_routines_params
    end
    params
  end
end
