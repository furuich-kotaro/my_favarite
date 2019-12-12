# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  image                  :string(255)
#  name                   :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前、メール、、イメージ、パスワードがあれば有効" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "名前、メール、パスワードがあれば有効" do
    user = create(:user, image: nil)
    expect(user).to be_valid
  end

  it "名前が空だと無効" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールが空だと無効" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "名前は10文字だと有効" do
    user = create(:user, name: "a"*10)
    expect(user).to be_valid
  end

  it "名前は11文字だと無効" do
    user = build(:user, name: "a"*11)
    user.valid?
    expect(user.errors[:name]).to include("は10文字以内で入力してください")
  end

  it "既存のメールアドレスは無効" do
    user = create(:user, email: "example@test.com")
    other_user = build(:user, email: "example@test.com")

    other_user.valid?
    expect(other_user.errors[:email]).to include("はすでに存在します")
  end
end
