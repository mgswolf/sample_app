require 'spec_helper'

describe "Home Page" do
  before do
    visit '/static_pages/home'
  end
  it "should have the content 'Sample App'" do
    page.should have_content('Sample App')
  end

  it "should have the base title" do
    page.should have_selector('title',
       text: "Ruby on Rails Tutorial Sample App")
  end

  it "should not have a custom page title" do
    page.should_not have_selector('title', text: ' | Home')
  end
end
