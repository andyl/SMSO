require 'spec_helper'

describe "Session", :capybara => true do

  it "renders /login" do
    visit "/login"
    current_path.should == "/login"
    page.should_not be_nil
  end

  it "handles a valid login" do
    pending "sort out the user model"
    @user = FactoryGirl.create :user
    visit "/login"
    fill_in "User Name", with: @user.full_name
    fill_in "Password",  with: "welcome"
    click "Log in"
  end

end