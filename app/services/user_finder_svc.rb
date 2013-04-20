# Find a user from the email address, username or userid.
# returns one user, or nil

class UserFinderSvc

  # Public: Find a user by email, username or userid.
  #
  # identifier: can be an email address, username or userid
  #
  # Returns a single User or nil if there is no match.
  def self.by_username(identifier)

  end

  private

  def self.identifier_type(input_string)
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