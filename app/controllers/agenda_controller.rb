# -*- encoding : utf-8 -*-
class AgendaController < ApplicationController

  def agenda
    @daily_routines_hash = {}

    Usagers::DailyRoutine::AcceptableDays.each do |day|
      d_routines = Usagers::DailyRoutine.where(day: day).all
      @daily_routines_hash[day] = {}
      @daily_routines_hash[day][:morning] = d_routines.select{|dr| [Usagers::DailyRoutine::AcceptablePresences[0],Usagers::DailyRoutine::AcceptablePresences[1]].include?(dr.presence)}
      @daily_routines_hash[day][:afternoon] = d_routines.select{|dr| [Usagers::DailyRoutine::AcceptablePresences[0],Usagers::DailyRoutine::AcceptablePresences[2]].include?(dr.presence)}
      @daily_routines_hash[day][:noon] = d_routines.select{|dr| !dr.meal.blank?}

    end

    respond_to do |format|
      format.html
    end
  end
end
