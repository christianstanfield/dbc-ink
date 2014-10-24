class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :albumphotos
  has_many :albums, through: :albumphotos

  mount_uploader :url, PhotoUploader
end
