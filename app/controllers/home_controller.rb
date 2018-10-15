class HomeController < ApplicationController
  before_action :forbid_login_team,{only:[:top]}
  def top
  end
  
  def terms
  end
  
  def privacy
  end
  
  def contact
  end
end
