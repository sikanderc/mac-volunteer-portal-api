class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by_email(user_login_params[:email])
    if @user && @user.authenticate(user_login_params[:password])
      session[:user_id] = @user.id
      token = encode_token({ user_id: @user.id })
      render json: { email: @user.email, id: @user.id, jwt: token, super_admin: @user.super_admin }, status: 202
    else
      render json: { message: "Invalid email or password." }, status: 401
    end
  end

  def show
    if !!current_user
      # token = encode_token({ user_id: current_user.id })
      render json: { email: current_user.email, id: current_user.id, super_admin: current_user.super_admin }, status: 200
    else
      render json: { message: "User not found" }, status: 404
    end
  end

  def destroy
    reset_session
    @current_user = nil
    render json: { head: :no_content }
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end

end
