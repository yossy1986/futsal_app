class TeamsController < ApplicationController
  def index
    @teaminfos = TeamInfo.all.order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
    @rank = Rank
    @cat = Cat
    @pref = Pref
    if params[:pref].present?
      @teaminfos = @teaminfos.get_by_pref params[:pref]
    else
      @teaminfos = TeamInfo.all
    end
    
    if params[:rank].present?
      @teaminfos = @teaminfos.get_by_rank params[:rank]
    else
      @teaminfos = TeamInfo.all
    end
    # if params[:cat].present?
    #   @teaminfos = @teaminfos.get_by_cat params[:cat]
    # else
    #   @teaminfos = TeamInfo.all
    # end

  end

  def show
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @posts = Post.all.order(created_at: :desc)
    @week = Week
    @rank = Rank
    @cat = Cat
    @pref = Pref
  end
  
  def new
    @posts = Post.all.order(created_at: :desc)
    @teaminfo = TeamInfo.new
    @teamlevel = TeamLevel.new
  end
  
  def create
    @teaminfo = TeamInfo.new(name: params[:team_info][:name],
                              logo: "default_logo.jpg",
                              image: "default_team.jpg",
                              pref: params[:team_info][:pref],
                              facility: params[:team_info][:facility],
                              cat: params[:team_info][:cat],
                              age_ave: params[:team_info][:age_ave],
                              comment: params[:team_info][:comment],
                              email: params[:team_info][:email],
                              password: params[:team_info][:password]
                              )
    if params[:team_info][:logo] || params[:team_info][:image]
      @teaminfo.logo = "logo#{@teaminfo.id}.jpg"
      @teaminfo.image = "team#{@teaminfo.id}.jpg"
      logo = params[:team_info][:logo]
      image = params[:team_info][:image]
      File.binwrite("public/logo_images/#{@teaminfo.logo}",logo.read)
      File.binwrite("public/team_images/#{@teaminfo.image}",image.read)
    end
    @teaminfo.save
    
    @teamlevel = TeamLevel.new(team_id: @teaminfo.id,
                                attack: params[:team_level][:attack],
                                physical: params[:team_level][:physical],
                                stamina: params[:team_level][:stamina],
                                defense: params[:team_level][:defense],
                                tactics: params[:team_level][:tactics],
                                technique: params[:team_level][:technique]
                                )
    @teamlevel.level = @teamlevel.attack.to_i + @teamlevel.physical.to_i + @teamlevel.stamina.to_i + @teamlevel.defense.to_i + @teamlevel.tactics.to_i + @teamlevel.technique.to_i
    @teamlevel.save
    redirect_to action: 'index'
  end
  
end