require 'spec_helper'
require 'ruby-debug'

describe User do

 describe "Object Attributes" do
   before(:each) { @obj = FactoryGirl.build(:user) }
   specify { @obj.should respond_to(:first_name) }  
   specify { @obj.should respond_to(:last_name)  }  
   specify { @obj.should respond_to(:user_name)  }
 end

 describe "#full_name" do

 end

 # describe "Associations" do
 #   before(:each) { @obj = User.new }
 #   specify { @obj.should respond_to(:addresses)       }
 #   specify { @obj.should respond_to(:phones)          }
 #   specify { @obj.should respond_to(:emails)          }
 #   specify { @obj.should respond_to(:roles)           }
 #   specify { @obj.should respond_to(:avatars)         }
 # end

 # describe "Instance Methods" do
 #   before(:each) { @obj = User.new }
 # end

 # describe "Validations" do
 #   context "self-contained" do
 #     it { should validate_presence_of(:user_name)               }
 #     it { should validate_presence_of(:first_name)              }
 #     it { should validate_presence_of(:last_name)               }
 #     it { should validate_format_of(:user_name).with("xxx_yyy") }
 #     it { should validate_presence_of(:user_name)               }
 #   end
 #   context "inter-object" do
 #     before(:each) do
 #       User.create!(:user_name => "joe_louis", :password => "qwerasdf")
 #     end
 #     it { should validate_uniqueness_of(:user_name)        }
 #   end
 # end

 # describe "Object Creation" do
 #   it "works with a user_name attribute" do
 #     @obj = User.new(:user_name => "xxx_yyy")
 #     @obj.should be_valid
 #     @obj.first_name.should == "Xxx"
 #     @obj.last_name.should == "Yyy"
 #     @obj.user_name.should == "xxx_yyy"
 #   end
 #   it "works with user name attributes" do
 #     @obj = User.new(:first_name => "Xxx", :last_name => "Yyy")
 #     @obj.should be_valid
 #     @obj.first_name.should == "Xxx"
 #     @obj.last_name.should == "Yyy"
 #     @obj.user_name.should == "xxx_yyy"
 #   end
 # end

  describe "Validation" do

  end

end

