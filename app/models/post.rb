class Post < ApplicationRecord
  belongs_to :user
  mount_uploaders :pictures, PictureUploader

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 150 }
  validates :pictures, presence: true
end
