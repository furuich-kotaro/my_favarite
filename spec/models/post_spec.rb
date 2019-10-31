require 'rails_helper'

RSpec.describe Post, type: :model,do: true  do
  let(:user) { create(:user)}
  let(:image_path) { Rails.root.join('spec/factories/test.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  it "タイトル、説明、画像があれば有効" do
    post = create(:post)
    expect(post).to be_valid
  end

  it "タイトル、説明、画像(2数)でも有効" do
    post = create(:post, pictures: [image, image])
    expect(post).to be_valid
  end
  it "タイトル、説明、画像(3数)でも有効" do
    post = create(:post, pictures: [image, image, image])
    expect(post).to be_valid
  end

  it "タイトル、画像があれば有効" do
    post = create(:post, description: nil)
    expect(post).to be_valid
  end

  it "タイトル、画像(4数)でも有効" do
    post = create(:post, description: nil, pictures: [image, image, image, image])
    expect(post).to be_valid
  end

  it "タイトルが空だと無効" do
    post = build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
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

  it "タイトルは30文字だと有効" do
    post = create(:post, title: "a"*30)
    expect(post).to be_valid
  end

  it "タイトルは31文字だと無効" do
    post = build(:post, title: "a"*31)
    post.valid?
    expect(post.errors[:title]).to include("は30文字以内で入力してください")
  end

  it "説明は150文字だと有効" do
    post = create(:post, description: "a"*150)
    expect(post).to be_valid
  end

  it "説明は151文字だと無効" do
    post = build(:post, description: "a"*151)
    post.valid?
    expect(post.errors[:description]).to include("は150文字以内で入力してください")
  end
end
