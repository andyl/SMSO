class Membership < ActiveRecord::Base

  # ----- Attributes -----

  # ----- Associations -----
  belongs_to  :user
  belongs_to  :team
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

# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  typ        :string(255)
#  admin      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
