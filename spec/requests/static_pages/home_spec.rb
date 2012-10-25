require 'spec_helper'

describe "Home Page" do
  it "should have the content 'Sample App'" do
    visit '/static_pages/home'
    page.should have_content('Sample App')
  end

  it "should have the right title" do
    visit '/static_pages/home'
    page.should have_selector('title',
       :text => "Ruby on Rails Tutorial Sample App | Home")
  end
end
