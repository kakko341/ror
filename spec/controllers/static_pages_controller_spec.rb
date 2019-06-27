require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  let (:base_title) {"Tandem Suchen Site"}

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
      assert_select "title", "Home | #{base_title}"
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
      assert_select "title", "Help | #{base_title}"
    end
  end
end
