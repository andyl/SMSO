class Account < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  has_many :teams,        :dependent => :destroy

  # ----- Validations -----
  validates_presence_of    :name

  # ----- Callbacks -----

  # ----- Scopes -----

  # ----- Class Methods ----

  # ----- Instance Methods -----

end
