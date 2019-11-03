class Post < ApplicationRecord
  belongs_to :user
  mount_uploaders :pictures, PictureUploader
  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true
  validates :description, length: { maximum: 50 }
  validates :pictures, presence: true
end
