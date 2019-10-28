require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'ログイン' do
    user = create(:user, image: nil)

    visit new_user_session_path
    fill_in 'exampleInputEmail1', with: user.email
    fill_in 'exampleInputPassword1', with: user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました。'
  end
end
