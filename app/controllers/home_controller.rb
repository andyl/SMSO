class HomeController < ApplicationController

  skip_around_filter :scope_current_team

  # before_filter :authenticate_member!, :except => [:contact, :tbd, :about]

  def index
  end

end
