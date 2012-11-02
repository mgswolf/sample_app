require 'spec_helper'

describe "UserPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before(:all) { 30.times { FactoryGirl.create(:user) } }

  describe "index" do

    before do
      signin user
      visit users_path
    end

    it { should have_selector('title', text: 'All users') }
    it { should have_selector('h1', text: 'All users') }


    describe "pagination" do
      it { should have_selector('div.pagination') }

      it "list each user" do
        User.paginate(page: 1).each do |user|
          page.should have_selector('li', text: user.name)
        end
      end
    end
  end

  describe "as a signed in user" do
    let(:user) { FactoryGirl.create(:user) }
    before { signin user }

    it "cannot access new action" do
      get new_user_path
      response.should redirect_to(root_path)
    end

    it "cannot access create action" do
      post users_path
      response.should redirect_to(root_path)
    end
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up'))}
  end

  describe "profile page" do
    let!(:m1) { FactoryGirl.create(:micropost, user: user, content: 'Foo') }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name)}

    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.microposts.count) }
    end
  end

  describe "edit" do
    before do
      signin user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1',   text: "Update your profile") }
      it { should have_selector('title', text: "Edit user") }
      it {  should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }
      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_success_message('Updated')}
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email }
    end
  end

  describe "delete links" do
    before { FactoryGirl.create(:user) }
    it { should_not have_link('delete') }

    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        signin admin
        visit users_path
      end

      it { should have_link('delete', href: user_path(User.first)) }
      it "should be able to delete another user" do
        expect { click_link('delete') }.to change(User, :count).by(-1)
      end
      it { should_not have_link('delete', href: user_path(admin)) }

      it "cannot destroy thenself" do
        expect {  delete user_path(admin) }.to_not change(User, :count).by(-1)
      end
      it "don't destroy thenself and redirect to profile" do
          delete user_path(admin)
          response.should redirect_to user_path(admin)
      end
    end
  end
end
