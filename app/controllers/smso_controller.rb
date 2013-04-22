class SmsoController < ApplicationController

  skip_around_filter :scope_current_team

  def index
  end

end
