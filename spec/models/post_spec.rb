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

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:image_path) { Rails.root.join('spec/factories/test.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  it "住所、説明、画像があれば有効" do
    post = create(:post)
    expect(post).to be_valid
  end

  it "住所、説明、画像(2数)でも有効" do
    post = create(:post, pictures: [image, image])
    expect(post).to be_valid
  end
  it "住所、説明、画像(3数)でも有効" do
    post = create(:post, pictures: [image, image, image])
    expect(post).to be_valid
  end

  it "住所、画像があれば有効" do
    post = create(:post, description: nil)
    expect(post).to be_valid
  end

  it "住所、画像(複数)でも有効" do
    post = create(:post, description: nil, pictures: [image, image, image, image])
    expect(post).to be_valid
  end

  it "住所が空だと無効" do
    post = build(:post, address: nil)
    post.valid?
    expect(post.errors[:address]).to include("を入力してください")
  end

  it "写真が空だと無効" do
    post = build(:post, pictures: nil)
    post.valid?
    expect(post.errors[:pictures]).to include("を入力してください")
  end

  it "user_idが空だと無効" do
    post = build(:post, user: nil)
    post.valid?
    expect(post.errors[:user]).to include("を入力してください")
  end

  it "説明は50文字だと有効" do
    post = create(:post, description: "a"*50)
    expect(post).to be_valid
  end

  it "説明は51文字だと無効" do
    post = build(:post, description: "a"*51)
    post.valid?
    expect(post.errors[:description]).to include("は50文字以内で入力してください")
  end
end
