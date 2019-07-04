require 'rails_helper'

RSpec.feature "Login", type: :feature do
  let(:user) { FactoryBot.create(:michael) }

   # ログインに成功すること
   scenario "user successfully login" do
     visit root_path
     click_link "Log in"
     fill_in "Email", with: user.email
     fill_in "Password", with: user.password
     click_button "Log in"

     expect(current_path).to eq user_path(user)
     expect(page).to_not have_content "Log in"

     # ログアウトのテスト
    click_link "Log out"

    expect(current_path).to eq root_path
    expect(page).to have_content "Log in"
   end

   # 無効な情報ではログインに失敗すること
   scenario "user doesn't login with invalid information" do
     visit root_path
     click_link "Log in"
     fill_in "Email", with: ""
     fill_in "Password", with: ""
     click_button "Log in"

     expect(current_path).to eq login_path
     expect(page).to have_content "Log in"
     expect(page).to have_content "Invalid email or password"
   end
end
