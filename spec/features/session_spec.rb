require 'spec_helper'

describe "Session", :capybara => true do

  it "renders /login" do
    visit "/login"
    current_path.should == "/login"
    page.should_not be_nil
  end

  it "handles a valid login" do
    @user = FactoryGirl.create :user
    visit "/login"
    fill_in "User name", with: @user.id
    fill_in "Password",  with: "welcome"
    click_button "Log in"
    current_path.should == root_path
    page.should_not be_nil
  end

end