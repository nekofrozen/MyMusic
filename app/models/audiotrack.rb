class Audiotrack < ApplicationRecord
  mount_uploader :music, MusicUploader
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :music
end
