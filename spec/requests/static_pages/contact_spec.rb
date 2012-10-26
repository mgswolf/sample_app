require 'spec_helper'

describe "Contact Page" do

  it "show the title 'Contact Us'" do
    visit '/static_pages/contact'
    page.should have_content('Contact Us')
  end

  it "have a 'Contac Us' brownser title" do
    visit '/static_pages/contact'
    page.should have_selector('title',
         :text => "Ruby on Rails Tutorial Sample App | Contact Us" )
  end

end
