class Member < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_one  :user
  has_one  :team
  has_many :roles,              :dependent => :destroy
  has_many :certs,              :dependent => :destroy
  has_many :data_files
  has_many :avail_ops,          :order => 'start_on', :dependent => :destroy
  has_many :avail_dos,          :dependent => :destroy
  has_many :messages
  has_many :distributions,      :dependent => :destroy
  has_many :journals
  has_many :participants,       :dependent => :destroy
  has_many :periods, :through => :participants
  has_many :events, :through => :periods
  has_many :notices, :through => :distributions, :source => :message
  has_many :chats
  has_many :browser_profiles,   :dependent => :destroy

  # ----- Validations -----
  
  # ----- Callbacks -----
  
  # ----- Scopes -----

  # ----- Class Methods ----

  # ----- Virtual Attributes (Accessors) -----

  # ----- Virtual Attributes (Readers) -----

  # ----- Instance Methods -----

  # ----- For Error Reporting -----

end

