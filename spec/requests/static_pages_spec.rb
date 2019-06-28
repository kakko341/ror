require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Tandem Suchen') }
    it { should have_title('Tandem Suchen Site') }
    it { should_not have_title('Home | ') }
  end

  describe "Help" do
    before { visit help_path }

    it { should have_content('help') }
    it { should have_title('Help | Tandem Suchen Site') }
  end
end
