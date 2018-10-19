class Api::V1::UsersController < ApplicationController

  def index

    @users = User.all
    
    render json: @users, status: :ok
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def update
    @user = User.find(params[:id])
    if params[:avatar]
      @user.attach(params[:avatar])
    end
    @user.update(user_params)
    render json: @user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :location, :avatar)
  end
end
