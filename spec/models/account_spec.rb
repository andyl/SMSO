require 'spec_helper'

describe Account do

  def valid_params
    {
      name:   "AccountX",
      domain: "account.com"
    }
  end

  describe "Object Attributes" do
    before(:each) { @obj = Factory.build(:account) }
    specify { @obj.should respond_to(:name)        }
    specify { @obj.should respond_to(:domain)      }
  end

  describe "Object Creation" do

    it "generates in-memory object" do
      @obj = Account.new(valid_params)
      @obj.should be_valid
    end

    it "saves the object to the database" do
      @obj = Account.create(valid_params)
      @obj.should be_valid
    end

  end

  describe "Associations" do
     before(:each) { @obj = Account.new }
     specify { @obj.should respond_to(:teams)           }
  end

  describe "Validations" do
     context "self-contained" do
       it { should validate_presence_of(:name)                }
       it { should validate_presence_of(:domain)              }
     end
     context "inter-object" do
       before(:each) { Account.create!(valid_params) }
       it { should validate_uniqueness_of(:name)             }
       it { should validate_uniqueness_of(:domain)           }
     end
  end

end
