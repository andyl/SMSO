# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'factory_girl_rails'

puts "Clearing old data"
def del_all(klas) klas.all.each {|k| k.destroy}; end
[User, Account, Team, Membership, TeamTweet].each {|k| del_all(k)}

puts "Creating users"

al = FactoryGirl.create(:user, first_name: "Andy",  last_name: "Leak")
db = FactoryGirl.create(:user, first_name: "Dan",   last_name: "Bennett")
js = FactoryGirl.create(:user, first_name: "Joe",   last_name: "Sheridan")
cc = FactoryGirl.create(:user, first_name: "Chris", last_name: "Co")
ml = FactoryGirl.create(:user, first_name: "Mark",  last_name: "Lopensky")
mr = FactoryGirl.create(:user, first_name: "Matt",  last_name: "Rossi")
wg = FactoryGirl.create(:user, first_name: "Will",  last_name: "Gillmore")
la = FactoryGirl.create(:user, first_name: "Lars",  last_name: "Antholtz")

puts "Creating accounts"

a1 = AccountCreationSvc.create("SMSO",      "smso.com")
a2 = AccountCreationSvc.create("X440",      "x440.com", "hosting")
a3 = AccountCreationSvc.create("VisiTeams", "vt.com",   "support")
a3.set_as_fallback

puts "Creating teams"

t1 = FactoryGirl.create(:team, account: a1, name: "SCU",    subdomain: "scu")
t2 = FactoryGirl.create(:team, account: a1, name: "ESB",    subdomain: "esb")
t3 = FactoryGirl.create(:team, account: a1, name: "SVIP",   subdomain: "svip")
t4 = FactoryGirl.create(:team, account: a1, name: "BAMRU",  subdomain: "bamru", logo_text: "BAMRU.net", altdomain: "bmru.net")
t5 = FactoryGirl.create(:team, account: a1, name: "SMCSAR", subdomain: "smcsar")

def adduser(team, user, typ = 'guest')
  FactoryGirl.create(:membership, :team_id => team.id, :user_id => user.id, :typ => typ)
end

def addtweet(team, member)
  team.team_tweets << FactoryGirl.create(:team_tweet, :membership_id => member.id)
  team.save
end

puts "Adding users to teams"

adduser a1.account_team, al, 'active'
adduser a2.account_team, al, 'active'
adduser a3.account_team, al, 'active'
adduser t1, db
adduser t1, la
adduser t2, js
adduser t3, cc
adduser t4, al, 'active'
adduser t4, wg, 'admin'
adduser t4, la
adduser t5, ml
adduser t5, mr
adduser t5, al, 'active'

puts "Adding tweets to teams"

addtweet(t1, db)
addtweet(t1, db)
addtweet(t1, la)
addtweet(t4, al)
addtweet(t4, la)
