require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

	it { should  have_selector('h1', text: user.name) }
	it { should  have_selector('title', text: user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

	it { should  have_selector('h1', text: 'Sign up') }
	it { should  have_selector('title', text: 'Sign up') }
  end
end
