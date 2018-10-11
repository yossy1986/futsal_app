class TeamsController < ApplicationController
  before_action :authenticate_team || :admin_team,{only:[:edit,:update,:destroy]}
  before_action :forbid_login_team,{only:[:new,:create]}

  def index
    @teaminfos = TeamInfo.all
    @teaminfo = TeamInfo.new
    @week = Week
  end
  
  def serch
    @teaminfo = TeamInfo.new
    @week = Week
    @teaminfos =TeamInfo.all
    if params[:team_info]
    @teaminfos = @teaminfo.serch
  else
    @teaminfos =TeamInfo.all
    end
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
                              logo: "default_logo.jpg",
                              image: "default_team.jpg",
                              pref_id: params[:team_info][:pref_id],
                              facility_id: params[:team_info][:facility_id],
                              cat_id: params[:team_info][:cat_id],
                              age_ave: params[:team_info][:age_ave],
                              comment: params[:team_info][:comment],
                              email: params[:team_info][:email],
                              password: params[:team_info][:password],
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

    @teaminfo.rank_id = @teaminfo.attack.to_i + @teaminfo.physical.to_i + @teaminfo.stamina.to_i + @teaminfo.defense.to_i + @teaminfo.tactics.to_i + @teaminfo.technique.to_i

    if @teaminfo.rank_id <= 60 && @teaminfo.rank_id >= 55
            @teaminfo.rank = 1
    elsif @teaminfo.rank_id <= 54 && @teaminfo.rank_id >=48 
        @teaminfo.rank_id = 2
    elsif @teaminfo.rank_id <= 47 && @teaminfo.rank_id >= 41
        @teaminfo.rank_id = 3
    elsif @teaminfo.rank_id <= 40 && @teaminfo.rank_id >= 34
        @teaminfo.rank_id = 4
    elsif @teaminfo.rank_id <= 33 && @teaminfo.rank_id >= 27
        @teaminfo.rank_id = 5
    elsif @teaminfo.rank_id <= 26 && @teaminfo.rank_id >= 20
        @teaminfo.rank_id = 6
    elsif @teaminfo.rank_id <= 19 && @teaminfo.rank_id >= 13
        @teaminfo.rank_id = 7
    else
        @teaminfo.rank_id = 8
    end
    if @teaminfo.save
      log_in @teaminfo
      flash[:notice] = "登録を受け付けました(#{@teaminfo.name})"
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
    @teaminfo.facility_id = params[:team_info][:facility_id]
    @teaminfo.cat_id = params[:team_info][:cat_id]
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

    @teaminfo.rank_id = @teaminfo.attack.to_i + @teaminfo.physical.to_i + @teaminfo.stamina.to_i + @teaminfo.defense.to_i + @teaminfo.tactics.to_i + @teaminfo.technique.to_i

    
    if @teaminfo.rank_id <= 60 && @teaminfo.rank_id >= 55
            @teaminfo.rank = 1
    elsif @teaminfo.rank_id <= 54 && @teaminfo.rank_id >=48 
        @teaminfo.rank_id = 2
    elsif @teaminfo.rank_id <= 47 && @teaminfo.rank_id >= 41
        @teaminfo.rank_id = 3
    elsif @teaminfo.rank_id <= 40 && @teaminfo.rank_id >= 34
        @teaminfo.rank_id = 4
    elsif @teaminfo.rank_id <= 33 && @teaminfo.rank_id >= 27
        @teaminfo.rank_id = 5
    elsif @teaminfo.rank_id <= 26 && @teaminfo.rank_id >= 20
        @teaminfo.rank_id = 6
    elsif @teaminfo.rank_id <= 19 && @teaminfo.rank_id >= 13
        @teaminfo.rank_id = 7
    else
        @teaminfo.rank_id = 8
    end
    
    if @teaminfo.save
      flash[:notice] = "チームデータを変更しました"
      redirect_to action: 'show'
    else
      render("teams/edit")
    end
  end

  def destroy
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @teaminfo.destroy
    flash[:notice] = "退会しました"
    redirect_to action: 'index'
  end
end