class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :location, :avatar

  def avatar
     Rails.application.routes.url_helpers.url_for(object.avatar) if object.avatar.attachment
  end






end
# rails_blob_url(@user.avatar)
# Rails.application.routes.url_helpers.rails_blob_path(@user.avatar.attachment)
#  Rails.application.routes.url_helpers.url_for(@user.avatar.attachment)
