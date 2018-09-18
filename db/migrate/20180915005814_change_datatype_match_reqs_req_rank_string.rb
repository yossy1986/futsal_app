class ChangeDatatypeMatchReqsReqRankString < ActiveRecord::Migration[5.2]
  def change
    change_column :match_reqs, :req_rank, :string
  end
end
