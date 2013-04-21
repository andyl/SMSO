require 'spec_helper'
require [Rails.root.to_s, "/lib/ext/string"].join

describe String do

  describe "#is_userid?" do

    it "returns true for integer" do
      "12".is_userid.should be_true
    end

    it "returns false for non-integer" do
      "asdf".is_userid.should_not be_true
    end

  end

  describe "#is_email_address?" do

    it "returns true for valid addresses" do
      "andy@asdf.com".is_email_address.should be_true
      "andy.smith@asdf.com".is_email_address.should be_true
      "andy-smith@mail.asdf.com".is_email_address.should be_true
    end

    it "returns false for invalid address" do
      "@asdf".is_email_address.should_not be_true
      "asdf".is_email_address.should_not be_true
      "123".is_email_address.should_not be_true
    end
  end

  describe "#is_username?" do

    it "returns true for valid usernames" do
      "@asdf".is_username.should be_true
      "asdf".is_username.should be_true
      "1234".is_username.should_not be_true
    end

    it "returns false for invalid usernames" do
      "asdf@qwer.com".is_username.should be_false
      "asdf#qwer".is_username.should be_false
    end

  end

  describe "#identification_type" do

    it "returns the proper ID type" do
      "1234".identification_type.should          == "userid"
      "asdf@qwer.com".identification_type.should == "email"
      "asdf".identification_type.should          == "username"
    end

    it "returns nil for unknown types" do
      "asdf qwer".identification_type.should be_nil
    end

  end

  describe "#username_normalize" do

    it "makes no change to normal strings" do
      "asdf".username_normalize.should == "asdf"
    end

    it "strips leading '@'" do
      "@asdf".username_normalize.should == "asdf"
    end

  end

end
