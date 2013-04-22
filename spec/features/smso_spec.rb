require 'spec_helper'

describe "Smso", :capybara => true do

  SMSO_PAGES.each do |zpage|
    it "renders smso/#{zpage}" do
      visit "/smso/#{zpage}"
      current_path.should == "/smso/#{zpage}"
      page.should_not be_nil
    end
  end

end