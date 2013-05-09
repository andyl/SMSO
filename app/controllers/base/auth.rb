class ActionController::Base

  # ----- current-objects -----

  def current_team
    return nil if session[:team_id].blank?
    @current_team ||= Team.find(session[:team_id])
  end
  helper_method :current_team

  def current_membership
    return nil if current_team.nil?
    @current_membership ||= Membership.where(user_id: session[:user_id], inactive: false).first if session[:user_id]
  end
  helper_method :current_membership

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # ----- predicates -----

  def no_current_team? ; ! current_team ;  end

  def valid_membership?; !current_membership.nil?  end
  def invalid_membership?; current_membership.nil?   end
  helper_method :valid_membership?, :invalid_membership?

  def user_signed_in?     ; !current_user.nil?  end
  def user_not_signed_in? ; current_user.nil?   end
  helper_method :user_signed_in?, :user_not_signed_in?

  # ----- team identification/selection -----

  def set_team_id
    return if [request.domain, request.subdomain] == [session[:team_domain], session[:team_subdomain]]
    account, team = TeamLocatorSvc.find(request.domain, request.subdomain)
    (domain_not_found        ; return false) if account.nil?
    (team_not_found(account) ; return false) if team.nil?
    session[:team_id]        = team.id
    session[:team_domain]    = request.domain
    session[:team_subdomain] = request.subdomain
  end

  def reset_team_session
    session[:team_id]        = ""
    session[:team_domain]    = ""
    session[:team_subdomain] = ""
  end

  def domain_not_found
    reset_team_session
    redirect_to "http://#{Account.fallback.try(:domain)}/domain_not_found"
  end

  def team_not_found(account)
    reset_team_session
    redirect_to "http://#{account.domain}/team_not_found"
  end

  # ----- web authentication -----

  def authenticate_membership!
    if no_current_team?
      redirect_to "http://#{request.domain}/smso/not_found"
      return false
    end
    if authenticate_user!
      redirect_to "/home/not_authorized" if invalid_membership?
    end
  end

  def authenticate_user!
    if user_not_signed_in?
      session[:tgt_subdomain] = request.subdomain
      session[:tgt_path]      = request.url
      redirect_to '/login', :alert => "You must log in to access this page"
      return false
    else
      return true
    end
  end

  # ----- api authentication -----

  # can be called with curl using http_basic authentication
  # curl -u user_name:pass http://bamru.net/reports
  # curl -u user_name:pass http://bamru.net/reports/BAMRU-report.csv
  #    note: user_name should be in the form of user_name, not user.name
  def authenticate_member_with_basic_auth!
    if member = authenticate_with_http_basic { |u,p| Membership.find_by_user_name(u).authenticate(p) }
      session[:member_id] = member.id
    else
      authenticate_api_member!
    end
  end

  def authenticate_api_member!
    unless member_signed_in?
      render :text => "Access Denied", :status => :unauthorized
    end
  end

  def authenticate_mobile_member!(redirect_url = mobile_login_url)
    unless member_signed_in?
      session[:tgt_path] = request.url
      redirect_to redirect_url, :alert => "You must first log in to access this page"
    end
  end

end
