require 'spec_helper'

describe HomeController, "with a subdomain" do

  before(:each) do
    @team = Factory.create(:team)
    Team.current_id = @team.id
    request.host = "#{@team.subdomain}.example.com"
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
        controller.current_user.should == @user
        controller.current_team.should == @team
        controller.current_membership.should be_nil
      end

      it "redirects to /home/not_authorized" do
        get :index
        response.should redirect_to "/home/not_authorized"
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
        controller.current_user.should        == @user
        controller.current_team.should        == @team
        controller.current_membership.should  == @membership
      end

      it "renders /home/index" do
        get :index
        response.status.should == 200
      end

    end

  end

end