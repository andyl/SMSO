require 'spec_helper'

describe "Session login", :capybara => true do

  before(:each) do
    @acct = Factory.create(:account)
    @team = Factory.create(:team, account_id: @acct.id)
    Team.current_id   = @team.id
    Capybara.default_host = "http://#{@team.subdomain}.#{@acct.domain}"
  end

  it "renders /login" do
    visit "/login"
    current_path.should == "/login"
    page.should_not be_nil
  end

  it "handles a valid login" do
    @user = Factory.create :user
    visit "/login"
    fill_in "User name", with: @user.id
    fill_in "Password",  with: "welcome"
    click_button "Log in"
    current_path.should == root_path
    page.should_not be_nil
    page.should have_content @user.user_name
  end

  it "handles invalid login" do
    visit "/login"
    fill_in "User name", with: "nonsense"
    fill_in "Password",  with: "whatever"
    click_button "Log in"
    current_path.should == "/sessions"
    page.should_not be_nil
    page.should have_content "Invalid user name or password"
  end

  it "handles logout via path" do
    user = capy_login
    page.should have_content user.user_name
    visit '/logout'
    page.should_not have_content user.user_name
  end

  it "handles logout via button", :js => true do
    user = capy_login
    page.should have_content user.user_name
    page.find('#navDrop').click()
    page.should have_content "log out"
    click_link 'log out'
    page.should_not have_content user.user_name
  end

end