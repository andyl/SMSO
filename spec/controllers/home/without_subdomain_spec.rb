require 'spec_helper'

describe HomeController, "without subdomain" do

  context "as a public user" do

    describe "GET index" do

      it "has appropriate current-object values" do
        get :index
        controller.current_user.should       be_nil
        controller.current_team.should       be_nil
        controller.current_membership.should be_nil
      end

      it "redirects to http:///info/domain_not_found" do
        request.subdomain.should == ""
        get :index
        response.status.should == 302
        response.should redirect_to "http:///info/domain_not_found"
      end

    end

  end

  context "as a logged-in active member"

  context "as a logged-in inactive member"

  context "as a logged-in non-member" do

    before(:each) do
      @user = Factory.create :user
      session[:user_id] = @user.id
    end

    describe "Get index" do

      it "has appropriate current-object values" do
        get :index
        controller.current_user.should       == @user
        controller.current_team.should       be_nil
        controller.current_membership.should be_nil
      end

      it "redirects to http:///info/domain_not_found" do
        get :index
        response.should redirect_to "http:///info/domain_not_found"
      end

    end

  end

end
