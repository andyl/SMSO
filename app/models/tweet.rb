class TeamTweet < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_one   :member
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

