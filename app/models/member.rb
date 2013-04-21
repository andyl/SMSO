class Member < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_one  :user
  has_one  :team
  has_one  :rank
  has_many :tweets,              :dependent => :destroy

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

