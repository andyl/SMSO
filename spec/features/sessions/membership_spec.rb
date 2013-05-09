require 'spec_helper'

describe "Session membership", :capybara => true do

  before(:each) do
    @acct = Factory.create(:account)
    @team = Factory.create(:team, account_id: @acct.id)
    Team.current_id   = @team.id
    Capybara.default_host = "http://#{@team.subdomain}.#{@acct.domain}"
  end

  context "when logging into the account domain" do

    context "with no team memberships" do

      it "shows no team names" do
        capy_login
        page.find('#navDrop').click()
        page.should     have_selector("ul#userDrop li:nth-child(1)")
        page.should_not have_selector("ul#userDrop li:nth-child(2)")
        all("#userDrop li").count.should == 1
      end

    end

    #context "with one team membership" do
    #
    #  it "shows one team name" do
    #    user = Factory.create :user
    #    mem  = Factory.create :membership, team_id: @team.id, user_id: user.id
    #    capy_login(user)
    #    page.find('#navDrop').click()
    #    page.should  have_selector("ul#userDrop li:nth-child(1)")
    #    page.should  have_selector("ul#userDrop li:nth-child(2)")
    #    all("#userDrop li").count.should == 2
    #  end
    #
    #end

    #context "with two team memberships" do
    #
    #  it "shows two team names"
    #
    #end

  end

  #it "handles logout via button", :js => true do
  #  user = capy_login
  #  page.should have_content user.user_name
  #  page.find('#navDrop').click()
  #  page.should have_content "log out"
  #  click_link 'log out'
  #  page.should_not have_content user.user_name
  #end

end