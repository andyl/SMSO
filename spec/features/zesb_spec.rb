require 'spec_helper'

describe "Zesb", :capybara => true do

  ZESB_PAGES.each do |zpage|
    it "renders zesb/#{zpage}" do
      visit "/zesb/#{zpage}"
      current_path.should == "/zesb/#{zpage}"
      page.should_not be_nil
    end
  end

end