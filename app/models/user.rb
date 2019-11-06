class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 10 }

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end
end
