require 'spec_helper'

describe TeamLocatorSvc do

  describe ".find" do

    it "matches subdomain" do
      acct = Factory.create :account
      team    = Factory.create :team, account_id: acct.id
      xacct, xteam = TeamLocatorSvc.find acct.domain, team.subdomain
      xacct.should == acct
      xteam.should == team
    end

    it "matches altdomain" do
      acct = Factory.create :account
      team = Factory.create :team, account_id: acct.id
      team.update_attributes altdomain: "xxxx.com"
      xacct, xteam = TeamLocatorSvc.find "xxxx.com", ""
      xacct.should == acct
      xteam.should == team
    end

    it "matches domain" do
      acct = AccountCreationSvc.create "asdf", "asdf.com"
      xacct, xteam = TeamLocatorSvc.find acct.domain, ""
      xacct.should == acct
      xteam.should == acct.account_team
    end

    it "returns [nil,nil] when domain not found" do
      acct = Factory.create :account
      xacct, xteam = TeamLocatorSvc.find "unknown.com", ""
      xacct.should == nil
      xteam.should == nil
    end

    it "returns [account, nil] when team not found" do
      acct = Factory.create :account
      team = Factory.create :team, account_id: acct.id
      xacct, xteam = TeamLocatorSvc.find acct.domain, "unknown"
      xacct.should == acct
      xteam.should == nil
    end

  end

end