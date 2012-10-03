class Usagers::DailyRoutinesController < ApplicationController
  # GET /usagers/daily_routines
  # GET /usagers/daily_routines.json
  def index
    @usagers_daily_routines = Usagers::DailyRoutine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usagers_daily_routines }
    end
  end

  # GET /usagers/daily_routines/1
  # GET /usagers/daily_routines/1.json
  def show
    @usagers_daily_routine = Usagers::DailyRoutine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usagers_daily_routine }
    end
  end

  # GET /usagers/daily_routines/new
  # GET /usagers/daily_routines/new.json
  def new
    @usagers_daily_routine = Usagers::DailyRoutine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usagers_daily_routine }
    end
  end

  # GET /usagers/daily_routines/1/edit
  def edit
    @usagers_daily_routine = Usagers::DailyRoutine.find(params[:id])
  end

  # POST /usagers/daily_routines
  # POST /usagers/daily_routines.json
  def create
    @usagers_daily_routine = Usagers::DailyRoutine.new(params[:usagers_daily_routine])

    respond_to do |format|
      if @usagers_daily_routine.save
        format.html { redirect_to @usagers_daily_routine, notice: 'Daily routine was successfully created.' }
        format.json { render json: @usagers_daily_routine, status: :created, location: @usagers_daily_routine }
      else
        format.html { render action: "new" }
        format.json { render json: @usagers_daily_routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usagers/daily_routines/1
  # PUT /usagers/daily_routines/1.json
  def update
    @usagers_daily_routine = Usagers::DailyRoutine.find(params[:id])

    respond_to do |format|
      if @usagers_daily_routine.update_attributes(params[:usagers_daily_routine])
        format.html { redirect_to @usagers_daily_routine, notice: 'Daily routine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usagers_daily_routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usagers/daily_routines/1
  # DELETE /usagers/daily_routines/1.json
  def destroy
    @usagers_daily_routine = Usagers::DailyRoutine.find(params[:id])
    @usagers_daily_routine.destroy

    respond_to do |format|
      format.html { redirect_to usagers_daily_routines_url }
      format.json { head :no_content }
    end
  end
end
