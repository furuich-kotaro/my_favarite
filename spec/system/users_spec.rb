require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user, name: "first")}
  let(:other_user) { create(:user, name: "second")}
  before do
    create(:post, user: user)
    create(:post, user: other_user)
  end

  describe 'show' do
    scenario 'ユーザの投稿一覧' do
      sign_in user
      visit root_path

      expect(page).to have_link("first")
      expect(page).to have_link("second")

      click_link 'first', match: :first
      expect(page).to have_link("first")
      expect(page).not_to have_link("second")
    end
  end

  describe 'search' do
    scenario '特定のユーザの投稿を検索' do
      create(:post_kawaguchiko, user: user)
      sign_in user
      visit root_path

      click_link 'first', match: :first

      fill_in 'userSearchFiled', with: '東京'
      find(".userSearchSubmit").click

      expect(page).to have_content '東京'
      expect(page).not_to have_content '河口湖'

      fill_in 'userSearchFiled', with: '河口湖'
      find(".userSearchSubmit").click

      expect(page).to have_content '河口湖'
      expect(page).not_to have_content '東京'
    end
  end

  describe 'follow', js: true, retry: 5 do
    context 'ログイン済み' do
      before do
        sign_in user
        visit user_path(other_user)
      end

      scenario 'フォローできる' do
        expect(page).to have_link('フォロー')
        expect {
          click_link 'フォロー'
          wait_for_ajax
        }.to change{ Follow.count }.by(1)
      end

      scenario 'フォローできる/通知も作成される' do
        expect(page).to have_link('フォロー')
        expect {
          click_link 'フォロー'
          wait_for_ajax
        }.to change{ Follow.count }.by(1).and change{ Notification.count }.by(1)
      end

      scenario 'フォローを取り消した後にもう一度フォローしても通知は作成されない' do
        expect(page).to have_link('フォロー')
              expect {
          click_link 'フォロー'
          wait_for_ajax
        }.to change{ Follow.count }.by(1).and change{ Notification.count }.by(1)

        click_link 'フォロー中'
        wait_for_ajax
        expect {
          click_link 'フォロー'
          wait_for_ajax
        }.to change{ Follow.count }.by(1).and change{ Notification.count }.by(0)
      end

      scenario 'フォローされると通知が来る' do
        expect(page).not_to have_css('.fa-bell')
        expect(page).not_to have_css('.checked-false')

        sign_in other_user
        visit user_path(user)
        click_link 'フォロー'

        sign_in user
        visit root_path
        expect(page).to have_css('.fa-bell')
        expect(page).to have_css('.checked-false',visible: false)
      end
    end

    context '非ログイン' do
      scenario '非ログインユーザはフォローできない' do
        visit user_path(other_user)
        expect(page).not_to have_link('フォロー')
      end
    end
  end

  describe 'unfollow', js: true, retry: 5 do
    before do
      sign_in user
      visit user_path(other_user)
    end

    scenario 'ログイン済ユーザはフォロー解除できる' do
      expect(page).to have_link('フォロー')
      click_link 'フォロー'
      wait_for_ajax
      expect(page).to have_link('フォロー中')
      expect {
        click_link 'フォロー中'
        wait_for_ajax
      }.to change{ Follow.count }.by(-1)
    end

    scenario '非ログインユーザはフォロー解除できない' do
      expect(page).to have_link('フォロー')
      click_link 'フォロー'
      wait_for_ajax
      expect(page).to have_link('フォロー中')
      click_link 'アカウント'
      wait_for_ajax
      click_link 'ログアウト'
      visit user_path(other_user)
      expect(page).not_to have_link('フォロー中')
    end
  end
end