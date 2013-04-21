require 'spec_helper'

describe User do

  def valid_params
    pwd = "hello"
    {
      first_name: "Joe",
      last_name:  "Smith",
      password:   pwd,
      password_confirmation: pwd
    }
  end

  def base_username
    vp = valid_params
    "#{vp[:first_name].downcase}#{vp[:last_name][0].downcase}"
  end

  describe "Object Attributes" do
    before(:each) { @obj = FactoryGirl.build(:user) }
    specify { @obj.should respond_to(:first_name) }
    specify { @obj.should respond_to(:last_name)  }
    specify { @obj.should respond_to(:user_name)  }
  end

  describe "Object Creation" do

    it "handles user creation" do
      @obj = User.new(valid_params)
      @obj.should be_valid
    end

    it "saves the user to the database" do
      @obj = User.create(valid_params)
      @obj.should be_valid
    end

  end

  describe "@user_name" do

    it "generates on create" do
      @obj = User.create(valid_params)
      @obj.user_name.should == base_username
    end

    it "increments on duplicate usernames" do
      @obj1 = User.create(valid_params)
      @obj1.user_name.should == base_username
      @obj2 = User.create(valid_params)
      @obj2.user_name.should == base_username + "2"
    end

  end

  describe "#full_name" do

    it "generates a valid string" do
      @obj = User.create(valid_params)
      @obj.full_name.should_not be_nil
      @obj.full_name.should be_a String
    end

  end

  describe "#full_name=" do

    it "handles a simple name" do
      name = "Joe Smith"
      @obj = User.new
      @obj.full_name = name
      @obj.first_name.should == "Joe"
      @obj.last_name.should  == "Smith"
      @obj.full_name.should == name
    end

    it "updates a complex name" do
      @obj = User.new
      name = "Sgt. Joe Barton van den Rijn"
      @obj.full_name = name
      @obj.title.should == "Sgt."
      @obj.first_name.should == "Joe"
      @obj.middle_name.should == "Barton"
      @obj.last_name.should  == "van den Rijn"
      @obj.full_name.should == name
    end

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

  describe "Validation" do

  end

end

