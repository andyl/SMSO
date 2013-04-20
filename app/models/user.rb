class User < ActiveRecord::Base

  has_secure_password

  # ----- Attributes -----

  # ----- Associations -----
  # has_many :addresses,          :order => 'position', :dependent => :destroy
  # has_many :phones,             :order => 'position', :dependent => :destroy
  # has_many :emails,             :order => 'position', :dependent => :destroy
  # has_many :avatars,            :order => 'position', :dependent => :destroy
  # has_many :other_infos,        :order => 'position', :dependent => :destroy
  # has_many :emergency_contacts, :order => 'position', :dependent => :destroy

  # ----- Validations -----
  # validates_presence_of   :first_name,  :last_name, :user_name
  # validates_format_of     :title,       :with => /^[A-Za-z\\.]+$/, :allow_blank => true
  # validates_format_of     :first_name,  :with => /^[A-Za-z]+$/
  # validates_format_of     :middle_name, :with => /^[A-Za-z]+$/
  # validates_format_of     :last_name,   :with => /^[A-Za-z\\- ]+$/
  # validates_format_of     :user_name,   :with => /^[a-z_\\.\\-]+$/
  # validates_format_of     :password,    :with => /^[A-z0-9]*$/
  # validates_uniqueness_of :user_name

  # validate :check_full_name_errors

  # def check_full_name_errors
  #   if errors.include?(:first_name) ||
  #           errors.include?(:last_name)  ||
  #           errors.include?(:user_name)  ||
  #           errors.include?(:title)
  #     errors.add(:full_name, "has errors")
  #   end
  # end

  # ----- Callbacks -----
  # before_validation :check_first_name_for_title
  # before_validation :set_username_and_name_fields
  # before_validation :set_pwd,                  :on => :create
  # before_validation :set_remember_me_token,    :if => :password_digest_changed?

  # ----- Scopes -----

  # ----- Class Methods ----

  # ----- Virtual Attributes (Accessors) -----

  def full_name
    "#{title.blank? ? "" : title + ' '}#{first_name} #{last_name}"
  end

  def full_name=(input)
    if input.blank?
      self.title = self.first_name = self.last_name = ""
      return
    end
    str = input.split(' ')
    if str[0].include?('.')
      self.title      = str[0].try(:capitalize_all)
      self.first_name = str[1].try(:capitalize_all)
      self.last_name  = str.length > 1 ? str[2..-1].join(' ').try(:capitalize_all) : ""
    else
      self.title      = ""
      self.first_name = str[0].try(:capitalize)
      self.last_name  = str[1] ? str[1..-1].join(' ').try(:capitalize_all) : ""
    end
  end


  # ----- Instance Methods -----

  def clear_password
    self.password = ""
    self.password_confirmation = ""
  end

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

  def new_username_from_names
    return "" if first_name.blank? || last_name.blank?
    fname = self.first_name.downcase.gsub(' ','_').gsub('.','')
    lname = self.last_name.downcase.gsub(' ','_').gsub('.','')
    "#{fname}_#{lname}"
  end

  def set_pwd
    if self.password.blank?
      self.password = "welcome"
      self.password_confirmation = "welcome"
    end
    set_remember_me_token
  end

  def new_names_from_username
    return ["",""] if user_name.blank?
    user_name.split('_').map {|n| n.capitalize_all }
  end

  def cleanup_user_names
    self.user_name  = self.user_name.downcase unless self.user_name.blank?
    self.first_name = self.first_name.capitalize unless self.first_name.blank?
    self.last_name  = self.last_name.capitalize_all unless self.last_name.blank?
  end

  def names_changed?
    self.first_name_changed? || self.last_name_changed?
  end

  def names_blank?
    self.first_name.blank? && self.last_name.blank?
  end

  def set_username_and_name_fields
    self.user_name = new_username_from_names if names_changed?
    self.user_name = new_username_from_names if self.user_name.blank?
    self.first_name, self.last_name = new_names_from_username if names_blank?
    cleanup_user_names
  end

end
