require 'rails_helper'

RSpec.describe "Passwords", type: :system do

  describe 'パスワードをリセットして変更する' do
    before do
      driven_by(:rack_test)
      user = create(:user)

      visit new_user_password_path
      fill_in 'exampleInputEmail1', with: user.email
      click_button "パスワード再設定メールを送る"
    end
  
    it "パスワード再設定メールが送られる" do
      expect(page).to have_content("パスワードの再設定について数分以内にメールでご連絡いたします。")
    end

    it "登録されていないメールアドレスを入力するとエラーが出る" do
      visit new_user_password_path
      fill_in 'exampleInputEmail1', with: "tes0t@example.com"
      click_button "パスワード再設定メールを送る"

      expect(page).to have_content("メールアドレスは見つかりませんでした。")
    end
  end
end