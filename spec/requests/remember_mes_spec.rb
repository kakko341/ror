require 'rails_helper'

RSpec.describe "RememberMes", type: :request do
  describe "GET /remember_mes" do
    it "works! (now write some real specs)" do
      get remember_mes_path
      expect(response).to have_http_status(200)
    end
  end
end
