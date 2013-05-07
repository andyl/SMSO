class Account < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_many :teams, :dependent => :destroy

  # ----- Validations -----
  validates :typ, :presence => true
  validates :typ, :format   => { :with => /enterprise|hosting|support/ }

  validates_presence_of    :name, :domain
  validates_uniqueness_of  :name, :domain

  validates_with TeamAltDomainValidator

  # ----- Callbacks -----

  # ----- Scopes -----

  # ----- Class Methods ----

  # ----- Instance Methods -----

end