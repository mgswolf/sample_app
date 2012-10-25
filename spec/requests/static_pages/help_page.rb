require 'spec_helper'

describe "Help Page" do
  it "should have the content 'Help'" do
    visit '/static_pages/help'
    page.should have_content('Help')
  end

  it "should have the right title" do
    visit '/static_pages/help'
    page.should have_selector('title',
            :text => "Ruby on Rails Tutorial Sample App | Help")
  end
end
