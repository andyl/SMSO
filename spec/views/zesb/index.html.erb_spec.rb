require "spec_helper"

describe "zesb/index.html.erb" do
  it "renders properly" do
    render
    rendered.should_not be_nil
  end
end