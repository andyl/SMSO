require 'spec_helper'

describe AccountDomainValidator do

  before(:each) do
    @account = Factory.create :account
    @team    = Factory.create :team
  end

  describe "#validate" do

    context "when Team#alt_domain is blank" do

      it "is valid" do
        @account.should be_valid
      end

    end

    context "when Team#alt_domain is not blank" do

      context "with conflicting Account domain"

      context "with no conflicting Account domain"

    end

  end

end