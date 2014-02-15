require 'spec_helper'

describe "StaticPages" do
    let(:stat) { "Ruby on Rails Tutorial Sample App" }

    subject { page }
    #Test the Home Page
    describe "Home page" do
        before { visit root_path }
        it { should have_content('Sample App') }
        it { should have_title( full_title('') ) }
        it { should_not have_title('| Home') }
    end

  #Test the Help Page
    describe "Help page" do
        before { visit help_path }
        it { should have_content('Help') }
        it { should have_title(full_title('Help')) }
    end
    
    #Test the About Page
    describe "About page" do
        before { visit about_path }
        it { should have_content('About') }
        it { should have_title(full_title('About Us')) }
    end

    #Test the Contact Page 
    describe "Contact page" do
        before { visit contact_path }
        it { should have_content('Contact') }
        it { should have_title(full_title('Contact')) }
    end
end
