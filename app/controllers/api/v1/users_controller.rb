class Api::V1::UsersController < ApplicationController

  def index
    @users = User.with_attached_avatar
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

      puts "hi"
      @decoded_file = Base64.decode64(params[:avatar][:data_url])
        @filename = params[:avatar][:title]
        @tmp_file = Tempfile.new(@filename)
        @tmp_file.binmode
        @tmp_file.write @decoded_file
        @tmp_file.rewind()


        @user.avatar.attach(io: @tmp_file, filename: @filename)
        @user.save



    end
    @user.update(user_params)
    render json: @user.with_attached_avatar, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :location, :avatar)
  end
end
