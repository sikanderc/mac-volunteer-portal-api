class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:update, :destroy, :create_connected]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    render json: @events, status: 200
  end

  # GET /events/connected
  # GET /events/connected.json
  def connected_index
    @user_events = UserEvent.where(user_id: current_user.id)
    render json: @user_events, status: 200
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: 201
      @user_event = UserEvent.create(admin: true, event_id: @event.id, user_id: current_user.id)
    else
      render json: { message: "Please make sure to fill all required fields." }, status: 401
    end
  end

  # POST /events/1/connected
  # POST /events/1/connected.json
  def create_connected
    @user_event = UserEvent.new(event_id: @event.id, user_id: current_user.id)
    if @user_event.save
      render json: @user_event, status: 201
    else
      render json: { message: "Please make sure to fill all required fields." }, status: 401
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      render json: @event, status: 201
    else
      render json: { message: "Error. Error. Please try again."}, status: 400
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @user_event = UserEvent.where(event_id: @event.id)
    @event.destroy
    @user_event.destroy
    render json: { head: :no_content }
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :start_time, :end_time, :location1, :location2, :city, :state, :zip, :details, :approved)
  end

end
