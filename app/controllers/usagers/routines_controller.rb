class Usagers::RoutinesController < ApplicationController
  # GET /usagers/routines
  # GET /usagers/routines.json
  def index
    @usagers_routines = Usagers::Routine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usagers_routines }
    end
  end

  # GET /usagers/routines/1
  # GET /usagers/routines/1.json
  def show
    @usagers_routine = Usagers::Routine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usagers_routine }
    end
  end

  # GET /usagers/routines/new
  # GET /usagers/routines/new.json
  def new
    @usagers_routine = Usagers::Routine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usagers_routine }
    end
  end

  # GET /usagers/routines/1/edit
  def edit
    @usagers_routine = Usagers::Routine.find(params[:id])
  end

  # POST /usagers/routines
  # POST /usagers/routines.json
  def create
    @usagers_routine = Usagers::Routine.new(params[:usagers_routine])

    respond_to do |format|
      if @usagers_routine.save
        format.html { redirect_to @usagers_routine, notice: 'Routine was successfully created.' }
        format.json { render json: @usagers_routine, status: :created, location: @usagers_routine }
      else
        format.html { render action: "new" }
        format.json { render json: @usagers_routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usagers/routines/1
  # PUT /usagers/routines/1.json
  def update
    @usagers_routine = Usagers::Routine.find(params[:id])

    respond_to do |format|
      if @usagers_routine.update_attributes(params[:usagers_routine])
        format.html { redirect_to @usagers_routine, notice: 'Routine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usagers_routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usagers/routines/1
  # DELETE /usagers/routines/1.json
  def destroy
    @usagers_routine = Usagers::Routine.find(params[:id])
    @usagers_routine.destroy

    respond_to do |format|
      format.html { redirect_to usagers_routines_url }
      format.json { head :no_content }
    end
  end
end
