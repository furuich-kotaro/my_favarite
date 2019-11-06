require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end
  
  describe 'new' do
    let(:user) { create(:user)}
    let(:image) { "#{Rails.root}/app/assets/images/backgroud.jpg" }

    scenario 'new' do
      sign_in user
      visit new_post_path

      expect {
        fill_in 'postAddress', with: '東京'
        fill_in 'postDescription', with: 'this is a test'
        attach_file 'post_img', [ image, image, image ]
        click_button '投稿'

        expect(page).to have_content '投稿に成功しました'
      }.to change{ user.posts.count }.by(1)
    end
  end

  describe 'destroy' do
    let(:user) { create(:user)}
    let(:other_user) { create(:user)}
    let(:post) { create(:post)}

    scenario 'ログイン済みユーザ' do
      create(:post, user: user)
      sign_in user
      visit root_path

      expect(page).to have_content '削除'
      expect {
        click_on '削除'

        expect(page).to have_content '削除に成功しました'
      }.to change{ user.posts.count }.by(-1)
    end

    scenario '非ログインユーザ' do
      visit root_path
      expect(page).not_to have_content '削除'
    end

    scenario '投稿者でないユーザでログイン' do
      sign_in other_user
      visit root_path
      expect(page).not_to have_content '削除'
    end
  end
end
