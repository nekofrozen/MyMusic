class Audiotrack < ApplicationRecord
  mount_uploader :music, MusicUploader
  mount_uploader :image, ImageUploader

  has_many :playlists , :through => :playlist_songs
  has_many :playlist_songs

  validates_presence_of :name, :music
end
