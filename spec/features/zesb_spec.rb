require 'spec_helper'

describe "Zesb", :capybara => true do

  zesb_pages  = %w(index banded banner blog boxy contact feed grid icons)
  zesb_pages += %w(marketing orbit realty sidebar store tables workspace)
  zesb_pages.each do |zpage|
    it "renders zesb/#{zpage}" do
      visit "/zesb/#{zpage}"
      current_path.should == "/zesb/#{zpage}"
      page.should_not be_nil
    end
  end

end