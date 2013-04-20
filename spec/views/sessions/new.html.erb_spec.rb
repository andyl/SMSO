require "spec_helper"

describe "sessions/new.html.erb" do
  it "renders the login form" do
    render
    rendered.should_not be_nil
    rendered.should contain "Remember"
    rendered.should have_selector("form", method: "post", action: "/sessions")
    rendered.should have_selector("#password", name: "password")
    rendered.should have_selector("#user_name", name: "user_name")
  end
end