class Api::V1::UserEventsController < ApplicationController

  # GET /user_events
  # GET /user_events.json
  def index
    @user_events = UserEvent.all
    render json: @user_events, status: 200
  end

  private

  def user_event_params
    params.require(:user_event).permit(:admin, :event_id, :user_id)
  end

end
