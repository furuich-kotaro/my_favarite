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
end
