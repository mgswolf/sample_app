require 'spec_helper'

describe "User's Signup", :type => :request do
  before do
    visit signup_path
  end
  let(:submit) { "Create my account" }
  subject { page }

  describe "with invalid information" do

    it 'reject with all blank fields' do
      expect { click_button submit}.not_to change(User, :count)
    end

    it 'reject without email' do
      fill_in 'Name', :with => 'Example user'
      click_button submit
    end

    it 'show validation errors messages' do
      click_button submit
      page.should have_content("Name can't be blank")
      page.should have_content("Email can't be blank")
      page.should have_content("Password can't be blank")
    end

    describe "after submission" do
      before { click_button submit }

      it { should have_selector('title', text: 'Sign up') }
      it { should have_content('error') }
    end
  end

  describe "with valid args" do
    let(:user) { FactoryGirl.build(:user) }
    before { valid_signup(user)}

    it 'create a new account' do
      expect { click_button submit }.to change(User, :count).by(1)
    end

    it 'show sucess message' do
      click_button submit
      page.should have_content("Welcome to the Sample App!")
      page.should have_selector('title', text: user.name)
    end

  end

end
