class Playlist < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :audiotracks , :through => :playlist_songs
  has_many :playlist_songs

  validates_presence_of :name
end