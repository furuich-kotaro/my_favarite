class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  mount_uploaders :pictures, PictureUploader
  geocoded_by :address
  after_validation :geocode
  acts_as_taggable

  validates :address, presence: true
  validates :description, length: { maximum: 50 }
  validates :pictures, presence: true

  def find_like(post, user)
    Like.find_by(post_id: post.id, user_id: user.id)
  end
end
