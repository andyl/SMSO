require 'spec_helper'

describe "Home", :capybara => true do

  context "with no subdomain" do

    context "as a public user" do
      HOME_PAGES.each do |page|
        it "renders /smso/not_found" do
          visit "/home/#{page}"
          current_path.should == "/smso/not_found"
          page.should_not be_nil
        end
      end
    end

    context "as a logged-in user (no teams)"

    context "as a logged-in member"

  end

  context "with a subdomain" do

    context "as a public user" do

      HOME_PAGES.each do |page|
        it "renders /login" do
          @team = Factory.create(:team)
          Capybara.default_host = "http://#{@team.subdomain}.example.com"
          visit "/home/#{page}"
          current_path.should == "/login"
          page.should_not be_nil
        end
      end

    end

  end

end