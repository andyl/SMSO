class ZesbController < ApplicationController

  before_filter :authenticate_active!

  skip_around_filter :scope_current_team

  def index;     end

  def banded;    end
  def blog;      end
  def feed;      end
  def grid;      end
  def orbit;     end
  def banner;    end
  def sidebar;   end
  def contact;   end
  def marketing; end
  def realty;    end
  def boxy;      end
  def store;     end
  def workspace; end

  def icons;     end
  def tables;    end

end
