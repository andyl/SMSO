class SessionsController < ApplicationController

  skip_around_filter :scope_current_team

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
    if user && user.authenticate(params[:password])
      #BrowserProfile.create(params["browser"].merge({member_id: member.id}))
      #ActiveSupport::Notifications.instrument("login.browser.form", {:member => member})
      remember_me_setup(params, user)
      user_login(user)
      redirect_to (session[:tgt_path] || root_path), :notice => "Logged in!"
    else
      #ActiveSupport::Notifications.instrument("login.browser.invalid", {:text => params[:user_name]})
      flash.now.alert = "Invalid user name or password"
      render "new"
    end
  end

  def destroy
    #ActiveSupport::Notifications.instrument("logout.browser", {:member => current_member})
    session[:member_id] = nil
    session[:member_name] = nil
    cookies[:remember_me_token] = nil
    redirect_to root_path, :notice => "Logged out!"
  end

end
