require 'spec_helper'

describe "Contact Page" do
  before { visit contact_path }
  subject { page }

  it { should have_selector('h1', text: 'Contact Us') }

  it { should have_selector('title',
         text: full_title('Contact Us') ) }

end
