require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'show' do
    let(:user) { create(:user)}
    let(:other_user) { create(:user)}
    let(:post) { create(:post)}

    scenario 'ユーザの投稿一覧' do
      create(:post, user: user)
      create(:post, user: other_user)
      sign_in user
      visit root_path

      expect(page).to have_link("test1")
      expect(page).to have_link("test2")
      
      click_link 'test1'
      expect(page).to have_link("test1")
      expect(page).not_to have_link("test2")
    end
  end
end