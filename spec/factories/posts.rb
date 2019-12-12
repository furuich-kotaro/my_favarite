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

FactoryBot.define do
  factory :post do
    address { "東京" }
    sequence(:description) { |n| "this place is one of my favarite place#{n}"}
    pictures { [Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'),'spec/factories/test.jpg')] }
    latitude { 35.6585805 }
    longitude { 139.7454329 }
    association :user
  end

  factory :post_kawaguchiko, class: Post do
    address { "河口湖" }
    sequence(:description) { |n| "this place is one of my favarite place#{n}"}
    pictures { [Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'),'spec/factories/test.jpg')] }
    latitude { 35.517095 }
    longitude { 138.751779 }
    association :user
  end
end
