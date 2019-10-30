require 'rails_helper'

RSpec.describe "Registrations", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'ユーザを新規登録する' do
    scenario 'ユーザ登録' do
      visit new_user_registration_path
  
      expect {
        fill_in 'exampleInputName1', with: 'aaaaaa'
        fill_in 'exampleInputEmail1', with: 'example@abc.com'
        fill_in 'exampleInputPassword1', with: 'password'
        fill_in 'exampleInputPassword2', with: 'password'
        click_button '登録'
  
        expect(page).to have_content 'アカウント登録が完了しました。'
    }.to change{ User.count }.by(1)
    end
  end
  
  describe 'ユーザ情報を変更' do
    let(:user) { create(:user)}
  
    scenario '名前、メールアドレス、プロフィール画像のみ変更' do 
      sign_in user
      visit edit_user_registration_path

      fill_in 'exampleInputName1', with: 'aaaaaa'
      fill_in 'exampleInputEmail1', with: 'example@abc.com'
      attach_file 'exampleFormControlFile', "#{Rails.root}/app/assets/images/backgroud.jpg"
      click_button '更新'

      expect(page).to have_content 'アカウント情報を変更しました。'
    end

    scenario'名前、メールアドレス、プロフィール画像、パスワードを変更' do
      sign_in user
      visit edit_user_registration_path

      fill_in 'exampleInputName1', with: 'aaaaaa'
      fill_in 'exampleInputEmail1', with: 'example@abc.com'
      attach_file 'exampleFormControlFile', "#{Rails.root}/app/assets/images/backgroud.jpg"
      fill_in 'exampleInputPassword1', with: 'password123'
      fill_in 'exampleInputPassword2', with: 'password123'
      fill_in 'currentPassword', with: 'password'
      click_button '更新'

      expect(page).to have_content 'アカウント情報を変更しました。'
    end

    scenario 'パスワードのみ変更するとき' do
      sign_in user
      visit edit_user_registration_path

      fill_in 'exampleInputPassword1', with: 'password123'
      fill_in 'exampleInputPassword2', with: 'password123'
      fill_in 'currentPassword', with: 'password'
      click_button '更新'

      expect(page).to have_content 'アカウント情報を変更しました。'
    end
  end
end
