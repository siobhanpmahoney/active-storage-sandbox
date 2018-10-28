require 'open-uri'

class Api::V1::UsersController < ApplicationController
  before_action :set_host_for_local_storage
  wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]

  def index
    @users = User.with_attached_avatar
    render json: @users, status: :ok
  end

  def create
    puts params
  end

  def show
    @user = User.find(params[:id])
    # @avatar_url = rails_blob_path(@user.avatar)
    # render json: {user: @user, avatar: @user.avatar, avatar_url: rails_blob_url(@user.avatar)}, serializer: nil, status: :ok
    render json: @user, status: :ok
  end

  def update
    puts params


    @user = User.find(params[:id])

    if params[:avatar]
      # puts "hi"
      # puts "\n"
      # puts "\n"
      # puts "\n"
      # puts "\n"
      # puts "params[:avatar]"
      # puts "\n"
      # puts "\n"
      # puts params[:avatar]
      # puts "\n"
      # puts "\n"
      # puts "params[:avatar].io"
      # puts "\n"
      # puts "\n"
      # puts params[:avatar].to_io
      # puts "\n"
      # puts "\n"
      # puts "\n"
      # puts "\n"
      # puts "File.new(params[:avatar].to_io)"
      # puts File.new(params[:avatar].to_io)
      # puts "\n"


      @user.avatar.attach(params[:avatar])
      puts "\n"
      puts "\n"
      puts "\n"
      puts "\n"
      puts "\n"
      puts "\n"
      puts "\n"
      puts "\n"
      puts "url_for(@user.avatar)"
      puts url_for(@user.avatar)
      puts "\n"
      puts "\n"
      puts "\n"
      puts "\n"
      puts "\n"
      puts "rails_blob_path(@user.avatar, disposition: attachment)"
      puts rails_blob_url(@user.avatar)
      puts "\n"
      puts "\n"
      puts "\n"

      # @decoded_file = Base64.decode64(params[:avatar][:data_url])
      # @filename = params[:avatar_title]
      # @tmp_file = Tempfile.new(@filename)
      # @tmp_file.binmode
      # @tmp_file.write @decoded_file
      # @tmp_file.rewind()
      #


      # params[:avatar].tempfile
      # .avatar.attach(params[:avatar])
      # @file = params[:avatar]
      #
      #




      # @user.avatar.attach(io: File.open(@file), filename: params[:avatar][:title], content_type: params[:avatar][:type], identify: false)


      # @user.save
      # @tmp_file.unlink
      # @user.save!




    end
    @user.update(username: params[:username], location: params[:location])

    render json: @user, status: :ok
  end

  private

  def set_host_for_local_storage
    ActiveStorage::Current.host = request.base_url if Rails.application.config.active_storage.service == :local
  end

  def user_params
    params.require(:user).permit(:username, :location, :avatar)
  end
end
