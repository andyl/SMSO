# Find a user from the email address, username or userid.

class UserSelectorSvc

  def self.find_by_user_name(input_string)

  end

  private

  def self.input_type(input_string)
    return "email" if email?(input_string)
    return "username" if username?(input_string)
    return "userid"
  end

  def self.email?(input_string)
    input_string.include? '@' && input_string[0] != '@'
  end

  def self.username?(input_string)
    ! email?(input_string) && input_string.
    string.split()
  end

  def self.userid?(input_string)
  end

end