require 'spec_helper'

describe "Home", :capybara => true do

  before(:each) do
    @acct = Factory.create(:account)
    @team = Factory.create(:team, account_id: @acct.id)
    Team.current_id   = @team.id
    Capybara.default_host = "http://#{@team.subdomain}.#{@acct.domain}"
  end

  context "with a subdomain" do

    context "as a public user" do

      HOME_PAGES.each do |page|
        it "renders /login" do
          visit "/home/#{page}"
          current_path.should == "/login"
          page.should_not be_nil
        end
      end

    end

  end

end