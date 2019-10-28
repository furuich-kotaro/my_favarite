class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 150 }
  validates :picture, presence: true
end
