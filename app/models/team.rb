class Team < ActiveRecord::Base

  # ----- Attributes -----
  cattr_accessor :current_id

  # ----- Associations -----
  has_many :tweets,  :dependent => :destroy
  has_many :members, :dependent => :destroy
  has_many :users,   :through   => :members

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

