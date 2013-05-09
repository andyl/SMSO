require 'spec_helper'

describe HomeController, "with a subdomain" do

  before(:each) do
    @acct = Factory.create(:account)
    @team = Factory.create(:team, account_id: @acct.id)
    Team.current_id   = @team.id
    request.host      = "#{@team.subdomain}.#{@acct.domain}"
  end

  context "as a public user" do

    describe "GET index" do

      it "has appropriate current-object values" do
        get :index
        controller.current_team.should == @team
        controller.current_user.should    be_nil
        controller.current_membership.should  be_nil
      end

      it "redirects to /login" do
        get :index
        response.should redirect_to "/login"
      end

    end

  end

  context "as a logged-in non-member" do

    before(:each) do
      @user = Factory.create(:user)
      session[:user_id] = @user.id
    end

    describe "Get index" do

      it "has appropriate current-object values" do
        get :index
        controller.current_user.should == @user
        controller.current_team.should == @team
        controller.current_membership.should be_nil
      end

      it "redirects to /info/no_access" do
        get :index
        response.should redirect_to "/info/no_access"
      end

    end

  end

  context "as a logged-in active member" do

    before(:each) do
      @user = Factory.create(:user)
      session[:user_id] = @user.id
      @membership = Factory.create(:membership, user_id: @user.id, team_id: @team.id)
    end

    describe "Get index" do

      it "has appropriate current-object values" do
        get :index
        controller.current_user.should        == @user
        controller.current_team.should        == @team
        controller.current_membership.should  == @membership
      end

      it "renders /home/index" do
        get :index
        response.status.should == 302
      end

    end

  end

end