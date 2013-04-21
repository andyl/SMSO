require [Rails.root.to_s, "/lib/parsers/name_parser"].join

class User < ActiveRecord::Base

  has_secure_password

  # ----- Associations -----
  # has_many :emails,             :order => 'position', :dependent => :destroy
  # has_many :addresses,          :order => 'position', :dependent => :destroy
  # has_many :phones,             :order => 'position', :dependent => :destroy
  # has_many :avatars,            :order => 'position', :dependent => :destroy
  # has_many :other_infos,        :order => 'position', :dependent => :destroy
  # has_many :emergency_contacts, :order => 'position', :dependent => :destroy

  # ----- Validations -----
  validates_presence_of   :first_name,  :last_name, :user_name
  validates_format_of     :title,       :with => /^[A-Za-z\\.]+$/, :allow_blank => true
  validates_format_of     :first_name,  :with => /^[A-Za-z]+$/
  validates_format_of     :middle_name, :with => /^[A-Za-z]+$/,    :allow_blank => true
  validates_format_of     :last_name,   :with => /^[A-Za-z \\-]+$/
  validates_format_of     :user_name,   :with => /^[A-Za-z_0-9\\.\\-]+$/
  validates_format_of     :password,    :with => /^[A-z0-9]*$/
  validates_uniqueness_of :user_name

  # ----- Callbacks -----
  before_validation :set_username,               :on => :create
  before_validation :set_remember_me_token,    :if => :password_digest_changed?

  # ----- Scopes -----

  # ----- Virtual Attributes (Accessors) -----

  def full_name
    lcl_title  = title.blank? ? "" : title + " "
    lcl_middle = middle_name.blank? ? "" : middle_name + " "
    lcl_title + first_name + " " + lcl_middle + last_name
  end

  def full_name=(input)
    if input.blank?
      self.title = self.first_name = self.middle_name = self.last_name = ""
      return
    end
    parser = Parsers::NameParser.new
    hash   = parser.all.parse(input)
    self.title       = hash[:title]
    self.first_name  = hash[:first_name]
    self.middle_name = hash[:middle_name]
    self.last_name   = hash[:last_name]
  end

  # ----- generate username on create -----

  def set_username
    return unless self.user_name.blank?
    return if self.first_name.blank? || self.last_name.blank?
    ext = ""
    tgt = "#{self.first_name.downcase}#{self.last_name.downcase[0]}"
    while User.find_by_user_name("#{tgt}#{ext}") do
      ext = 1 if ext.blank?
      ext += 1
    end
    self.user_name = "#{tgt}#{ext}"
  end

  # ----- Token Stuff - Move this to a Service(?) -----

  def reset_forgot_password_token
    Time.zone = "Pacific Time (US & Canada)"
    self.forgot_password_token      = rand(36 ** 8).to_s(36)
    self.forgot_password_expires_at = Time.now + 30.minutes
    self.save
  end

  def clear_forgot_password_token
    self.forgot_password_token = nil
    self.forgot_password_expires_at = nil
    self.save
  end

  def set_remember_me_token
    self.remember_me_token = rand(36 ** 16).to_s(36)
  end

end
