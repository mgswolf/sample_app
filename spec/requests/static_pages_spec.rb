require 'spec_helper'

describe "Static Pages" do
  subject { page }

  describe "Home Page" do
    before { visit root_path }
    let(:heading) { 'Sample App'}
    let(:page_title) { ''}

    it_should_behave_like 'all static pages'

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Loren ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolar sit amet")
        signin user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 follower", href: followers_user_path(user)) }
      end
    end
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
