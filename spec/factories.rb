Factory = FactoryGirl

Factory.define do

  factory :account do
    typ "enterprise"
    sequence :name     do |n| "Account#{n}"     end
    sequence :domain   do |n| "account#{n}.com" end
    sequence :account_team_id do |n| n end
  end

  factory :team do
    typ "field"
    sequence :name      do |n| "Team#{n}"  end
    sequence :subdomain do |n| "team#{n}"  end
  end

  factory :team_tweet do
    sequence :body do |n| "team tweet ##{n}" end
  end

  factory :membership do
    sequence :team_id do |n| n end
    sequence :user_id do |n| n end
  end

  factory :user do
    first_name "John"
    sequence :last_name  do |n| "Do#{'e' * n}" end
    password "welcome"
    password_confirmation "welcome"
    
    #ignore do add_count 3 end
    
    #trait :with_phone do
    #  after(:create) do |member, evaluator|
    #    FactoryGirl.create_list(:phone, evaluator.add_count, :member => member)
    #  end
    #  after(:stub) do |member, evaluator|
    #    FactoryGirl.build_stubbed_list(:phone, evaluator.add_count, :member => member)
    #  end
    #end
    
  #  trait :with_email do
  #    after(:create) do |member, evaluator|
  #      FactoryGirl.create_list(:email, evaluator.add_count, :member => member)
  #    end
  #  end
  #
  #  factory :member_with_phone, :traits => [:with_phone]
  #  factory :member_with_email, :traits => [:with_email]
  #  factory :member_with_phone_and_email, :traits => [:with_email, :with_phone]
  #  factory :member_with_email_and_phone, :traits => [:with_email, :with_phone]
  #
  end
  #
  #factory :email do
  #  pagable  "1"
  #  sequence :address do |n| "member#{n}@email.com" end
  #end
  #
  #factory :phone do
  #  pagable  "1"
  #  sequence :sms_email do |n| "sms#{n}@sms_mail.com" end
  #  sequence :number    do |n|
  #    num = n.to_s
  #    idx = num.length * -1 - 1
  #    base = "650-432-0000"
  #    base[0..idx] + num
  #  end
  #end
  #
  #factory :message do
  #end
  #
  #factory :distribution do
  #  association :message
  #end

end