require 'rails_helper'

RSpec.describe "Likes", type: :system, js: true, retry: 5  do
  let(:user) { create(:user)}
  let(:other_user) { create(:user)}

  describe 'create' do
    scenario 'ログイン済みユーザ/他人の投稿にはいいねできる', js: true  do
      post = create(:post, user: user)
      sign_in other_user
      visit root_path
      expect(page).to have_css('.likes-link-create')
      expect(page).not_to have_css('.likes-link-delete')
      expect {
        first('.likes-link-create').click
        wait_for_ajax
      }.to change{ post.likes.count }.by(1)
    end

    scenario 'ログイン済みユーザ/投稿者自身の投稿にはいいねできない' do
      post = create(:post, user: user)
      sign_in user
      visit root_path
      expect(page).not_to have_css('.likes-link-create')
      expect(page).to have_css('.gray_heart')
    end

    scenario '非ログインユーザはいいねできない' do
      post = create(:post, user: user)
      visit root_path
      expect(page).not_to have_css('.likes-link-create')
      expect(page).to have_css('.gray_heart')
    end
  end

  describe 'destroy' do
    scenario 'ログイン済みユーザはいいねを削除できる', js: true  do
      post = create(:post, user: user)
      create(:like, post: post, user: other_user)
      sign_in other_user
      visit root_path
      expect(page).not_to have_css('.likes-link-create')
      expect(page).to have_css('.likes-link-delete')
      expect {
        first('.likes-link-delete').click
        wait_for_ajax
      }.to change{ post.likes.count }.by(-1)
    end

    scenario '非ログインユーザはいいねを削除できない' do
      post = create(:post, user: user)
      create(:like, post: post, user: other_user)
      visit root_path
      expect(page).not_to have_css('.likes-link-delete')
      expect(page).to have_css('.gray_heart')
    end
  end
end
