require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  include ActiveJob::TestHelper

  scenario "user successfully signs up" do
    visit root_path
    click_link "Sign up now!"

    #click_link "Signup via email"

    perform_enqueued_jobs do
      expect {
        fill_in "Name",              with: "Test User"
        fill_in "Email",     with: "test@example.com"
        fill_in "Password",         with: "test12"
        fill_in "Confirmation",  with: "test12"
        click_button "Create my account"
      }.to change(User, :count).by(1)

      #expect(page).to have_content "アカウント有効化メールを送信しました。"
      #expect(current_path).to eq new_user_path
    end
  end
end
