require 'spec_helper'

describe "Help Page" do
  before { visit help_path }
  subject { page }

  it { should have_selector('h1', text: 'Help')}

  it { should have_selector('title',
            :text => full_title('Help')) }
end
