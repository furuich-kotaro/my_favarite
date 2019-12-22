require 'rails_helper'

RSpec.describe "Notifications", type: :system do
  let(:user) { create(:user)}
  let(:other_user) { create(:user)}

  describe 'index' do
    scenario '作成された通知の一覧が確認できる' do
      post = create(:post, user: user)
      sign_in user
      visit notifications_path
      expect(page).not_to have_content '「東京」にいいねしました'
      expect(page).not_to have_content 'あなたをフォローしました'
      Notification.create(visitor_id: other_user.id, visited_id: user.id, post_id: post.id, action: "like", checked: false)

      visit notifications_path
      expect(page).to have_content '「東京」にいいねしました'
      expect(page).not_to have_content 'あなたをフォローしました'
      Notification.create(visitor_id: other_user.id, visited_id: user.id, action: "follow", checked: false)

      visit notifications_path
      expect(page).to have_content '「東京」にいいねしました'
      expect(page).to have_content 'あなたをフォローしました'
    end
  end

  describe 'update', js: true do
    scenario 'いいね通知を確認するするとnavbarの通知が消える' do
      post = create(:post, user: user)
      Notification.create(visitor_id: other_user.id, visited_id: user.id, post_id: post.id, action: "like", checked: false)
      sign_in user
      visit root_path
      expect(page).to have_css('.fa-bell')
      expect(page).to have_css('.checked-false', visible: false)
      expect(page).to have_css('.like-notification', visible: false)
      first('.open-notifications', visible: false).click


      visit root_path
      expect(page).not_to have_css('.fa-bell')
      expect(page).not_to have_css('.checked-false', visible: false)
    end

    scenario 'フォロー通知を確認するするとnavbarの通知が消える' do
      Notification.create(visitor_id: other_user.id, visited_id: user.id, action: "follow", checked: false)
      sign_in user
      visit root_path
      expect(page).to have_css('.fa-bell')
      expect(page).to have_css('.checked-false', visible: false)
      expect(page).to have_css('.follow-notification', visible: false)
      first('.open-notifications', visible: false).click


      visit root_path
      expect(page).not_to have_css('.fa-bell')
      expect(page).not_to have_css('.checked-false', visible: false)
    end

    scenario 'フォロー/いいめ通知を確認するするとnavbarの通知が消える' do
      post = create(:post, user: user)
      Notification.create(visitor_id: other_user.id, visited_id: user.id, post_id: post.id, action: "like", checked: false)
      Notification.create(visitor_id: other_user.id, visited_id: user.id, action: "follow", checked: false)
      sign_in user
      visit root_path
      expect(page).to have_css('.fa-bell')
      expect(page).to have_css('.checked-false', visible: false)
      expect(page).to have_css('.like-notification', visible: false)
      expect(page).to have_css('.follow-notification', visible: false)
      first('.open-notifications', visible: false).click

      visit root_path
      expect(page).not_to have_css('.fa-bell')
      expect(page).not_to have_css('.checked-false', visible: false)
      expect(page).not_to have_css('.like-notification', visible: false)
      expect(page).not_to have_css('.follow-notification', visible: false)
    end
  end
end
