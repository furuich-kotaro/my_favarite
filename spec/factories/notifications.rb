# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer
#  post_id    :integer
#  visited_id :integer          not null
#  visitor_id :integer          not null
#
# Indexes
#
#  index_notifications_on_comment_id  (comment_id)
#  index_notifications_on_post_id     (post_id)
#  index_notifications_on_visited_id  (visited_id)
#  index_notifications_on_visitor_id  (visitor_id)
#

FactoryBot.define do
  factory :notification do
    
  end
end
