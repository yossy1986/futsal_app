class TeamsController < ApplicationController
  def index
    @teaminfos = TeamInfo.all.order(created_at: :desc)
  end

  def show
    @teaminfo = TeamInfo.find_by(id: params[:id])
    @week = %w[日 月 火 水 木 金 土]
    @rank = ["SS","S","A","B","C","D","E","F"]
    @cat = {a: "関西リーグ",b: "都道府県リーグ",c: "競技志向",d: "エンジョイ",e: "女子",f: "MIX" }
    @pref = ["大阪府","兵庫県","京都府","滋賀県","奈良県","和歌山県"]
  end
end
