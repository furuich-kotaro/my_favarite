require 'rails_helper'

RSpec.describe "User", type: :system do
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
end
