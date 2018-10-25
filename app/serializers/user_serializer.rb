class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :location, :avatar_url

  def avatar_url
    rails_blob_path(object.avatar) if object.avatar.attachment
  end


end
