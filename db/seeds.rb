# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'factory_girl_rails'

User.all.each {|usr| usr.destroy}

FactoryGirl.create(:user, first_name: "Andy", last_name: "Leak")
FactoryGirl.create(:user)
FactoryGirl.create(:user)
FactoryGirl.create(:user)