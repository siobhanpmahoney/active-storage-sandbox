class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :location  
   # :avatar_path, :avatar_image_url

  # def avatar_image_url
  #   Rails.application.routes.url_helpers.url_for(object.avatar) if object.avatar.attached?
  # end
  #
  # def avatar_path
  #   if object.avatar.attached?
  #     variant = object.avatar.variant(resize: "100x100")
  #     Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true)
  #     # return rails_representation_url(variant, only_path: true)
  #     # return rails_blob_url(object.avatar, only_path: true)
  #   end
  # end
  #




end
