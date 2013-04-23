require_relative "base/auth"
require_relative "base/notify"
require_relative "base/can_can"
require_relative "base/device_query"

class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :set_time_zone
  around_filter :scope_current_team

  def set_time_zone
    Time.zone = "Pacific Time (US & Canada)"
  end

  def scope_current_team
    Team.current_id = current_team.id
    yeild
  ensure
    Team.current_id = nil
  end

end