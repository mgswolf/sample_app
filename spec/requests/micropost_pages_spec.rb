require 'spec_helper'

describe "Micropost pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { signin user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.to_not change(Micropost, :count)
      end

      describe "with valid information" do
        before { fill_in "micropost_content", with: "Lorem ipsum" }

        it "should create a micropost" do
          expect { click_button "Post" }.to change(Micropost, :count).by(1)
        end
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end

    describe "as a wrong user" do
      let(:wrong_user) { FactoryGirl.create(:user) }
      before do
        signin wrong_user
        visit user_path(user)
      end

      it { should_not have_content('delete')}
    end
  end

  describe "sidebar microposts count" do
    before  do
      FactoryGirl.create(:micropost, user: user)
      visit user_path(user)
    end

    it { should have_content("Micropost (1)")}

    describe "pluralize for many microposts" do
      before do
        3.times { FactoryGirl.create(:micropost, user: user ) }
        visit user_path(user)
      end

      it { should have_content("Microposts (4)") }
    end
  end
end
