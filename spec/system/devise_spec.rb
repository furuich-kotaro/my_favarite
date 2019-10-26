require 'rails_helper'

RSpec.describe "Devise", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'ユーザ登録ができる' do
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

  scenario 'ログインができる' do
    user = create(:user, image: nil)

    visit new_user_session_path
    fill_in 'exampleInputEmail1', with: user.email
    fill_in 'exampleInputPassword1', with: user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました。'
  end
end
