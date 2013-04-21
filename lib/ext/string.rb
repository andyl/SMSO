class String

  def is_userid?
    self.to_i.to_s == self
  end
  alias is_userid is_userid?

  def is_email_address?
    self.match(/^[a-zA-Z0-9\_\.\-]+@[a-zA-Z0-9\_\-\.]+\.[a-zA-Z]{2,4}$/)
  end
  alias is_email_address is_email_address?

  def is_username?
    self.match /^@?[A-Za-z][A-Za-z0-9\-\_]+$/
  end
  alias is_username is_username?

  def identification_type
    return "email"    if self.is_email_address?
    return "username" if self.is_username?
    return "userid"   if self.is_userid?
    nil
  end

  def username_normalize
    return self[1..-1] if self[0] == "@"
    self
  end

end