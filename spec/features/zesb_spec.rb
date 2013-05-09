require 'spec_helper'

describe "Zesb", :capybara => true do

  before(:each) do
    @acct = Factory.create(:account)
    @team = Factory.create(:team, account_id: @acct.id)
    Team.current_id   = @team.id
    Capybara.default_host = "http://#{@team.subdomain}.#{@acct.domain}"
  end

  ZESB_PAGES.each do |zpage|
    it "renders zesb/#{zpage}" do
      visit "/zesb/#{zpage}"
      current_path.should == "/zesb/#{zpage}"
      page.should_not be_nil
    end
  end

end