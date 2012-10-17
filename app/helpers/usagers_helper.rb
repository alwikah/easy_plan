module UsagersHelper

  # This method remove unrelevant params.
  # The hash should be of this kind :
  # {
  #   given_name: 'some first name',
  #   family_name: 'some family name',
  #   routine_attributes: {
  #     daily_routines_attributes: [
  #         {day: monday, presence: all_day, meal: some_meal},
  #         {day: wednesday, presence: morning, meal: some_other_meal}, etc...
  #       ]
  #     }
  #   }
  # }
  #
  # This actually only cleans the routine part of given params
  def clean_params(params)
    params[:routine_attributes] = Usagers::RoutinesHelper.clean_params(params[:routine_attributes]) if params.has_key?(:routine_attributes)
    params
  end
end
