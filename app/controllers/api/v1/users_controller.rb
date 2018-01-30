class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # GET /signup
  # GET /signup.json
  def index
    @users = User.all
    render json: @users, status: 200
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { email: @user.email, id: @user.id, jwt: token }, status: 201
    else
      render json: { message: "Please make sure to fill all required fields." }, status: 401
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render json: @user, status: 201
    else
      render json: { message: "Error. Error. Please try again."}, status: 400
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render json: { head: :no_content }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :organization, :address, :apt, :city, :state, :zip, :email, :phone, :dob, :gender, :password, :password_confirmation, :miner, :volunteer, :super_admin)
  end

end
