class Account < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_many    :teams,        :dependent  => :destroy
  belongs_to  :account_team, :class_name => 'Team'

  # ----- Validations -----
  validates :typ, :presence => true
  validates :typ, :format   => { :with => /enterprise|hosting|support/ }

  validates_presence_of    :name, :domain, :account_team_id
  validates_uniqueness_of  :name, :domain, :account_team_id

  validates_with TeamAltDomainValidator

  # ----- Callbacks -----

  # ----- Scopes -----

  def self.fallback
    where(fallback: true).first
  end

  # ----- Class Methods ----

  # ----- Instance Methods -----

  def set_as_fallback
    Account.where(fallback: true).all.each do |acc|
      acc.update_attributes fallback: false
    end
    self.update_attributes fallback: true
  end

end