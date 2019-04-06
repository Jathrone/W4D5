require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    scenario 'has a new user page' do 
        visit new_user_url
        expect(page).to have_content "Sign Up!"
    end
    feature 'signing up a user' do
        background(:each) do
            visit new_user_url
            fill_in 'username', with: "test_username"
            fill_in 'password', with: "test_password"
            click_on "Sign Up"
        end

        scenario 'shows username on the homepage after signup' do
            # debugger
            # save_and_open_page
            expect(page).to have_content "test_username"
        end
    end
end

feature 'logging in' do
    User.create(username: 'testing_username', password: 'testing_password')
    before(:each) do
        visit new_session_url
        fill_in 'username', with: 'testing_username'
        fill_in 'password', with: 'testing_password'
        click_on "Log In"
    end
    scenario 'shows username on the homepage after login' do 
        expect(page).to have_content "testing_username"
    end
end

feature 'logging out' do
    User.create(username: 'testing_username', password: 'testing_password')
    before(:each) do
        visit new_session_url
        fill_in 'username', with: 'testing_username'
        fill_in 'password', with: 'testing_password'
        click_on "Log In"
        click_on "Log Out"
    end
    scenario 'begins with a logged out state' do
        save_and_open_page
        expect(page).to have_content "Log In"
    end

    scenario 'doesn\'t show username on the homepage after logout' do 
        expect(page).not_to have_content "testing_username"
    end
end