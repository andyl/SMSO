require 'spec_helper'

describe AccountCreationSvc do

  def gen_account(typ = "enterprise")
    AccountCreationSvc.create("SMSO-ESB", "smso-esb.org", typ)
  end

  describe "#create" do

    context "enterprise account" do
      it "generates valid account and team" do
        @account = gen_account("enterprise")
        @account.should be_valid
        @account.should be_an Account
        @account.account_team.should be_valid
        @account.account_team.should be_a Team
      end
    end

    context "hosting account"
    it "generates valid account and team" do
      @account = gen_account("hosting")
      @account.should be_valid
      @account.should be_an Account
      @account.account_team.should be_valid
      @account.account_team.should be_a Team
    end

    context "support account"
    it "generates valid account and team" do
      @account = gen_account("support")
      @account.should be_valid
      @account.should be_an Account
      @account.account_team.should be_valid
      @account.account_team.should be_a Team
    end

  end

end