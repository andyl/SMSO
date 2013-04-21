class SessionsController < ApplicationController

  def new
    #member = Member.find_by_remember_me_token(cookies[:remember_me_token])
    member = nil
    unless member.nil?
      session[:member_id] = member.id
      session[:member_name] = member.short_name
      ActiveSupport::Notifications.instrument("login.browser.cookie", {:member => member})
      redirect_to (session[:tgt_path] || root_path), :notice => "Welcome back #{member.first_name}"
    end
  end

  def create
    user = UserFinderSvc.by_username(params[:user_name])
    auth = PasswordAuthenticationSvc.new
    if user && auth.authenticate(params[:password])
      #BrowserProfile.create(params["browser"].merge({member_id: member.id}))
      if params["remember_me"] == "1"
        cookies[:remember_me_token] = {:value => user.remember_me_token, :expires => Time.now + 6.weeks}
      else
        cookies[:remember_me_token] = nil
      end
      #ActiveSupport::Notifications.instrument("login.browser.form", {:member => member})
      member_login(user)
      redirect_to (session[:tgt_path] || root_path), :notice => "Logged in!"
    else
      ActiveSupport::Notifications.instrument("login.browser.invalid", {:text => params[:user_name]})
      flash.now.alert = "Invalid user name or password"
      render "new"
    end
  end

  def destroy
    ActiveSupport::Notifications.instrument("logout.browser", {:member => current_member})
    session[:member_id] = nil
    session[:member_name] = nil
    cookies[:remember_me_token] = nil
    redirect_to root_path, :notice => "Logged out!"
  end

end
