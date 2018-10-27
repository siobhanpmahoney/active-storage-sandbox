class Api::V1::UsersController < ApplicationController
  before_action :set_host_for_local_storage
  wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]

  def index
    @users = User.with_attached_avatar
    render json: @users, status: :ok
  end

  def create
    puts params

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
      @tmp_file.unlink



    end
    @user.update(location: params[])

    render json: @user, status: :ok
  end

  def show
    @user = User.find(params[:id])
    # @avatar_url = rails_blob_path(@user.avatar)
    render json: @user, status: :ok
  end

  def update
    puts params

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
      @tmp_file.unlink



    end
    @user.update(user_params)

    render json: @user, status: :ok
  end

  private

  def set_host_for_local_storage
    ActiveStorage::Current.host = request.base_url
  end

  def user_params
    params.require(:user).permit(:username, :location, :avatar)
  end
end
