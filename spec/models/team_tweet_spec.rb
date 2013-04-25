# == Schema Information
#
# Table name: team_tweets
#
#  id            :integer          not null, primary key
#  team_id       :integer
#  membership_id :integer
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe TeamTweet do

  def valid_params
    {
      membership_id:       1,
      team_id:             1,
      body:      "some text here"
    }
  end

  describe "Object Attributes" do
    before(:each) { @obj = FactoryGirl.build(:team_tweet) }
    specify { @obj.should respond_to(:membership_id)  }
    specify { @obj.should respond_to(:team_id)        }
  end

  describe "Object Creation" do

    it "generates in-memory object" do
      @obj = TeamTweet.new(valid_params)
      @obj.should be_valid
    end

    it "saves the object to the database" do
      @obj = TeamTweet.create(valid_params)
      @obj.should be_valid
    end

  end

  describe "Associations" do
     before(:each) { @obj = TeamTweet.new }
     specify { @obj.should respond_to(:membership)     }
     specify { @obj.should respond_to(:team)           }
  end

end

# == Schema Information
#
# Table name: team_tweets
#
#  id         :integer          not null, primary key
#  member_id    :integer
#  team_id    :integer
#  typ        :string(255)
#  admin      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
