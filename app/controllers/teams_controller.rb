class TeamsController < ApplicationController
  before_action :authenticate_team || :admin_team,{only:[:edit,:update,:destroy]}
  before_action :forbid_login_team,{only:[:new,:create]}

  PER = 10
  def index
      @teaminfos = TeamInfo.order(created_at: :desc).page(params[:page]).per(PER)
      @teaminfo = TeamInfo.new
      @week = Week
      @pref = Pref.all
    if params[:id].present?
      @teaminfos = @teaminfos.where(pref_id: params[:team_info][:pref_id]) if params[:team_info][:pref_id].present?
      @teaminfos = @teaminfos.where(facility_id: params[:teaminfo][:facility_id]) if params[:teaminfo][:facility_id].present?
      @teaminfos = @teaminfos.where(cat_id: params[:team_info][:cat_id]) if params[:team_info][:cat_id].present?
    end
  end
  
  def get_facilities
    render partial: 'select_facility', locals: {pref_id: params[:pref_id]}
  end

  def show
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @week = Week
    gon.data = [@teaminfo.attack,@teaminfo.physical,@teaminfo.stamina,@teaminfo.defense,@teaminfo.tactics,@teaminfo.technique]
  end
  
  def new
    @teaminfo = TeamInfo.new
  end
  
  def create
    logger.debug("xxxxxxxxxx = #{params[:team_info][:name]}")
    @teaminfo = TeamInfo.new(name: params[:team_info][:name],
                              logo: "default-logo-image.jpg",
                              image: "default-team-image.jpg",
                              pref_id: params[:team_info][:pref_id],
                              facility_id: params[:teaminfo][:facility_id],
                              cat_id: params[:team_info][:cat_id],
                              age_ave: params[:team_info][:age_ave],
                              comment: params[:team_info][:comment],
                              email: params[:team_info][:email],
                              password: params[:team_info][:password],
                              password_confirmation: params[:team_info][:password_confirmation],
                              attack: params[:team_info][:attack],
                              physical: params[:team_info][:physical],
                              stamina: params[:team_info][:stamina],
                              defense: params[:team_info][:defense],
                              tactics: params[:team_info][:tactics],
                              technique: params[:team_info][:technique]
                              )
    if params[:team_info][:logo]
      @teaminfo.logo = "logo#{@teaminfo.id}.jpg"
      logo = params[:team_info][:logo]
      File.binwrite("public/logo_images/#{@teaminfo.logo}",logo.read)
    end
    if params[:team_info][:image]
      @teaminfo.image = "team#{@teaminfo.id}.jpg"
      image = params[:team_info][:image]
      File.binwrite("public/team_images/#{@teaminfo.image}",image.read)
    end

    if @teaminfo.save
      log_in @teaminfo
      flash[:success] = "登録を受け付けました(#{@teaminfo.name})"
      redirect_to("/matchs")
    else
      render("teams/new")
    end
  end

  
  def edit
    @teaminfo = TeamInfo.find_by(id: params[:id])
  end
  
  def update
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @teaminfo.email = params[:team_info][:email]
    @teaminfo.password = params[:team_info][:password]
    @teaminfo.name = params[:team_info][:name]
    @teaminfo.pref_id = params[:team_info][:pref_id]
    @teaminfo.facility_id = params[:teaminfo][:facility_id]
    @teaminfo.age_ave = params[:team_info][:age_ave]
    @teaminfo.comment = params[:team_info][:comment]
    @teaminfo.attack  = params[:team_info][:attack]
    @teaminfo.defense  = params[:team_info][:defense]
    @teaminfo.technique  = params[:team_info][:technique]
    @teaminfo.tactics  = params[:team_info][:tactics]
    @teaminfo.stamina  = params[:team_info][:stamina]
    @teaminfo.physical  = params[:team_info][:physical]
    if params[:team_info][:logo]
      @teaminfo.logo = "logo#{@teaminfo.id}.jpg"
      logo = params[:team_info][:logo]
      File.binwrite("public/logo_images/#{@teaminfo.logo}",logo.read)
    end
    if params[:team_info][:image]
      @teaminfo.image = "team#{@teaminfo.id}.jpg"
      image = params[:team_info][:image]
      File.binwrite("public/team_images/#{@teaminfo.image}",image.read)
    end

    if @teaminfo.save
      flash[:success] = "チームプロフィールを変更しました"
      redirect_to action: 'show'
    else
      render("teams/edit")
    end
  end

  def destroy
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @teaminfo.destroy
    flash[:danger] = "退会しました"
    redirect_to action: 'index'
  end
end