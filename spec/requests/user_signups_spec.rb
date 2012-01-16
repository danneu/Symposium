require 'spec_helper'

describe "UserSignups" do
  it "should log in user after successfully signing up" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", :with => "sample"
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "something"
    fill_in "Password confirmation", :with => "something"
    click_button "Sign Up"
    page.should have_content("Welcome! You have signed up successfully")
    page.should have_content("Log Out")
    page.should have_content("Welcome, sample")
  end

  it "should return an error when submitting a blank form" do
    visit root_path
    click_link "Sign Up"
    click_button "Sign Up"
    page.should have_content("4 errors prohibited this user from being saved")
    page.should have_content("Email can't be blank")
    page.should have_content("Password can't be blank")
    page.should have_content("Username can't be blank")
  end

  it "should return an error when password and password confirmation do not match" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", :with => "sample"
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "something"
    fill_in "Password confirmation", :with => "different"
    click_button "Sign Up"
    page.should have_content("2 errors prohibited this user from being saved")
    page.should have_content("Password doesn't match confirmation")
  end
end

