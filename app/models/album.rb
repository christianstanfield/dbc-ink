class Album < ActiveRecord::Base

  has_many :albumphotos
  has_many :photos, through: :albumphotos
end
