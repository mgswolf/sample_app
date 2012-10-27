require 'spec_helper'

describe "About Page" do
  before { visit about_path }
  subject { page }

  it { should have_selector('h1', text: 'About Us') }

  it { should have_selector('title',
            text: full_title('About Us')) }
end
