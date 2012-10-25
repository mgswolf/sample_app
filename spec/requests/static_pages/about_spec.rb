require 'spec_helper'

describe "About Page" do
  it "should have the content 'About Us'" do
    visit '/static_pages/about'
    page.should have_content('About Us')
  end

  it "should have the right title" do
    visit '/static_pages/about'
    page.should have_selector('title',
            :text => "Ruby on Rails Tutorial Sample App | About Us")
  end
end
