# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Relationship do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to follower_id" do
      expect do
        Relationship.new(follower_id: follower.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should == follower }
    its(:followed) { should == followed }
  end

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid}
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end

  describe "after destroy" do
    before do
      3.times do
        user = FactoryGirl.create(:user)
        follower.relationships.create(followed_id: user.id)
      end
    end


    it "user the relationships are destroyed" do
      relationships = follower.relationships
      follower.destroy
      relationships.reload.should be_blank
    end

    it "when followed are destroyed relationship is too" do
      id_followed = follower.relationships.last.followed
      followed = User.find_by_id(id_followed)
      followed.destroy
      follower.relationships.reload.find_by_followed_id(id_followed).should be_nil
    end
  end
end
