class Calendars::EventsController < ApplicationController
  # GET /calendars/events
  # GET /calendars/events.json
  def index
    @calendars_events = Calendars::Event.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @calendars_events }
    end
  end

  # GET /calendars/events/1
  # GET /calendars/events/1.json
  def show
    @calendars_event = Calendars::Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @calendars_event }
    end
  end

  # GET /calendars/events/new
  # GET /calendars/events/new.json
  def new
    @calendars_event = Calendars::Event.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @calendars_event }
    end
  end

  # GET /calendars/events/1/edit
  def edit
    @calendars_event = Calendars::Event.find(params[:id])
  end

  # POST /calendars/events
  # POST /calendars/events.json
  def create
    puts params[:calendars_event]
    @calendars_event = Calendars::PonctualEvent.new(params[:calendars_event])

    respond_to do |format|
      if @calendars_event.save
        format.html { redirect_to calendars_events_path, notice: 'Event was successfully created.' }
        #format.json { render json: @calendars_event, status: :created, location: @calendars_event }
      else
        format.html { render action: "new" }
        #format.json { render json: @calendars_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calendars/events/1
  # PUT /calendars/events/1.json
  def update
    @calendars_event = Calendars::Event.find(params[:id])

    respond_to do |format|
      if @calendars_event.update_attributes(params[:calendars_event])
        format.html { redirect_to calendars_events_path, notice: 'Event was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @calendars_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/events/1
  # DELETE /calendars/events/1.json
  def destroy
    @calendars_event = Calendars::Event.find(params[:id])
    @calendars_event.destroy

    respond_to do |format|
      format.html { redirect_to calendars_events_url }
      #format.json { head :no_content }
    end
  end
end
