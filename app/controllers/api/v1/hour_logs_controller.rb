class Api::V1::HourLogsController < ApplicationController
  before_action :set_hour_log, only: [:update, :destroy]

  # GET /hour_logs
  # GET /hour_logs.json
  def index
    @hour_logs = HourLog.all
    render json: @hour_logs, status: 200
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user.hour_logs, status: 200
    else
      render json: { message: "Unable to find user."}, status: 401
    end
  end

  # POST /hour_logs
  # POST /hour_logs.json
  def create
    @hour_log = HourLog.new(hour_log_params)
    if @hour_log.save
      render json: @hour_log, status: 201
    else
      render json: { error: "Please make sure to fill all required fields." }, status: 400
    end
  end

  # PATCH/PUT /hour_logs/1
  # PATCH/PUT /hour_logs/1.json
  # def update
  #   if @hour_log.update(hour_log_params)
  #     render json: @hour_log, status: :201
  #   else
  #     render json: { message: "Error. Error. Please try again."}, status: 400
  #   end
  # end

  # DELETE /hour_logs/1
  # DELETE /hour_logs/1.json
  def destroy
    @hour_log.destroy
    render json: { head: :no_content }
  end

  private

  def set_hour_log
    @hour_log = HourLog.find(params[:id])
  end

  def hour_log_params
    params.require(:hour_log).permit(:date_worked, :hours_worked, :supervisor_name, :interest_field, :improvement_field, :info_field, :event_id, :user_id, :approved)
  end

end
