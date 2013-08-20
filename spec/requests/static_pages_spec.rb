require 'spec_helper'

describe "StaticPages" do
    let(:stat) { "Ruby on Rails Tutorial Sample App" }

    #Test the Home Page
    describe "Home page" do
        it "should have the h1 'Sample App'" do
            visit '/static_pages/home'
            page.should have_selector('h1', :text => 'Sample App')
        end

        it "should have the base title 'Home'" do
            visit '/static_pages/home'
            expect(page).to have_title("#{stat}")
        end

        it "should not have a custom page title" do
            visit '/static_pages/home'
            expect(page).not_to have_title('| Home')
        end
    end

  #Test the Help Page
    describe "Help page" do
        it "should have the h1 'Help'" do
            visit '/static_pages/help'
            page.should have_selector('h1', :text => 'Help')
        end
        it "should have the right title" do
            visit '/static_pages/help'
            expect(page).to have_title("#{stat} | Help")
        end
    end
    
    #Test the About Page
    describe "About page" do
        it "should have the content 'About Us'" do
            visit '/static_pages/about'
            expect(page).to have_content('About Us')
        end
        it "should have the right title" do
            visit '/static_pages/about'
            expect(page).to have_title("#{stat} | About Us")
        end
    end

    #Test the Contact Page 
    describe "Contact page" do
        it "should have the content 'Contact'" do
            visit '/static_pages/contact'
            expect(page).to have_content('Contact')
        end
        it "should have the right title" do
            visit '/static_pages/contact'
            expect(page).to have_title("#{stat} | Contact")
        end
    end
end
