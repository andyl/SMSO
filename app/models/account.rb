class Account < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_many :teams, :dependent => :destroy

  # ----- Validations -----
  validates_presence_of    :name, :domain
  validates_uniqueness_of  :name, :domain

  validates_with TeamAltDomainValidator

  # ----- Callbacks -----

  # ----- Scopes -----

  # ----- Class Methods ----

  # ----- Instance Methods -----

end