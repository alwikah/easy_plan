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
    Usager.create(params[:usager])
    respond_to do |format|
      format.html{ redirect_to usagers_path }
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
