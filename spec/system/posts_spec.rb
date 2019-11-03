require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end
  
  describe '新規投稿' do
    let(:user) { create(:user)}
    let(:image) { "#{Rails.root}/app/assets/images/backgroud.jpg" }

    scenario '新規投稿' do
      sign_in user
      visit new_post_path

      expect {
        fill_in 'postAddress', with: 'aaaaaa'
        fill_in 'postDescription', with: 'this is a test'
        attach_file 'post_img', [ image, image, image ]
        click_button '投稿'

        expect(page).to have_content '投稿に成功しました'
      }.to change{ user.posts.count }.by(1)
    end
  end
end
