class InfoController < ApplicationController

  skip_around_filter :scope_current_team

  def not_authorized
  end

  def domain_not_found
  end

  def page_not_found
  end

  def inactive
  end

  def no_access
  end

  def not_member
  end

end
