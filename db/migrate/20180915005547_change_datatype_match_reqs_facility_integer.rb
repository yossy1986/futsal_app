class ChangeDatatypeMatchReqsFacilityInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :match_reqs, :facility, :integer
  end
end
