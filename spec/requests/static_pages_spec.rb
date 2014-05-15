require 'spec_helper'

describe "StaticPages" do
    let(:stat) { "Ruby on Rails Tutorial Sample App" }

    subject { page }

    shared_examples_for "all static pages" do
        it { should have_selector('h1', text: heading) }
        it { should have_title(full_title(page_title)) }
    end

    #Test the Home Page
    describe "Home page" do
        before { visit root_path }
        let(:heading) { 'Sample App' }
        let(:page_title) { '' }
        it_should_behave_like "all static pages"
        it { should_not have_title('| Home') }

        describe "for signed-in users" do
            let(:user) { FactoryGirl.create(:user) }
                let!(:older_micropost) do
                 FactoryGirl.create(:micropost, user: user, created_at: 1.day.ago)
                end
                let!(:newer_micropost) do
                    FactoryGirl.create(:micropost, user: user, created_at: 1.hour.ago)
                end
            before do 
                sign_in user
                visit root_path
            end
            it "should show the users posts" do
                user.feed.each do |item|
                    expect(page).to have_css("li##{item.id}", text: item.content)
                end
            end


        end
    end

  #Test the Help Page
    describe "Help page" do
        before { visit help_path }
        let(:heading) { 'Help' }
        let(:page_title) { '' }
        it_should_behave_like "all static pages"
    end
    
    #Test the About Page
    describe "About page" do
        before { visit about_path }
        let(:heading) { 'About' }
        let(:page_title) { '' }
        it_should_behave_like "all static pages"
    end

    #Test the Contact Page 
    describe "Contact page" do
        before { visit contact_path }
        let(:heading) { 'Contact' }
        let(:page_title) { '' }
        it_should_behave_like "all static pages"
    end

    it "should have the right links on the layout" do
        visit root_path
        click_link "About"
        expect(page).to have_title(full_title('About Us'))
        click_link "Help"
        expect(page).to have_title(full_title('Help'))
        click_link "Contact"
        expect(page).to have_title(full_title('Contact'))
        click_link "Home" # This is needed to setup the page for the succeeding test 
        click_link "Sign up now!"
        expect(page).to have_title(full_title(''))
        click_link "sample app"
        expect(page).to have_title(full_title(''))
    end
end
