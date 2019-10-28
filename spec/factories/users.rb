FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}"}
    sequence(:email) { |n| "test#{n}@example.com"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/user_test.jpg')) }
    password { "password" }
    password_confirmation { "password" }
  end
end
