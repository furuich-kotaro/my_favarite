class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post_id, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
