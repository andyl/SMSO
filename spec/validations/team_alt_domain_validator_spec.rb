require 'spec_helper'

describe TeamAltDomainValidator do

  before(:each) do
    @account = Factory.create :account
    @team    = Factory.create :team
  end

  describe "#validate" do

    context "with conflicting Team alt-domain" do

      it "is not valid" do
        @team.update_attributes     altdomain: "xxx.com"
        @account.update_attributes     domain: "xxx.com"
        @team.should be_valid
        @account.should_not be_valid
      end

    end

    context "with no conflicting Team alt-domain" do

      it "is valid" do
        @team.update_attributes     altdomain: "test.com"
        @account.update_attributes     domain: "xxx.com"
        @team.should be_valid
        @account.should be_valid
      end

    end

  end

end
