require 'spec_helper'

describe Team do

  def valid_params
    {
      name:       "TeamX",
      subdomain:  "teamx"
    }
  end

  describe "Object Attributes" do
    before(:each) { @obj = FactoryGirl.build(:team) }
    specify { @obj.should respond_to(:name)       }
    specify { @obj.should respond_to(:subdomain)  }
  end

  describe "Object Creation" do

    it "generates in-memory object" do
      @obj = Team.new(valid_params)
      @obj.should be_valid
    end

    it "saves the object to the database" do
      @obj = Team.create(valid_params)
      @obj.should be_valid
    end

  end

  describe "Associations" do
     before(:each) { @obj = Team.new }
     specify { @obj.should respond_to(:users)           }
     specify { @obj.should respond_to(:memberships)     }
     specify { @obj.should respond_to(:team_tweets)     }
  end

  describe "Validations" do
     context "self-contained" do
       it { should validate_presence_of(:name)                   }
       it { should validate_presence_of(:subdomain)              }
     end
     context "inter-object" do
       before(:each) { Team.create!(valid_params) }
       it { should validate_uniqueness_of(:name)             }
       it { should validate_uniqueness_of(:subdomain)        }
     end
  end

end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  subdomain  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#