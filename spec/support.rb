
def create_member
  Factory.create(:user)
end

# use this in requests specs, on controllers that use 'authenticate_member_with_basic_auth'
# cred = basic_auth("joe_smith")
# get '/path', nil, {'HTTP_AUTHORIZATION' => cred}
def basic_auth(username, password="welcome")
  create_member
  ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
end

# use this in requests specs, on controllers that use 'authenticate_member_with_basic_auth'
def http_login(username, password = "welcome")
  create_member
  request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username,password)
end

# use this in requests specs, on controllers that use 'authenticate_member'
def request_login(username, password = "welcome")
  post sessions_path, :login => username, :password => password
end

# use this with feature specs
def capy_login
  member = create_member
  visit login_path
  fill_in "user_name", :with => member.user_name
  fill_in "password",  :with => "welcome"
  click_button 'Log in'
  member
end
