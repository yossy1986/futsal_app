class HomeController < ApplicationController
  before_action :forbid_login_team,{only:[:top]}
  def top
    render layout: false
  end
  
  def terms
  end
  
  def privacy
  end
  
end
