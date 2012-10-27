require 'spec_helper'

describe "Home Page" do
  before { visit root_path }
  subject { page }


  it {should have_selector('h1', text: 'Sample App')}
  it { should have_selector('title',
       text: full_title(''))}

  it { should_not have_selector('title', text: ' | Home') }

end
