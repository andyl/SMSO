class SessionsController < ApplicationController

  skip_around_filter :scope_current_team

  def new
    user = User.find_by_remember_me_token(cookies[:remember_me_token])
    unless user.nil?
      session[:user_id]   = user.id
      session[:user_name] = user.full_name
      redirect_to (session[:tgt_path] || root_path), :notice => "Welcome back #{user.first_name}"
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
    session[:user_id]   = nil
    session[:user_name] = nil
    cookies[:remember_me_token] = nil
    redirect_to root_path, :notice => "Logged out!"
  end

  private

  def remember_me_setup(params, user)
    if params["remember_me"] == "1"
      cookies[:remember_me_token] = {:value => user.remember_me_token, :expires => Time.now + 6.weeks}
    else
      cookies[:remember_me_token] = nil
    end
  end

  def user_login(user)
    session[:user_id] = user.id
    session[:user_name] = user.full_name
    user.sign_in_count   += 1
    user.last_sign_in_at = Time.now
    user.password              = ""
    user.password_confirmation = ""
    user.save
  end

end
