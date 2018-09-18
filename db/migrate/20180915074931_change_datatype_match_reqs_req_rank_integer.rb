class ChangeDatatypeMatchReqsReqRankInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :match_reqs, :req_rank, :integer
  end
end
