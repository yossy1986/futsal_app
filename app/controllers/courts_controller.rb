class CourtsController < ApplicationController
  before_action :authenticate_team,:admin_team,{only:[:new,:create,:edit,:update,:destroy]}
  
  PER = 10
  def index
      @courts = Facility.order(created_at: :desc).page(params[:page]).per(PER)
      @court = Facility.new
    if params[:id].present?
      @courts = Facility.where(pref_id: params[:facility][:pref_id]).page(params[:page]).per(PER) if params[:facility][:pref_id].present?
       @prefbox = params[:facility][:pref_id]
    end
  end

  def show
    @court = Facility.find_by(id: params[:id])
  end
  
  def new
    @court = Facility.new
  end
  
  def create
    @court = Facility.new(image: "default_court.jpg",
                          name: params[:facility][:name],
                          pref_id: params[:facility][:pref_id],
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
    @court.pref_id = params[:facility][:pref_id]
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
