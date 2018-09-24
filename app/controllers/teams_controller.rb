class TeamsController < ApplicationController
  def index
    @teaminfos = TeamInfo.all.order(created_at: :desc)
    @teaminfo = TeamInfo.new
    @posts = Post.all.order(created_at: :desc)
    @week = Week
  end

  def show
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @teamlevel = TeamLevel.find_by(id: params[:id])
    @posts = Post.all.order(created_at: :desc)
    @week = Week
    gon.data = [@teamlevel.attack,@teamlevel.physical,@teamlevel.stamina,@teamlevel.defense,@teamlevel.tactics,@teamlevel.technique]
  end
  
  def new
    @posts = Post.all.order(created_at: :desc)
    @teaminfo = TeamInfo.new
    @teamlevel = TeamLevel.new
  end
  
  def create
    @posts = Post.all.order(created_at: :desc)
    logger.debug("xxxxxxxxxx = #{params[:team_info][:name]}")
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
    
    @teamlevel = TeamLevel.new(team_info_id: @teaminfo.id,
                                attack: params[:team_level][:attack],
                                physical: params[:team_level][:physical],
                                stamina: params[:team_level][:stamina],
                                defense: params[:team_level][:defense],
                                tactics: params[:team_level][:tactics],
                                technique: params[:team_level][:technique]
                                )
    @teamlevel.level = @teamlevel.attack.to_i + @teamlevel.physical.to_i + @teamlevel.stamina.to_i + @teamlevel.defense.to_i + @teamlevel.tactics.to_i + @teamlevel.technique.to_i
    @teaminfo.rank = @teamlevel.level
    
    if @teaminfo.rank <= 60 && @teaminfo.rank >= 55
            @teaminfo.rank = 1
        elsif @teaminfo.rank <= 54 && @teaminfo.rank >=48 
            @teaminfo.rank = 2
        elsif @teaminfo.rank <= 47 && @teaminfo.rank >= 41
            @teaminfo.rank = 3
        elsif @teaminfo.rank <= 40 && @teaminfo.rank >= 34
            @teaminfo.rank = 4
        elsif @teaminfo.rank <= 33 && @teaminfo.rank >= 27
            @teaminfo.rank = 5
        elsif @teaminfo.rank <= 26 && @teaminfo.rank >= 20
            @teaminfo.rank = 6
        elsif @teaminfo.rank <= 19 && @teaminfo.rank >= 13
            @teaminfo.rank = 7
        else
            @teaminfo.rank = 8
    end
            
    if @teaminfo.save && @teamlevel.save
    redirect_to action: 'index'
    else
      render("teams/new")
    end
  end
  
  def edit
    @posts = Post.all.order(created_at: :desc)
    @teaminfo = TeamInfo.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @teaminfo.name = params[:team_info][:name]
    @teaminfo.pref = params[:team_info][:pref]
    @teaminfo.facility = params[:team_info][:facility]
    @teaminfo.cat = params[:team_info][:cat]
    @teaminfo.age_ave = params[:team_info][:age_ave]
    @teaminfo.comment = params[:team_info][:comment]
    @teaminfo.email = params[:team_info][:email]
    if params[:team_info][:logo] || params[:team_info][:image]
      @teaminfo.logo = "logo#{@teaminfo.id}.jpg"
      @teaminfo.image = "team#{@teaminfo.id}.jpg"
      logo = params[:team_info][:logo]
      image = params[:team_info][:image]
      File.binwrite("public/logo_images/#{@teaminfo.logo}",logo.read)
      File.binwrite("public/team_images/#{@teaminfo.image}",image.read)
    end
    @teaminfo.save
    
    @teamlevel = TeamLevel.find_by(id: params[:id])
    @teamlevel.attack = params[:attack]
    @teamlevel.physical = params[:physical]
    @teamlevel.stamina = params[:stamina]
    @teamlevel.defense = params[:defense]
    @teamlevel.tactics = params[:tactics]
    @teamlevel.technique = params[:technique]
    @teamlevel.level = @teamlevel.attack.to_i + @teamlevel.physical.to_i + @teamlevel.stamina.to_i + @teamlevel.defense.to_i + @teamlevel.tactics.to_i + @teamlevel.technique.to_i
    if @teaminfo && @teamlevel.save
      redirect_to action: 'show'
    else
      render("teams/edit")
    end
  end

  def destroy
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @teamlevel = TeamLevel.find_by(id: params[:id])
    @teaminfo.destroy
    @teamlevel.destroy
    redirect_to action: 'index'
  end
end