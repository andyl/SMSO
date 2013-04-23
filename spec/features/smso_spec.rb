require 'spec_helper'

describe "Smso", :capybara => true do

  # root path points to smso#index...
  it "renders /" do
    visit "/"
    current_path.should == "/"
    page.should_not be_nil
  end

  SMSO_PAGES.each do |zpage|
    it "renders smso/#{zpage}" do
      visit "/smso/#{zpage}"
      current_path.should == "/smso/#{zpage}"
      page.should_not be_nil
    end
  end

end