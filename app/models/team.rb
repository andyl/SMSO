class Team < ActiveRecord::Base

  # ----- Attributes -----
  cattr_accessor :current_id

  # ----- Associations -----
  belongs_to :account
  has_many   :team_tweets,  :dependent => :destroy
  has_many   :memberships,  :dependent => :destroy
  has_many   :users,        :through   => :memberships, :uniq => true

  # ----- Validations -----
  validates :typ, :presence => true
  validates :typ, :format   => { :with => /account|field/ }

  validates_presence_of    :name, :subdomain, :logo_text
  validates_uniqueness_of  :name, :subdomain, :logo_text, :scope => :account_id
  validates_uniqueness_of  :altdomain, :allow_blank => true

  validates_with AccountDomainValidator
  
  # ----- Callbacks -----
  before_validation :set_logo_text
  
  # ----- Scopes -----

  # ----- Class Methods ----

  # ----- Instance Methods -----

  def set_logo_text
    self.logo_text = self.name if self.logo_text.blank?
  end

end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  subdomain  :string(255)
#  logo_text  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#