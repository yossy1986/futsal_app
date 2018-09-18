class CourtsController < ApplicationController
  def index
    @courts = Facility.all.order(created_at: :desc)
    @pref = Pref
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @court = Facility.find_by(id: params[:id])
    @pref = Pref
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @court = Facility.new
  end
  
  def create
    @court = Facility.new(image: "default_court.jpg",
                          name: params[:facility][:name],
                          pref: params[:facility][:pref],
                          address: params[:facility][:address],
                          tel: params[:facility][:tel],
                          site: params[:facility][:site],
                          open_hour: params[:facility][:open_hour],
                          fee: params[:facility][:fee],
                          parking: params[:facility][:parking])
    if params[:facility][:image]
      @court.image = "court#{@court.id}.jpg"
      image = params[:facility][:image]
      File.binwrite("public/court_images/#{@court.image}",image.read)
    end
    @court.save
    redirect_to action: 'index'
  end
  
  def edit
    @courts = Facility.all.order(created_at: :desc)
    @court = Facility.find_by(id: params[:id])
  end
  
  def update
    @court = Facility.find_by(id: params[:id])
    @court.name = params[:facility][:name]
    @court.pref = params[:facility][:pref]
    @court.address = params[:facility][:address]
    @court.tel = params[:facility][:tel]
    @court.site = params[:facility][:site]
    @court.open_hour = params[:facility][:open_hour]
    @court.fee = params[:facility][:fee]
    @court.parking = params[:facility][:parking]
    if params[:facility][:image]
    @court.image = "court#{@court.id}.jpg"
    image = params[:facility][:image]
    File.binwrite("public/court_images/#{@court.image}",image.read)
    end
    if @court.save
    redirect_to action: 'index'
    else
    render("facilities/edit")
    end
  end
  
  def destroy
    @court = Facility.find_by(id: params[:id])
    @court.destroy
    redirect_to action: 'index'
  end
end
