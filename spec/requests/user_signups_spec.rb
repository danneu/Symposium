require 'spec_helper'

describe "UserSignups" do
  it "logs in user after successfully signing up" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", :with => "sample"
    fill_in "Password", :with => "something"
    fill_in "Password confirmation", :with => "something"
    click_button "Sign Up"
    page.should have_content("Successfully")
    page.should have_content("Log Out")
    page.should have_content("sample")
  end

  it "prevents the user from signing up when submitting a blank form" do
    visit root_path
    click_link "Sign Up"
    click_button "Sign Up"
    page.should have_content("You must correct the error")
    page.should have_content("can't be blank")
  end

  it "prevents the user from signing up when password and confirmation does not match" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", :with => "sample"
    fill_in "Password", :with => "something"
    fill_in "Password", :with => "different"
    click_button "Sign Up"
    page.should have_content("You must correct the error")
    page.should have_content("doesn't match confirmation")
  end
end

