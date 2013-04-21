class TeamTweet < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_one   :membership
  has_one   :team

  # ----- Validations -----
  
  # ----- Callbacks -----
  
  # ----- Scopes -----
  default_scope { where(team_id: Team.current_id) }

  # ----- Class Methods ----

  # ----- Virtual Attributes (Accessors) -----

  # ----- Virtual Attributes (Readers) -----

  # ----- Instance Methods -----

  # ----- For Error Reporting -----

end

# == Schema Information
#
# Table name: team_tweets
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  member_id  :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
