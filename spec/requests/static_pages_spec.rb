require 'spec_helper'

describe "Static Pages" do
   
  subject { page }
   
  describe "Home Page" do

    before { visit root_path}  

    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home' ) }

  end

  describe "Help Page" do
    before { visit help_path }
    it { should have_selector('h1', text: 'help') }
    it { should have_selector('title', text: full_title('Help')) }

  end

  describe "About Page" do
    before { visit about_path }
    it { should have_selector('h1', text: 'about') }
    it { should have_selector('title', text: full_title('About')) }


  end

  describe "Contact Page" do
    before {visit contact_path }
    it { should have_selector('h1', text: 'Contact Us')}
    it { should have_selector('title', text: full_title('Contact Us')) }
  end

  it "should have the correct links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'h1', text: 'Sample App'
  end
end