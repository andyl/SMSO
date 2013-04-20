require 'spec_helper'

describe UserFinderSvc do

  before(:each) do
    #@user = FactoryGirl.create(:user)
  end

  describe "#by_username" do
    context "with valid userid"
    it "returns the correct user" do
      pending "need to get user creation working"
      user = UserFinderSvc.by_username("#{@user.id}")
      user.should == @user
    end

  end

end