require 'rails_helper'

RSpec.describe "Likes", type: :system do
  let(:user) { create(:user)}
  let(:other_user) { create(:user)}
  let(:post) { create(:post)}
  before do
    driven_by(:rack_test)
  end

  describe 'create' do
    scenario 'ログイン済みユーザ' do
      post = create(:post, user: user)
      sign_in other_user
      visit root_path
      expect(page).to have_link("いいね")
      expect {
        click_link 'いいね', match: :first
      }.to change{ post.likes.count }.by(1)
    end

    scenario '非ログインユーザ' do
      visit root_path
      expect(page).not_to have_link("いいね")
    end

    scenario '投稿者でログイン' do
      sign_in user
      visit root_path
      expect(page).not_to have_link("いいね")
    end
  end

  describe 'destroy' do
    scenario 'ログイン済みユーザ' do
      post = create(:post, user: user)
      sign_in other_user
      visit root_path
      expect(page).to have_link("いいね")
      expect {
        click_link 'いいね', match: :first
      }.to change{ post.likes.count }.by(1)

      expect {
        click_link 'いいね', match: :first
      }.to change{ post.likes.count }.by(-1)
    end
  end
end
