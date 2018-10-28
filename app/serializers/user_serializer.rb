class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :location, :avatar, :avatar_blob_path

  def avatar
     Rails.application.routes.url_helpers.url_for(object.avatar) if object.avatar.attachment
  end



  def avatar_blob_path
     Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true) if object.avatar.attachment
  end

  # :avatar, :avatar_path, :avatar_image_url
  #
  # def avatar
  #   Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  # end
  #
  #
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





end
# rails_blob_url(@user.avatar)
# Rails.application.routes.url_helpers.rails_blob_path(@user.avatar.attachment)
#  Rails.application.routes.url_helpers.url_for(@user.avatar.attachment)
