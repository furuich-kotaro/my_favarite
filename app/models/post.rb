# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  address     :string(255)      default(""), not null
#  description :string(255)
#  latitude    :float(24)
#  longitude   :float(24)
#  pictures    :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :notifications, dependent: :destroy
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

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.post_id) FROM likes where likes.post_id = posts.id GROUP BY likes.post_id)'
    Arel.sql(query)
  end

  def create_notification_like!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and post_id = ? and action = ? ', current_user.id, user_id, id, 'like'])
    return if temp.present?

    notification = current_user.active_notifications.new(
      post_id: id,
      visited_id: user_id,
      action: 'like'
    )
    notification.save if notification.valid?
  end
end
