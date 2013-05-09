require 'spec_helper'

describe SessionsController do

  before(:each) do
    @acct = Factory.create(:account)
    @team = Factory.create(:team, account_id: @acct.id)
    Team.current_id   = @team.id
    request.host      = "#{@team.subdomain}.#{@acct.domain}"
  end

  describe "GET new" do

    it "renders the new template" do
      get :new
      response.should render_template("new")
      response.code.should == 200.to_s
    end

  end

  describe "POST create" do

    it "handles form input" do
      user = FactoryGirl.build(:user)
      UserFinderSvc.should_receive(:by_username).and_return(user)
      user.should_receive(:authenticate).and_return(true)
      post :create, user_name: "2", password: "welcome"
      response.should_not be_nil
    end

  end

end