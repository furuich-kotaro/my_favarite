# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  blocked         :boolean          default(FALSE), not null
#  followable_type :string(255)      not null
#  follower_type   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  followable_id   :integer          not null
#  follower_id     :integer          not null
#
# Indexes
#
#  fk_followables  (followable_id,followable_type)
#  fk_follows      (follower_id,follower_type)
#

class Follow < ApplicationRecord
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" and "follower" interface
  belongs_to :followable, polymorphic: true
  belongs_to :follower,   polymorphic: true

  def block!
    update_attribute(:blocked, true)
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
