class HomeController < ApplicationController

  skip_around_filter :scope_current_team
  before_filter      :authenticate_membership!

  def index
  end

  def not_found
  end

  def not_authorized
  end

end
