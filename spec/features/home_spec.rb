require 'spec_helper'

describe "Home", :capybara => true do

  it "renders /" do
    visit "/"
    current_path.should == "/"
    page.should_not be_nil
  end

  HOME_PAGES.each do |zpage|
    it "renders home/#{zpage}" do
      visit "/home/#{zpage}"
      current_path.should == "/home/#{zpage}"
      page.should_not be_nil
    end
  end

end