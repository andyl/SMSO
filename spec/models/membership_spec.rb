require 'spec_helper'

describe Membership do

  def valid_params
    {
      user_id:       1,
      team_id:       1
    }
  end

  describe "Object Attributes" do
    before(:each) { @obj = FactoryGirl.build(:membership) }
    specify { @obj.should respond_to(:user_id)  }
    specify { @obj.should respond_to(:team_id)  }
  end

  describe "Object Creation" do

    it "generates in-memory object" do
      @obj = Membership.new(valid_params)
      @obj.should be_valid
    end

    it "saves the object to the database" do
      @obj = Membership.create(valid_params)
      @obj.should be_valid
    end

    it "creates memberships with factories" do
      @user = Factory.create :user
      @team = Factory.create :team
      @mobj = Factory.create :membership, :user_id => @user.id, :team_id => @team.id
      @mobj.should be_valid
      @mobj.team.should == @team
      @mobj.user.should == @user
    end

  end

  describe "Associations" do
     before(:each) { @obj = Membership.new }
     specify { @obj.should respond_to(:user)     }
     specify { @obj.should respond_to(:team)     }
  end

end


# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  typ        :string(255)
#  admin      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
