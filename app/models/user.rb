class User < ApplicationRecord
  # scope :with_eager_loaded_avatar, -> { eager_load(avatar_attachment: :blob) }
  # scope :with_preloaded_avatar, -> { preload(avatar_attachment: :blob) }
  has_one_attached :avatar
end
