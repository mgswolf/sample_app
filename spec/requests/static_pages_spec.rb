require 'spec_helper'

describe "Static Pages" do
  subject { page }

  describe "Home Page" do
    before { visit root_path }
    let(:heading) { 'Sample App'}
    let(:page_title) { ''}

    it_should_behave_like 'all static pages'
  end

  describe "About Page" do
    before { visit about_path }
    let(:heading) { 'About Us'}
    let(:page_title) { 'About Us'}

    it_should_behave_like 'all static pages'
  end

  describe "Help Page" do
    before { visit help_path }
    let(:heading) { 'Help'}
    let(:page_title) { 'Help'}

    it_should_behave_like 'all static pages'
  end

  describe "Contact Page" do
    before { visit contact_path }
    let(:heading) { 'Contact Us'}
    let(:page_title) { 'Contact Us'}

    it_should_behave_like 'all static pages'
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link 'Help'
    page.should have_selector 'title', text: full_title('Help')
    click_link 'Contact'
    page.should have_selector 'title', text: full_title('Contact Us')
    click_link 'Home'
    click_link 'Sign up now!'
    page.should have_selector 'h1', text: 'Sign up'
    click_link 'Sample app'
    page.should have_selector 'title', text: full_title('')
  end
end  