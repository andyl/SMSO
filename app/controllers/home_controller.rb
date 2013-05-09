class HomeController < ApplicationController

  skip_around_filter :scope_current_team
  before_filter      :authenticate_active!

  def index
  end

end
