# -*- encoding : utf-8 -*-
class AgendaController < ApplicationController

  def agenda
    @daily_routines_hash = {}

    Usagers::DailyRoutine::AcceptableDays.each do |day|
      @daily_routines_hash[day] = Usagers::DailyRoutine.where(day: day).all
    end

    respond_to do |format|
      format.html
    end
  end
end
