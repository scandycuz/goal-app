require 'spec_helper'
require 'rails_helper'


feature "the signup process" do

  before(:each) do
    visit new_user_url
    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "biscuits"
    click_on "Sign Up"
  end

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do

    scenario "redirects to goal index page after signup" do
      expect(page).to have_content "Goals"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end
  end
end

feature "logging in" do
  before do
    User.create(username: "testing_username", password: "biscuits")
  end

  before(:each) do
    visit new_session_url
    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "biscuits"
    click_on "Sign In"
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content "testing_username"
  end

end

feature "logging out" do

  before do
    User.create(username: "testing_username", password: "biscuits")
  end

  before(:each) do
    visit new_session_url
    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "biscuits"
  end

  scenario "begins with a logged out state" do
    expect(page).to_not have_content "Sign Out"
  end

  scenario "doesn't show username on the homepage after logout" do
    click_on "Sign In"
    click_on "Sign Out"
    expect(page).to_not have_content "testing_username"
  end

end
