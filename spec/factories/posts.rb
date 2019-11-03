FactoryBot.define do
  factory :post do
    sequence(:address) { |n| "this is a test#{n}"}
    sequence(:description) { |n| "this place is one of my favarite place#{n}"}
    pictures { [Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'),'spec/factories/test.jpg')] }
    association :user
  end
end
