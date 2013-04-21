class Team < ActiveRecord::Base

  # ----- Attributes -----
  cattr_accessor :current_id

  # ----- Associations -----
  has_many :team_tweets,  :dependent => :destroy
  has_many :memberships,  :dependent => :destroy
  has_many :users,        :through   => :memberships, :uniq => true

  # ----- Validations -----
  validates_presence_of    :name, :subdomain
  validates_uniqueness_of  :name, :subdomain
  
  # ----- Callbacks -----
  
  # ----- Scopes -----
  default_scope { where(id: Team.current_id) }

  # ----- Class Methods ----

  # ----- Instance Methods -----

end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  subdomain  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#