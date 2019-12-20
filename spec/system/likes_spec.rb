require 'rails_helper'

RSpec.describe "Likes", type: :system  do
  let(:user) { create(:user)}
  let(:other_user) { create(:user)}

  describe 'index' do
    scenario 'いいねした投稿一覧を表示できる' do
      like_post = create(:post, user: other_user)
      post = create(:post_kawaguchiko, user: user)
      create(:like, post: like_post, user: user)
      sign_in user
      visit root_path
      expect(page).to have_content '東京'
      expect(page).to have_content '河口湖'
      visit likes_list_user_path(user)
      expect(page).to have_content '東京'
      expect(page).not_to have_content '河口湖'
    end
  end

  describe 'create' do
    scenario 'ログイン済みユーザ/他人の投稿にはいいねできる', js: true, retry: 5  do
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

    scenario 'ログイン済みユーザ/他人の投稿にはいいねできる/通知も作成される', js: true, retry: 5 do
      post = create(:post, user: user)
      sign_in other_user
      visit root_path
      expect {
        first('.likes-link-create').click
        wait_for_ajax
      }.to change{ post.likes.count }.by(1).and change{ user.passive_notifications.count }.by(1)
    end

    scenario 'いいねを取り消した後にもう一度良いねしても通知は作成されない', js: true, retry: 5 do
      post = create(:post, user: user)
      sign_in other_user
      visit root_path
      expect {
        first('.likes-link-create').click
        wait_for_ajax
      }.to change{ post.likes.count }.by(1).and change{ user.passive_notifications.count }.by(1)
      first('.likes-link-delete').click
      wait_for_ajax
      expect {
        first('.likes-link-create').click
        wait_for_ajax
      }.to change{ post.likes.count }.by(1).and change{ user.passive_notifications.count }.by(0)
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
    scenario 'ログイン済みユーザはいいねを削除できる', js: true, retry: 5 do
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

  describe 'search' do
    scenario 'いいねした投稿一覧を表示できる' do
      like_post_tokyo = create(:post, user: other_user)
      like_post_kawaguchi = create(:post_kawaguchiko, user: other_user)
      create(:like, post: like_post_tokyo, user: user)
      create(:like, post: like_post_kawaguchi, user: user)

      sign_in user
      visit likes_list_user_path(user)
      expect(page).to have_content '東京'
      expect(page).to have_content '河口湖'

      fill_in 'userSearchFiled', with: '東京'
      find(".userSearchSubmit").click

      expect(page).to have_content '東京'
      expect(page).not_to have_content '河口湖'
    end
  end
end
