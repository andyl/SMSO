class Account < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_many :teams,        :dependent  => :destroy
  has_one  :account_team, :class_name => 'Team'

  # ----- Validations -----
  validates :typ, :presence => true
  validates :typ, :format   => { :with => /enterprise|hosting|support/ }

  validates_presence_of    :name, :domain, :account_team_id
  validates_uniqueness_of  :name, :domain, :account_team_id

  validates_with TeamAltDomainValidator

  # ----- Callbacks -----

  # ----- Scopes -----

  # ----- Class Methods ----

  # ----- Instance Methods -----

end