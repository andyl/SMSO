# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'factory_girl_rails'

User.all.each {|usr| usr.destroy}

al = FactoryGirl.create(:user, first_name: "Andy",  last_name: "Leak")
db = FactoryGirl.create(:user, first_name: "Dan",   last_name: "Bennett")
js = FactoryGirl.create(:user, first_name: "Joe",   last_name: "Sheridan")
cc = FactoryGirl.create(:user, first_name: "Chris", last_name: "Co")
ml = FactoryGirl.create(:user, first_name: "Mark",  last_name: "Lopensky")
mr = FactoryGirl.create(:user, first_name: "Matt",  last_name: "Rossi")
wg = FactoryGirl.create(:user, first_name: "Will",  last_name: "Gillmore")
la = FactoryGirl.create(:user, first_name: "Lars",  last_name: "Antholtz")

t1 = FactoryGirl.create(:team, name: "SCU",    subdomain: "scu")
t2 = FactoryGirl.create(:team, name: "ESB",    subdomain: "esb")
t3 = FactoryGirl.create(:team, name: "SVIP",   subdomain: "svip")
t4 = FactoryGirl.create(:team, name: "BAMRU",  subdomain: "bamru")
t5 = FactoryGirl.create(:team, name: "SMCSAR", subdomain: "smcsar")

def adduser(team, user)
  FactoryGirl.create(:membership, :team_id => team.id, :user_id => user.id)
end

def addtweet(team, member)
  team.team_tweets << FactoryGirl.create(:team_tweet, :membership_id => member.id)
  team.save
end

adduser t1, db
adduser t1, la
adduser t2, js
adduser t3, cc
adduser t4, al
adduser t4, wg
adduser t4, la
adduser t5, ml
adduser t5, mr

addtweet(t1, db)
addtweet(t1, db)
addtweet(t1, la)
addtweet(t4, al)
addtweet(t4, la)





