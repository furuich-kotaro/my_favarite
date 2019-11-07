require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user, name: "first")}
  let(:other_user) { create(:user, name: "second")}
  before do
    create(:post, user: user)
    create(:post, user: other_user)
    driven_by(:rack_test)
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

      expect(page).to have_link("first")
      expect(page).not_to have_link("second")
      expect(page).to have_content '東京'
      expect(page).not_to have_content '河口湖'

      fill_in 'userSearchFiled', with: '河口湖'
      find(".userSearchSubmit").click

      expect(page).to have_link("first")
      expect(page).not_to have_link("second")
      expect(page).to have_content '河口湖'
      expect(page).not_to have_content '東京'
    end
  end
end