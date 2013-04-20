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
      UserFinderSvc.should_receive(:find_by_user_name).and_return(nil)
      post :create, user_name: "2", password: "welcome"
      response.should_not be_nil
    end

  end

end