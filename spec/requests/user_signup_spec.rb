require 'spec_helper'

describe "User's Signup" do
  before { visit signup_path }
  let(:submit) { "Create my account" }

  it 'reject with all blank fields' do
    expect { click_button submit}.not_to change(User, :count)

  end

  it 'reject without email' do
    fill_in 'Name', :with => 'Example user'
    click_button submit
  end

  it 'create a new account' do
    fill_in 'Name',        with: 'Example User'
    fill_in 'Email',        with: 'user@example.com'
    fill_in 'Password',     with: 'foobar'
    fill_in 'Confirmation', with: 'foobar'
    expect { click_button submit }.to change(User, :count).by(1)
  end

end
