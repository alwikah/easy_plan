# -*- encoding : utf-8 -*-
class UsagersController < ApplicationController
  def index
    @usagers = Usager.all
    respond_to do |format|
      format.html{}
    end
  end

  def new
    @usager = Usager.new
    respond_to do |format|
      format.html{}
    end
  end

  def show
    @usager = Usager.find(params[:id])
    respond_to do |format|
      format.html{}
    end
  end

  def create

    usager_params = params[:usager]
    if usager_params.has_key?(:routine_attributes) && usager_params[:routine_attributes].has_key?(:daily_routines_attributes)
      dr_attr = []
      usager_params[:routine_attributes][:daily_routines_attributes].each do |daily_routine_hash|
        dr_attr << daily_routine_hash unless daily_routine_hash[:day].blank? || daily_routine_hash[:presence].blank?
      end
      usager_params[:routine_attributes][:daily_routines_attributes] = dr_attr
    end

    usager = Usager.create(usager_params)

    respond_to do |format|
      if usager.valid?
        format.html{ redirect_to usagers_path }
      else
        @info = 'Création de l\'usager impossible, informations manquantes'
        format.html{}
      end
    end
  end

  def edit
    @usager = Usager.find(params[:id])
    respond_to do |format|
      format.html{}
    end
  end

  def update
    @usager = Usager.find(params[:id])
    respond_to do |format|
      if @usager.update_attributes(params[:usager])
        format.html{ redirect_to usager_path(@usager) }
      else
        format.html{ redirect_to edit_usager(@usager) }
      end
    end

  end

  def destroy
    usager = Usager.find(params[:id])
    usager.destroy
    respond_to do |format|
      format.html{redirect_to usagers_path}
    end
  end
end
