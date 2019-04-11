class Audiotrack < ApplicationRecord
  mount_uploader :music, MusicUploader
  mount_uploader :image, ImageUploader

end
