require 'spec_helper'

describe "Static Pages" do
   
  describe "Home Page" do
    it "should have the content 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Home')
    end
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', 
                      :text => 'Ruby on Rails Tutorial Sample App')
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help Page" do
    it "should have the content 'help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'help')
    end
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', 
                      :text => 'Ruby on Rails Tutorial Sample App | Help')
    end
  end

  describe "About Page" do
    it "should have the content 'about you'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'about')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', 
                      :text => 'Ruby on Rails Tutorial Sample App | About')
    end
  end

  describe "Contact Page" do
    it "should have the heading 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Us')
    end
    it "should have the right title" do
      visit '/static_pages/contact'
      page.should have_selector('title', 
                      :text => 'Ruby on Rails Tutorial Sample App | Contact Us')
    end
  end

end
