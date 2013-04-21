require 'spec_helper'

describe SessionsController do

  describe "GET new" do

    it "renders the new template" do
      get :new
      response.should render_template("new")
      response.code.should == 200.to_s
    end

  end

  describe "POST create" do

    it "handles form input" do
      pending "learn how to set up mocks"
      user = FactoryGirl.build(:user)
      UserFinderSvc.should_receive(:by_username).and_return(user)
      post :create, user_name: "2", password: "welcome"
      response.should_not be_nil
    end

  end

end