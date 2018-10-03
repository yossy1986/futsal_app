class HomeController < ApplicationController
  before_action :forbid_login_team
  def top
  end
end
